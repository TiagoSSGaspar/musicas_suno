# FASE 2 — PRE-PRODUCAO

> **COIAS MUSIC | Pipeline Suno 03 | Fase 2 de 8**
> Esta fase seleciona os versiculos e prepara o mapa de producao.

---

## INSTRUCAO PARA A IA

Voce recebeu a configuracao da Fase 1. Agora sua tarefa e:

1. Verificar o log master (`suno/logs/log_suno03_master.md`) para ver versiculos ja usados
2. Se a pasta `suno/logs/` nao existir, cria-la
3. Escolher `QUANTIDADE_MUSICAS` versiculos NOVOS (nao listados no log master)
4. Definir o estilo de cada faixa

**NAO componha letras. NAO faca meditacao. NAO escreva musica.**
Sua unica tarefa e preparar o MAPA DE PRODUCAO.

---

## REGRAS DE SELECAO DE VERSICULOS

### O que buscar
- Versiculos com **forca emocional e teologica** — nao versiculos decorativos
- Priorizar: Salmos, Isaias, Jeremias, Lamentacoes, Romanos, Hebreus, Apocalipse
- Cada versiculo deve ter **potencial narrativo** — contar uma historia de Deus agindo
- Versao primaria: **Almeida Revista e Corrigida (ARC)**
- Aceita: ARA como referencia secundaria | KJV como referencia cruzada
- PROIBIDO: NVI, NTL, NIV, NTLH, versoes catolicas, adventistas

### O que evitar
- Versiculos ja listados no log master
- Versiculos muito curtos sem contexto (ex: "Jesus chorou")
- Versiculos genealogicos ou legislativos sem carga emocional

---

## REGRAS DE ESTILO

### Se ESTILO = "AUTO" (so MODO SINGLE)
- Rotacionar estilos diferentes para cada faixa
- Consultar "Ultimos 5 Estilos Usados" no log master e PULAR esses 5
- Cada faixa da sessao deve ter um estilo DIFERENTE

### Se ESTILO = "[Nome Especifico]"
- TODAS as faixas usam esse estilo
- Variar levemente BPM, instrumentos ou textura vocal entre faixas

### Catalogo de estilos

| # | Estilo | Prompt Padrao |
|---|--------|---------------|
| 1 | Blues Gospel | `Blues Gospel, 72bpm, slide guitar, Hammond organ, soulful male vocals, raw and intimate, Southern gospel warmth, [no rap sections], [church choir background]` |
| 2 | Sertanejo Gospel | `Sertanejo Gospel, 96bpm, viola caipira, violao, double male vocals, emotional and devotional, acoustic intimacy, [no electric guitar], [key change at bridge]` |
| 3 | Forro Gospel | `Forro Gospel, 120bpm, accordion, triangle, zabumba, joyful female vocal, festive and worshipful, [call and response], [anthemic build]` |
| 4 | Worship Balada | `Worship Ballad, 68bpm, piano, strings, warm female vocal, cinematic intimacy, soul-stirring devotion, [whispered verse 1], [key change at bridge]` |
| 5 | Rap Gospel | `Gospel Rap, 90bpm, 808 bass, soul samples, spoken-word verse 1, intense and raw, redemptive atmosphere, [spoken word intro], [church choir background]` |
| 6 | Rock Cristao | `Rock Gospel, 130bpm, electric guitar power chords, driving drums, raspy male vocal, urgent and confessional, [anthemic build], [a cappella bridge]` |
| 7 | Reggae Gospel | `Reggae Gospel, 85bpm, offbeat rhythm guitar, deep bass groove, warm tenor vocals, peaceful and declarative, roots gospel, [no rap sections]` |
| 8 | Gospel Epico | `Gospel Epic, 80bpm, full orchestra, massive choir, cinematic swell, powerful and reverent, stadium worship, [anthemic build], [key change at bridge]` |
| 9 | Hino Tradicional | `Traditional Gospel Hymn, 76bpm, pipe organ, four-part choir, formal and reverent, classic Protestant worship, [a cappella bridge], [no electric guitar]` |
| 10 | Pop Contemporaneo | `Contemporary Christian Pop, 104bpm, synth pads, acoustic guitar, clean female vocal, uplifting and modern, radio-ready gospel, [anthemic build], [fade out ending]` |

---

## SAIDA OBRIGATORIA DESTA FASE

Apresentar o MAPA DE PRODUCAO exatamente neste formato:

```
======================================
MAPA DE PRODUCAO — FASE 2 CONCLUIDA
======================================

Faixa 1 de [N]:
  Versiculo: [LIVRO CAP:VER]
  Texto: "[texto literal ARC]"
  Estilo: [estilo escolhido]

Faixa 2 de [N]:
  Versiculo: [LIVRO CAP:VER]
  Texto: "[texto literal ARC]"
  Estilo: [estilo escolhido]

[...repetir para cada faixa]

======================================
```

Depois perguntar:
> "Mapa de producao correto? Os versiculos e estilos estao bons? Posso avancar para a Fase 3 (Meditacao)?"
> "Se quiser trocar algum versiculo ou estilo, me diga qual."

**PARAR AQUI. Nao avancar sem aprovacao do usuario.**
