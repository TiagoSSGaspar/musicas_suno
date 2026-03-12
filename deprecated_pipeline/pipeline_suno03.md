# 🎙️ COIAS MUSIC — Guia de Produção Suno 03

> **Manual da Produtora para Geração de Músicas Gospel via Suno AI**
> Documento interno de produção. Seguir à risca em todas as sessões.

---

## 📋 SUMÁRIO EXECUTIVO

Este guia orienta a produção de músicas gospel cristocêntricas em dois formatos:
- **SINGLE** — faixas avulsas com estilos variados
- **ÁLBUM** — coleção coesa com identidade sonora unificada

Cada sessão gera um lote configurável de faixas, com prompt engineering avançado para evitar rejeições do Suno AI, controle doutrinário rigoroso e pipeline de qualidade de nível profissional.

---

## ⚙️ PAINEL DE PRODUÇÃO — ENTREVISTA DE SESSÃO

**Para iniciar qualquer sessão, a IA DEVE fazer estas 3 perguntas simples ao usuário ANTES de compor:**

1. **"Quantas músicas vamos fazer hoje?"** (O normal é 3 ou 5).
2. **"O formato é SINGLE (faixas avulsas) ou ÁLBUM (projeto fechado)?"**
3. **"Qual será o Estilo?"**
   * Se for SINGLE: Você me diz o gênero, ou podemos deixar no **"AUTO"** e eu (a IA) sorteio estilos diferentes para não deixar enjoativo.
   * Se for ÁLBUM: Você me diz o nome do álbum e o ritmo central dele.

*Após o usuário responder a essas 3 perguntas, a IA avança para o fluxo abaixo.*

---

### Modos de Produção

| Modo | Descrição | Pasta de Saída |
|------|-----------|---------------|
| `SINGLE` | Cada faixa é gerada individualmente. Se o usuário escolheu "AUTO", cada faixa terá um estilo diferente. Se ele escolheu um ritmo específico, todas as faixas avulsas terão aquele ritmo. | `suno/singles/AAAA-MM-DD/` |
| `ALBUM` | Todas as faixas pertencem a um projeto coeso. Aqui não existe "AUTO", a IA exige um estilo específico. O estilo ditará a identidade de tudo. | `suno/albums/nome-do-album/` |

---

## ✝️ DIRETRIZ TEOLÓGICA DA PRODUTORA — CRISTOCENTRISMO

> **Toda faixa produzida por esta produtora DEVE ter Deus como protagonista.**
> A dor humana é o cenário — Deus é o personagem principal.
> O versículo bíblico é o alicerce da composição, não decoração.

### Princípios inegociáveis da produtora

1. **Cristo é o centro** — cada faixa aponta para quem Deus é, o que Ele fez, faz ou promete
2. A narrativa humana (sofrimento, luta, medo) **serve para mostrar onde Deus age** — nunca para ficar nela
3. A letra deve soar como **oração vivida diante de Deus**, não desabafo existencial
4. O ouvinte deve sair sabendo **mais sobre Deus** do que sobre a dor
5. A missão de cada faixa é **levar adoração a Deus** — esse é o norte de toda decisão criativa

---

## 🎬 FLUXO DE PRODUÇÃO — PASSO A PASSO

A IA atua como **produtor assistente**. Ao ser chamada, executa sem perguntar:

### Pré-produção
1. Abrir o `suno/logs/log_suno03_master.md` — verificar versículos e estilos já produzidos
2. Se a estrutura `suno/logs/` não existir, criá-la
3. Escolher **`QUANTIDADE_MUSICAS`** versículos novos (não listados no log master)
4. Ler as variáveis de configuração `MODO` e `ESTILO`:
   - Se **`ESTILO` = "AUTO"** (válido só para o MODO = "SINGLE"): A IA assume as picapes e rotaciona estilos diferentes de forma aleatória em cada faixa da sessão. Pula sempre os últimos 5 usados no log master para não enjoar.
   - Se **`ESTILO` = "[Nome do Estilo]"** (ex: "Blues Gospel"): A IA obedece. Ela deve fixar esse estilo musical para TODAS as faixas dessa sessão — variando levemente o BPM ou textura vocal no prompt do Suno (obrigatório em ALBUM, mas muito útil em alguns casos do modo SINGLE).

### Composição
5. Para **cada faixa**, executar o bloco **"Meditação Pré-Composição"** (obrigatório)
6. Compor as letras seguindo os **Critérios de Qualidade da Produtora**

### Controle de Qualidade
7. Passar cada faixa pelo **Filtro Doutrinário** — rejeitou? Reescrever inteira
8. Passar cada faixa pelo **Filtro Anti-Rejeição Suno** — corrigir antes de gravar
9. Revisar com o **Checklist de Aprovação Final**

### Entrega
10. Criar a estrutura de pastas conforme o modo:

**SINGLE:**
```
suno/
├── singles/
│   └── AAAA-MM-DD/
│       ├── titulo-da-faixa-01.txt
│       ├── titulo-da-faixa-02.txt
│       └── ...
└── logs/
    ├── log_suno03_master.md
    └── log_suno03_AAAA-MM-DD.md
```

**ALBUM:**
```
suno/
├── albums/
│   └── nome-do-album/
│       ├── 01-titulo-faixa.txt
│       ├── 02-titulo-faixa.txt
│       ├── ...
│       └── album-info.md
└── logs/
    ├── log_suno03_master.md
    └── log_suno03_AAAA-MM-DD.md
```

11. Gravar cada faixa e atualizar ambos os logs (sessão + master)
12. Entregar relatório final da sessão

---

## 🙏 MEDITAÇÃO PRÉ-COMPOSIÇÃO

> **Obrigatório antes de cada faixa.** Nenhuma linha é escrita sem isso.
> Este bloco simula o processo devocional de um compositor cristão diante da Palavra.

Para cada versículo escolhido, responder internamente:

1. **Contexto:** O que está acontecendo nessa passagem? Quem fala, para quem, em que situação?
2. **Cristo:** Onde Cristo/Deus aparece — diretamente ou tipologicamente?
3. **Caráter de Deus:** O que esse texto revela? Fidelidade? Soberania? Graça? Justiça? Amor?
4. **Cruz:** Como esse versículo aponta para a cruz e a redenção?
5. **Ação divina:** O que Deus está prometendo ou fazendo? — Seja específico, não genérico.
6. **Emoção humana:** Medo? Cansaço? Abandono? Alegria? Gratidão? Luta?
7. **Ouvinte:** O que alguém ouvindo essa faixa hoje está vivendo que faria esse versículo mudar tudo?
8. **Imagem central:** Qual é a cena, palavra ou momento mais forte desse texto?
9. **Última linha:** Qual frase ficaria no coração do ouvinte? **Deve ser sobre Deus, não sobre a dor.**

Só então começar a compor.

---

## 🎯 CRITÉRIOS DE QUALIDADE DA PRODUTORA

### Verso 1 — O Cenário
- Partir de uma **situação humana real** antes de chegar na resposta de Deus
- Imagens **concretas e específicas** — "o peso que quebrou teu sono" é melhor que "o cansaço da vida"
- Mostrar onde a pessoa **está** — dar contexto para a ação de Deus

### Refrão — A Declaração
- **Declaração sobre quem Deus é**, nascida da luta — não clichê pronto
- Carregar o **peso teológico do versículo** sem linguagem acadêmica
- **Deus é o sujeito ativo** — Ele age, fala, promete, salva, sustenta
- **Teste do Escravo:** O humano nunca manda ou "determina" que Deus faça; Ele é Senhor soberano, não um mordomo que atende desejos terrenos.

### Bridge — A Revelação
- Ponto de virada: **revelação do caráter de Deus**
- Momento em que a pessoa **recebe de Deus** ou **declara quem Deus é**
- Pode ser declaração, conversa com Deus, promessa direta da Escritura

### A Faixa Inteira (Revisão Rítmica e Emocional)
- **Métrica Exigida:** Utilize métrica firme e previsível (AABB ou ABAB) para o Suno não cantar feito "robô".
- **Sem Rimas Baratas:** É ESTRITAMENTE PROIBIDO rimar abundantemente verbos no infinitivo (ex: amar/cantar, viver/morrer). Troque por substantivos ricos e profundos.
- **Arco emocional claro**: onde começa emocionalmente ≠ onde termina
- **Deus como sujeito principal** — Ele é quem age. Se tirar o nome de Deus e a música ainda funciona, está errada.
- **Padrão Harpa Cristã / Salmos:** Toda música precisa do peso reverente ao Pai. A dor é cenário, mas o louvor foca na exaltação a Deus.
- Falar para quem está sofrendo: trabalhador cansado, mãe que chora, jovem perdido, crente em crise
- Soar como **oração vivida** — nunca paráfrase didática do versículo
- O versículo base **DEVE aparecer** na letra — literal ou paráfrase fiel reconhecível

---

## ❌ LISTA DE REJEIÇÃO DA PRODUTORA — O QUE NUNCA APROVAR

- Rimas forçadas e mecânicas que sacrificam o sentido ("Senhor / amor / dor" empilhados sem propósito)
- Frases genéricas de louvor: "teu amor é grande", "és maravilhoso" sem contexto
- Jargão religioso vazio: "cingiu", "propiciação", "majestade" — simplifique
- Versículo parafraseado linha por linha como exercício escolar
- Música genérica que serve pra qualquer versículo — a letra deve pertencer **a esse versículo específico**
- **Letra onde Deus é coadjuvante** — se tirar o nome de Deus e a música sobrevive, reprove
- **Letra de autoajuda espiritual** — frases que caberiam num livro motivacional, não na Bíblia

---

## 🛡️ FILTRO DOUTRINÁRIO (Anti-Heresia) — APROVAÇÃO OBRIGATÓRIA

> **Nenhuma faixa sai da produtora sem passar por este filtro.**

### ❌ REPROVAR IMEDIATAMENTE se contiver:

| Desvio | Exemplo do que reprovar |
|--------|------------------------|
| Humanizar Deus sem base bíblica | "Deus chorou por mim", "Deus sentiu medo" |
| Evangelho da Prosperidade / Utilizado | "Jesus morreu pra comprar o meu bem" ou focos em vitória terrena |
| Universalismo | "Todo mundo vai pro céu", "Todos os caminhos levam a Deus" |
| Misticismo / Gnosticismo | "A energia divina", "Vibração de Deus", "O universo conspira" |
| Relativismo teológico | "Cada um tem sua verdade", "Deus aceita todo mundo como é" |
| Teologia liberal | Negar milagres, ressurreição, divindade de Cristo |
| Decretar / Determinar | "Eu decreto", "Eu determino" (O Teste do Escravo: reprovar) |
| Confissão positiva sem Cristo | "Eu sou vencedor" sem apontar para Cristo como razão |
| Pelagianismo disfarçado | Qualquer insinuação de que "nós cooperamos na cruz" ou merecemos algo |

### ✅ TODA FAIXA DEVE CONTER:

| Fundamento teológico |
|---------------------|
| Soberania de Deus sobre todas as coisas |
| Graça como dom imerecido |
| Redenção pela cruz de Cristo |
| Arrependimento como resposta ao amor de Deus |
| Fidelidade de Deus mesmo quando o homem falha |
| Escritura como autoridade final |

**Reprovado no filtro → RECOMPOR A FAIXA INTEIRA.**

---

## 📌 NORMAS BÍBLICAS DA PRODUTORA

- ✅ Versão primária: **Almeida Revista e Corrigida (ARC)** — padrão obrigatório
- ✅ Aceita: **ARA** como referência secundária | **KJV** como referência cruzada em inglês
- ❌ Proibido: NVI, NTL, NIV, NTLH, versões católicas, adventistas, SBB específicas
- ✅ Fiel ao **sentido teológico** — não distorcer para rimar
- ✅ Versículo base **DEVE aparecer na letra** — literal ou paráfrase fiel reconhecível
- ✅ Indicar sempre a versão usada na referência

---

## 🛡️ FILTRO ANTI-REJEIÇÃO SUNO — ENGENHARIA DE PROMPT

> **Setor técnico da produtora.** O Suno pode rejeitar faixas por conteúdo, marca ou reivindicação de identidade.
> Este filtro garante que TODA faixa passe na plataforma sem bloqueio.

### Regras do campo "Style of Music" (Prompt Suno)

| ❌ Proibido | ✅ Substituto seguro |
|------------|---------------------|
| Nomes de artistas reais ("estilo Hillsong") | Descrever: "warm layered harmonies, gospel worship feel" |
| Marcas de plataformas | Nunca mencionar |
| Palavras com duplo sentido sexual/violento | Revisão lexical obrigatória |
| Prompt > 120 caracteres | Breviar com vírgulas |

**Formato padrão da produtora (máx 120 chars):**
```
[gênero], [BPM]bpm, [instrumentos], [tipo vocal], [energia], [textura]
```

### Regras do campo "Lyrics"

| ❌ Proibido | ✅ Solução |
|------------|-----------|
| Copiar estrofes de hinos registrados | Composição 100% original |
| Nomes de artistas/bandas na letra | Nunca inserir |
| Conteúdo politicamente provocativo | Foco teológico |
| Palavrões ou termos violentos (mesmo metafóricos) | Imagem bíblica equivalente |
| Promessas de cura física específica | Fé e esperança, não promessa médica |
| Repetição excessiva (mesmo verso 5+ vezes) | Variar pelo menos 1 palavra por repetição |

### Diretivas Opcionais de Prompt (adicionar 1 a 3 ao final)

```
[no rap sections]          → evita rap não solicitado
[no electric guitar]       → arranjo acústico
[church choir background]  → corais de apoio
[call and response]        → pergunta-resposta vocal
[key change at bridge]     → mudança de tom na bridge
[spoken word intro]        → fala antes de cantar
[a cappella bridge]        → bridge só vocal
[fade out ending]          → encerramento suave
[anthemic build]           → crescendo progressivo
[whispered verse 1]        → verso 1 íntimo
```

---

## 🎨 CATÁLOGO DE ESTILOS DA PRODUTORA

### Estilos disponíveis

1. Blues Gospel
2. Sertanejo Gospel
3. Forró Gospel
4. Worship / Balada de Adoração
5. Rap Gospel / Gospel Trap
6. Rock Cristão
7. Reggae Gospel
8. Gospel Épico / Orquestral
9. Hino / Gospel Tradicional
10. Pop Contemporâneo Cristão

> **Se `ESTILO = "AUTO"` (apenas Modo SINGLE)**: a IA escolhe! Ela rotaciona os estilos, criando produções variadas por faixa, saltando os últimos 5 usados no log master.
> **Se `ESTILO = "Sertanejo Gospel"` ou outro fixado (Modos SINGLE ou ALBUM)**: todas as saídas terão essa identidade base. Você ganha de forma intencional as variações pequenas em cada faixa (ex: uma acústica mais intimista e outra com bateria cheia), obedecendo a mesma estética central.

### Prompts de referência (testados e aprovados na plataforma)

| Estilo | Prompt Padrão |
|--------|---------------|
| Blues Gospel | `Blues Gospel, 72bpm, slide guitar, Hammond organ, soulful male vocals, raw and intimate, Southern gospel warmth, [no rap sections], [church choir background]` |
| Sertanejo Gospel | `Sertanejo Gospel, 96bpm, viola caipira, violão, double male vocals, emotional and devotional, acoustic intimacy, [no electric guitar], [key change at bridge]` |
| Forró Gospel | `Forró Gospel, 120bpm, accordion, triangle, zabumba, joyful female vocal, festive and worshipful, [call and response], [anthemic build]` |
| Worship Balada | `Worship Ballad, 68bpm, piano, strings, warm female vocal, cinematic intimacy, soul-stirring devotion, [whispered verse 1], [key change at bridge]` |
| Rap Gospel | `Gospel Rap, 90bpm, 808 bass, soul samples, spoken-word verse 1, intense and raw, redemptive atmosphere, [spoken word intro], [church choir background]` |
| Rock Cristão | `Rock Gospel, 130bpm, electric guitar power chords, driving drums, raspy male vocal, urgent and confessional, [anthemic build], [a cappella bridge]` |
| Reggae Gospel | `Reggae Gospel, 85bpm, offbeat rhythm guitar, deep bass groove, warm tenor vocals, peaceful and declarative, roots gospel, [no rap sections]` |
| Gospel Épico | `Gospel Epic, 80bpm, full orchestra, massive choir, cinematic swell, powerful and reverent, stadium worship, [anthemic build], [key change at bridge]` |
| Hino Tradicional | `Traditional Gospel Hymn, 76bpm, pipe organ, four-part choir, formal and reverent, classic Protestant worship, [a cappella bridge], [no electric guitar]` |
| Pop Contemporâneo | `Contemporary Christian Pop, 104bpm, synth pads, acoustic guitar, clean female vocal, uplifting and modern, radio-ready gospel, [anthemic build], [fade out ending]` |

---

## 📄 FICHAS TÉCNICAS DE ENTREGA

### Ficha — Modo SINGLE

Salvar em: `suno/singles/AAAA-MM-DD/titulo-da-faixa.txt`

```
═══════════════════════════════════════════
COIAS MUSIC — FICHA DE PRODUÇÃO
═══════════════════════════════════════════
📋 Pipeline: Suno 03 | Modo: SINGLE
📅 Sessão: [AAAA-MM-DD]
🔢 Faixa: [N] de [QUANTIDADE_MUSICAS]

─── DADOS DA FAIXA ───
🔥 Título:
🎼 Estilo:
📖 Referência: [LIVRO CAP:VER]
📖 Versão Bíblica: [ARC / ARA / KJV]
📖 Texto do versículo:
"[texto literal na versão indicada]"

💭 Contexto emocional:
[1 frase — o que o ouvinte pode estar vivendo]

─── PROMPT SUNO (copiar direto na plataforma) ───
[prompt validado — máx 120 chars]

─── COMPOSIÇÃO ───

[Verso 1]
[...]

[Refrão]
[...]

[Verso 2]
[...]

[Refrão]
[...]

[Bridge]
[...]

[Refrão Final]
[...]

─── METADADOS ───
#️⃣ Hashtags: [10 hashtags PT-BR + EN]
📋 Status: [ ] Pendente | [ ] Gerado | [ ] Aprovado | [ ] Publicado
═══════════════════════════════════════════
```

### Ficha — Modo ALBUM

Salvar em: `suno/albums/nome-do-album/NN-titulo-faixa.txt`

```
═══════════════════════════════════════════
COIAS MUSIC — FICHA DE PRODUÇÃO
═══════════════════════════════════════════
📋 Pipeline: Suno 03 | Modo: ÁLBUM
💿 Álbum: [NOME_ALBUM]
🔢 Faixa: [NN] de [QUANTIDADE_MUSICAS]

─── DADOS DA FAIXA ───
🔥 Título:
🎼 Estilo do Álbum: [ESTILO_ALBUM]
📖 Referência: [LIVRO CAP:VER]
📖 Versão Bíblica: [ARC / ARA / KJV]
📖 Texto do versículo:
"[texto literal na versão indicada]"

💭 Contexto emocional:
[1 frase]

─── PROMPT SUNO (variação desta faixa) ───
[prompt validado — BPM, instrumentos, vocal e energia variam por faixa]

─── COMPOSIÇÃO ───

[Verso 1]
[...]

[Refrão]
[...]

[Verso 2]
[...]

[Refrão]
[...]

[Bridge]
[...]

[Refrão Final]
[...]

─── METADADOS ───
#️⃣ Hashtags: [10 hashtags PT-BR + EN]
📋 Status: [ ] Pendente | [ ] Gerado | [ ] Aprovado | [ ] Publicado
═══════════════════════════════════════════
```

### Encarte do Álbum: `album-info.md`

Criado automaticamente na pasta do álbum.

```markdown
# 💿 [NOME_ALBUM]
## COIAS MUSIC — Produção

- **Estilo:** [ESTILO_ALBUM]
- **Faixas:** [QUANTIDADE_MUSICAS]
- **Data de produção:** [AAAA-MM-DD]
- **Pipeline:** Suno 03

### Tracklist

| # | Título | Versículo | Versão | Status |
|---|--------|-----------|--------|--------|
| 01 | | | ARC | Pendente |
| 02 | | | ARC | Pendente |
| ... | | | | |

### Conceito do Álbum
[arco temático gerado a partir dos versículos — narrativa espiritual do álbum]

### Identidade Sonora
[descrição do som do álbum — instrumentação, vocais, energia, atmosfera]
```

---

## 📝 SISTEMA DE LOGS DA PRODUTORA

> **Logs independentes.** Este pipeline não compartilha histórico com nenhum outro.

### Log de Sessão — `suno/logs/log_suno03_AAAA-MM-DD.md`

Criado a cada nova sessão de produção.

```markdown
# 📒 COIAS MUSIC — Relatório de Sessão
## Pipeline Suno 03 | [AAAA-MM-DD HH:MM]

### Configuração
- Modo: [SINGLE / ALBUM]
- Álbum: [NOME_ALBUM ou "—"]
- Estilo Exigido: [Valor da variável ESTILO]
- Quantidade: [QUANTIDADE_MUSICAS]
- Pasta: [caminho de saída]

### Faixas Produzidas

| # | Título | Versículo | Estilo | Prompt Suno | Status |
|---|--------|-----------|--------|-------------|--------|

### Ocorrências de Qualidade
- Reescritas por filtro doutrinário: [N]
- Correções por filtro anti-rejeição: [N]
- Versículos substituídos por duplicação: [N]

### Versículos da Sessão
1. 
2. 

### Notas da Produção
[observações livres]
```

### Log Master — `suno/logs/log_suno03_master.md`

Acumulado de todas as sessões deste pipeline.

```markdown
# 📒 COIAS MUSIC — Log Master Pipeline Suno 03

## Histórico de Produção

| Data | Modo | Álbum | # | Título | Versículo | Estilo | Arquivo | Status |
|------|------|-------|---|--------|-----------|--------|---------|--------|

## Versículos Já Produzidos
*(lista acumulada — nunca repetir)*

## Últimos 5 Estilos Usados
*(atualizar a cada sessão)*
```

---

## ✅ CHECKLIST DE APROVAÇÃO FINAL

> **Nenhuma faixa é entregue sem aprovação em todos os critérios.**

| # | Critério | Status |
|---|----------|--------|
| **TEOLOGIA (reprovar = recompor inteira)** | | |
| 1 | Cristo/Deus é o protagonista da faixa? | |
| 2 | O versículo aparece na letra (literal ou paráfrase fiel)? | |
| 3 | Versão bíblica correta (ARC/ARA/KJV)? | |
| 4 | Sem heresia ou ambiguidade teológica? (filtro doutrinário) | |
| 5 | Deus é sujeito ativo (age, fala, promete, salva)? | |
| 6 | A faixa leva o ouvinte à adoração genuína a Deus? | |
| **COMPOSIÇÃO E EMOÇÃO (reprovar = reescrever parte)** | | |
| 7 | AABB ou ABAB garantido sem excesso de infinitivo (amar/cantar)? | |
| 8 | O Teste do Escravo passou? (Deus manda, não atende pedidos egoístas) | |
| 9 | Peso de adoração de Salmos/Harpa Cristã (foco no Tu, não no eu)? | |
| 10 | Imagens concretas que começam na dor e choram por redenção? | |
| 11 | Refrão nasce da luta — não é clichê e o Versículo base está fiel lá? | |
| 12 | Bridge revela caráter imutável de Deus com peso emocional? | |
| 13 | Estilo correto pro modo (SINGLE: diferente / ALBUM: coerente)? | |
| **TÉCNICO (corrigir antes de gravar)** | | |
| 14 | Prompt ≤ 120 caracteres? | |
| 15 | Sem nomes de artistas/bandas no prompt? | |
| 16 | Letra 100% original? | |
| 17 | Sem conteúdo provocativo ou ambíguo? | |
| 18 | Variação em cada repetição de refrão/verso? | |
| **ENTREGA (atualizar antes de encerrar)** | | |
| 19 | Log de sessão atualizado? | |
| 20 | Log master atualizado? | |

**Itens 1-6 ❌ → RECOMPOR A FAIXA INTEIRA.**
**Itens 7-13 ❌ → reescrever a parte problemática.**
**Itens 14-18 ❌ → corrigir antes de gravar o arquivo.**
**Itens 19-20 ❌ → atualizar antes de encerrar a sessão.**

---

*COIAS MUSIC — Pipeline Suno 03 | Guia de Produção Independente*
*Versão 1.0 | Março 2026*
