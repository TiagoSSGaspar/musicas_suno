require('dotenv').config();
const axios = require('axios');
const fs = require('fs');
const path = require('path');
const readline = require('readline');
const { randomUUID } = require('crypto');

const BASE_DIR = __dirname;
const SALMOS_DIR = path.join(BASE_DIR, 'salmos-arc');
const ESTILOS_FILE = path.join(BASE_DIR, 'estilos_suno.txt');

// 1. Carregar Headers do .env
const AUTH_BEARER = process.env.SUNO_BEARER;
const BROWSER_TOKEN = process.env.SUNO_BROWSER_TOKEN;
const DEVICE_ID = process.env.SUNO_DEVICE_ID || '17d158fd-5210-4000-a6fc-1fb07aeb22bf';
// Personas a serem carregadas do json em tempo de execução
// USER_TIER e TURNSTILE são opcionais — lidos do env se existirem
const USER_TIER = process.env.SUNO_USER_TIER || null;
const TURNSTILE_TOKEN = process.env.SUNO_TURNSTILE_TOKEN || null;

if (!AUTH_BEARER || !BROWSER_TOKEN) {
    console.error("❌ ERRO: SUNO_BEARER e SUNO_BROWSER_TOKEN não definidos no .env!");
    console.error("Crie um arquivo .env na pasta coias_suno com suas credenciais.");
    process.exit(1);
}

const PERSONAS_FILE = path.join(BASE_DIR, 'personas_suno.json');

const getHeaders = () => ({
    'accept': '*/*',
    'accept-language': 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7',
    'authorization': `Bearer ${AUTH_BEARER}`,
    'browser-token': BROWSER_TOKEN,
    'device-id': DEVICE_ID,
    'dnt': '1',
    'origin': 'https://suno.com',
    'priority': 'u=1, i',
    'referer': 'https://suno.com/',
    'sec-ch-ua': '"Not:A-Brand";v="99", "Google Chrome";v="145", "Chromium";v="145"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"macOS"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-site',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36'
});


const api = axios.create({
    baseURL: 'https://studio-api.prod.suno.com/api',
    timeout: 30000
});

const delay = ms => new Promise(res => setTimeout(res, ms));

const rlInput = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
const question = query => new Promise(resolve => rlInput.question(query, resolve));

// Func: Consultar Concorrência Atual
async function getConcurrentStatus() {
    try {
        const res = await api.get('/generate/concurrent-status', { headers: getHeaders() });
        return res.data;
    } catch (e) {
        console.error("❌ Erro ao consultar limite de concorrência:", e.response?.data || e.message);
        return null;
    }
}

// Func: Criar Música
async function createSong(title, prompt, tags, personaId) {
    const payload = {
        "project_id": "285f4488-c4e8-4a47-8209-4aa29262b952",
        "token": TURNSTILE_TOKEN,
        "task": "vox",
        "generation_type": "TEXT",
        "title": title.substring(0, 80),
        "tags": tags.substring(0, 200),
        "negative_tags": "",
        "mv": "chirp-crow",
        "prompt": prompt.substring(0, 5000),
        "make_instrumental": false,
        "user_uploaded_images_b64": null,
        "persona_id": personaId,
        "metadata": {
            "web_client_pathname": "/create",
            "is_max_mode": false,
            "is_mumble": false,
            "create_mode": "custom",
            "user_tier": USER_TIER,
            "create_session_token": randomUUID(),
            "disable_volume_normalization": false
        },
        "override_fields": ["prompt", "tags"],
        "cover_clip_id": null,
        "cover_start_s": null,
        "cover_end_s": null,
        "artist_clip_id": null,
        "artist_start_s": null,
        "artist_end_s": null,
        "continue_clip_id": null,
        "continued_aligned_prompt": null,
        "continue_at": null,
        "transaction_uuid": randomUUID()
    };

    try {
        const res = await api.post('/generate/v2-web/', payload, { headers: getHeaders() });
        return res.data;
    } catch (e) {
        if (e.response && e.response.status === 402) {
             console.error("❌ Erro 402: Faltam créditos na conta Suno!");
             process.exit(1);
        }
        console.error("❌ Erro ao submeter música ao Suno:", e.response?.data || e.message);
        return null;
    }
}

// Lógica de Leitura de Estilos
function loadStyles() {
    if (!fs.existsSync(ESTILOS_FILE)) return [];
    const lines = fs.readFileSync(ESTILOS_FILE, 'utf8').split('\n');
    const styles = [];
    let currentName = "";
    
    for (const line of lines) {
        const trimmed = line.trim();
        if (!trimmed || trimmed.startsWith('#')) continue;
        
        if (trimmed.startsWith('[')) {
            currentName = trimmed.replace('[', '').replace(']', '');
        } else if (currentName) {
            styles.push({ name: currentName, prompt: trimmed });
            currentName = "";
        }
    }
    return styles;
}

// Função Principal
async function main() {
    console.log("🎵 Suno API Direct — Geração em Massa Oculta\n");

    // Verificar conexão e credenciais
    console.log("⏳ Testando credenciais Suno...");
    const status = await getConcurrentStatus();
    if (!status) {
        console.error("❌ Falha na autenticação. Verifique os Tokens no .env!");
        process.exit(1);
    }
    console.log(`✅ Conectado! Músicas gerando agora: ${status.running_jobs}/${status.max_concurrent}\n`);

    const startIdxStr = await question("👉 Qual o número inicial? (ex: 1): ");
    const endIdxStr = await question("👉 Qual o número final? (ex: 10): ");
    
    const startIdx = parseInt(startIdxStr);
    const endIdx = parseInt(endIdxStr);

    if (isNaN(startIdx) || isNaN(endIdx) || startIdx > endIdx) {
        console.error("❌ Range inválido.");
        process.exit(1);
    }

    const styles = loadStyles();
    if (styles.length === 0) {
        console.error("❌ Nenhum estilo encontrado em estilos_suno.txt.");
        process.exit(1);
    }

    console.log("\n🎵 Estilos disponíveis:");
    styles.forEach((s, idx) => console.log(`  [${idx + 1}] ${s.name}`));
    const styleChoiceStr = await question("\n👉 Selecione o número do estilo base (Padrão: 1): ");
    const styleIdx = parseInt(styleChoiceStr) - 1 || 0;
    
    if (styleIdx < 0 || styleIdx >= styles.length) {
         console.error("❌ Opção inválida.");
         process.exit(1);
    }
    
    const chosenStyle = styles[styleIdx];
    console.log(`✅ Estilo Base escolhido: ${chosenStyle.name}\n`);

    // Carregar e escolher Personas
    let personas = [];
    if (fs.existsSync(PERSONAS_FILE)) {
        try {
            const data = JSON.parse(fs.readFileSync(PERSONAS_FILE, 'utf8'));
            personas = data.personas || [];
        } catch (e) {
            console.error("⚠️ Erro ao carregar personas_suno.json");
        }
    }

    if (personas.length === 0) {
        console.error("❌ Nenhuma persona encontrada no arquivo personas_suno.json.");
        process.exit(1);
    }

    console.log("👤 Personas disponíveis (Suas vozes pré-salvas no Suno):");
    personas.forEach((p, idx) => {
        console.log(`  [${idx + 1}] ${p.name} - ${p.description || ''}`);
    });
    
    let personaIdx = 0;
    while (true) {
        const personaChoiceStr = await question("\n👉 Selecione o número da Persona que quer usar: ");
        const idx = parseInt(personaChoiceStr) - 1;
        if (idx >= 0 && idx < personas.length) {
            personaIdx = idx;
            break;
        }
        console.error("❌ Opção de persona inválida.");
    }

    const chosenPersona = personas[personaIdx];
    console.log(`✅ Persona escolhida: ${chosenPersona.name}\n`);

    const randVocalsStr = await question("👉 Você quer adicionar tags extras de vozes randômicas (homem/mulher/duo)? \nNota: Usar tags com Personas pode confundir a IA, que tentará mesclar a voz da persona com a tag solicitada. (s/n): ");
    const isRandomizeVocals = randVocalsStr.toLowerCase().startsWith('s');

    console.log("\n🚀 Iniciando Lote de Geração via API...");

    for (let i = startIdx; i <= endIdx; i++) {
        const numFormatted = i.toString().padStart(3, '0');
        const folderName = `salmo-${numFormatted}`;
        const filePath = path.join(SALMOS_DIR, folderName, `${folderName}.txt`);

        if (!fs.existsSync(filePath)) {
            console.log(`⚠️ Arquivo não encontrado: ${filePath}`);
            continue;
        }

        const fileContent = fs.readFileSync(filePath, 'utf8').split('\n');
        const title = fileContent[0].trim();
        
        let startLyricsIdx = 1;
        while(startLyricsIdx < fileContent.length && (!fileContent[startLyricsIdx].trim() || fileContent[startLyricsIdx].startsWith('Versão'))) {
            startLyricsIdx++;
        }
        const lyrics = fileContent.slice(startLyricsIdx).join('\n').trim();

        let finalStylePrompt = chosenStyle.prompt;
        let vocalDesc = "Padrão do estilo";

        if (isRandomizeVocals) {
            const vocalTypes = ["male vocal", "female vocal", "male duo vocals", "female duo vocals", "choir vocals"];
            const randVocal = vocalTypes[Math.floor(Math.random() * vocalTypes.length)];
            finalStylePrompt = `${chosenStyle.prompt}, ${randVocal}`;
            vocalDesc = randVocal;
        }

        console.log(`\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`);
        console.log(`🎶 Processando Salmo ${numFormatted}`);
        console.log(`🏷️  Título: ${title}`);
        console.log(`🎤 Voz: ${vocalDesc}`);

        // CHECAR LIMITE DE CONCORRÊNCIA (Evitar erro Too Many Requests)
        let currentStatus = await getConcurrentStatus();
        while (currentStatus && currentStatus.running_jobs >= currentStatus.max_concurrent) {
            console.log(`⏳ Fila cheia (${currentStatus.running_jobs}/${currentStatus.max_concurrent}). Aguardando 15s...`);
            await delay(15000);
            currentStatus = await getConcurrentStatus();
        }

        console.log(`📡 Enviando para a API do Suno com Persona [${chosenPersona.name}]...`);
        const jobResult = await createSong(title, lyrics, finalStylePrompt, chosenPersona.id);

        if (jobResult && jobResult.id) {
            console.log(`✅ SUCESSO! Job ID: ${jobResult.id}`);
            if (jobResult.clips && jobResult.clips.length > 0) {
                 jobResult.clips.forEach(clip => {
                     console.log(`   🔸 Clip Criado: ${clip.id} [${clip.status}]`);
                 });
            }
        } else {
            console.log(`❌ Falha ao enviar a música. Pulando...`);
        }

        // Respirar um pouco entre requisições para evitar rate limit do Cloudflare
        if (i < endIdx) {
            console.log(`⏳ Pausa de 30s antes do próximo...`);
            await delay(30000);
        }
    }

    console.log(`\n🎉 Lote de geração finalizado! Você pode acompanhar as faixas no site do Suno.\n`);
    rlInput.close();
}

main();
