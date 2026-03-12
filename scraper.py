import urllib.request
import urllib.parse
import re
import os
import json
import ssl

context = ssl._create_unverified_context()

base_url = "https://www.letras.mus.br"
artist_slug = "gabriela-rocha"
artist_url = f"{base_url}/{artist_slug}/mais_acessadas.html"
target_dir = f"/Users/tiagosouzasilvagaspar/Downloads/coias_suno/projeto_music/ispiracao/Gabriela-Rocha"

os.makedirs(target_dir, exist_ok=True)

headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
}

def get_html(url):
    try:
        req = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(req, context=context) as response:
            return response.read().decode('utf-8', errors='ignore')
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return None

def main():
    print("Fetching artist page...")
    html = get_html(artist_url)
    if not html:
        return

    # Find song links
    # Extract all hrefs starting with /artist_slug/
    
    links = re.findall(r'href="(/%s/[^/]+/[^"]*)">([^<]+)</a>' % artist_slug, html)
    song_links = set()
    for match in re.finditer(r'href="(/%s/([^/]+)/)"' % artist_slug, html):
        link = match.group(1)
        name = match.group(2)
        if name not in ['discografia', 'fotos', 'biografia', 'traducao', 'cifras']:
            song_links.add(link)

    print(f"Found {len(song_links)} song candidate links.")
    
    saved_count = 0
    
    for link in song_links:
        song_url = base_url + link
        song_name = link.split('/')[-2].replace('-', ' ').title()
        file_path = os.path.join(target_dir, f"{song_name}.txt")
        
        if os.path.exists(file_path):
            continue
            
        print(f"Fetching {song_name}...")
        song_html = get_html(song_url)
        if not song_html:
            continue
            
        # Find the actual song title
        title_match = re.search(r'<h1[^>]*>(.*?)</h1>', song_html, re.IGNORECASE)
        if title_match:
            song_name = re.sub(r'<[^>]+>', '', title_match.group(1)).strip()
        
        # Try to find lyrics in the HTML
        # <div class="lyric-original"> or <div class="cnt-letra">
        # In Letras, the lyrics are usually inside <div class="lyric-original">
        # We can extract paragraphs inside it.
        
        lyric_match = re.search(r'<div class="lyric-original[^>]*>(.*?)</div>', song_html, re.DOTALL)
        if lyric_match:
            lyrics_html = lyric_match.group(1)
        else:
            lyric_match = re.search(r'<div class="lyric[^>]*>(.*?)</div>', song_html, re.DOTALL)
            if lyric_match:
                lyrics_html = lyric_match.group(1)
            else:
                print(f"  -> Lyrics not found for {song_name}")
                continue
                
        # Clean lyrics HTML
        # replace <br> with newline, remove other tags
        lyrics_text = re.sub(r'<br\s*/?>', '\n', lyrics_html, flags=re.IGNORECASE)
        lyrics_text = re.sub(r'<p>', '', lyrics_text, flags=re.IGNORECASE)
        lyrics_text = re.sub(r'</p>', '\n\n', lyrics_text, flags=re.IGNORECASE)
        lyrics_text = re.sub(r'<[^>]+>', '', lyrics_text)
        
        import html
        lyrics_text = html.unescape(lyrics_text)
        
        lyrics_text = "\n".join([line.strip() for line in lyrics_text.split('\n')])
        lyrics_text = re.sub(r'\n{3,}', '\n\n', lyrics_text).strip()
        
        if len(lyrics_text) < 50: # likely not true lyrics
            print(f"  -> Too short lyrics for {song_name}")
            continue

        # Safe filename
        safe_name = re.sub(r'[\\/*?:"<>|]', "", song_name)
        file_path = os.path.join(target_dir, f"{safe_name}.txt")

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(f"Title: {song_name}\n\n{lyrics_text}")
        
        saved_count += 1
        print(f"  -> Saved {song_name}.txt")
            
    print(f"Finished! Saved {saved_count} new songs.")

if __name__ == "__main__":
    main()
