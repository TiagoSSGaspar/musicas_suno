# FASE 8 — ENTREGA

> **COIAS MUSIC | Pipeline Suno 03 | Fase 8 de 8**
> Gravacao dos arquivos finais, logs e relatorio da sessao.

---

## INSTRUCAO PARA A IA

Voce recebeu TODAS as faixas aprovadas na Fase 7.
Agora voce grava os arquivos finais, atualiza os logs e entrega o relatorio.

Esta fase NAO exige aprovacao faixa a faixa — voce executa tudo e entrega o pacote completo.

---

## ESTRUTURA DE PASTAS

### Modo SINGLE
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

### Modo ALBUM
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

---

## FICHA TECNICA — MODO SINGLE

Salvar em: `suno/singles/AAAA-MM-DD/titulo-da-faixa.txt`

```
═══════════════════════════════════════════
COIAS MUSIC — FICHA DE PRODUCAO
═══════════════════════════════════════════
Pipeline: Suno 03 | Modo: SINGLE
Sessao: [AAAA-MM-DD]
Faixa: [N] de [QUANTIDADE_MUSICAS]

--- DADOS DA FAIXA ---
Titulo:
Estilo:
Referencia: [LIVRO CAP:VER]
Versao Biblica: [ARC / ARA / KJV]
Texto do versiculo:
"[texto literal na versao indicada]"

Contexto emocional:
[1 frase — o que o ouvinte pode estar vivendo]

--- PROMPT SUNO (copiar direto na plataforma) ---
[prompt validado — max 120 chars]

--- COMPOSICAO ---

[Verso 1]
[...]

[Refrao]
[...]

[Verso 2]
[...]

[Refrao]
[...]

[Bridge]
[...]

[Refrao Final]
[...]

--- METADADOS ---
Hashtags: [10 hashtags PT-BR + EN]
Status: [ ] Pendente | [ ] Gerado | [ ] Aprovado | [ ] Publicado
═══════════════════════════════════════════
```

---

## FICHA TECNICA — MODO ALBUM

Salvar em: `suno/albums/nome-do-album/NN-titulo-faixa.txt`

```
═══════════════════════════════════════════
COIAS MUSIC — FICHA DE PRODUCAO
═══════════════════════════════════════════
Pipeline: Suno 03 | Modo: ALBUM
Album: [NOME_ALBUM]
Faixa: [NN] de [QUANTIDADE_MUSICAS]

--- DADOS DA FAIXA ---
Titulo:
Estilo do Album: [ESTILO_ALBUM]
Referencia: [LIVRO CAP:VER]
Versao Biblica: [ARC / ARA / KJV]
Texto do versiculo:
"[texto literal na versao indicada]"

Contexto emocional:
[1 frase]

--- PROMPT SUNO (variacao desta faixa) ---
[prompt validado — BPM, instrumentos, vocal e energia variam por faixa]

--- COMPOSICAO ---

[Verso 1]
[...]

[Refrao]
[...]

[Verso 2]
[...]

[Refrao]
[...]

[Bridge]
[...]

[Refrao Final]
[...]

--- METADADOS ---
Hashtags: [10 hashtags PT-BR + EN]
Status: [ ] Pendente | [ ] Gerado | [ ] Aprovado | [ ] Publicado
═══════════════════════════════════════════
```

---

## ENCARTE DO ALBUM (so para MODO ALBUM)

Salvar em: `suno/albums/nome-do-album/album-info.md`

```markdown
# [NOME_ALBUM]
## COIAS MUSIC — Producao

- **Estilo:** [ESTILO_ALBUM]
- **Faixas:** [QUANTIDADE_MUSICAS]
- **Data de producao:** [AAAA-MM-DD]
- **Pipeline:** Suno 03

### Tracklist

| # | Titulo | Versiculo | Versao | Status |
|---|--------|-----------|--------|--------|
| 01 | | | ARC | Pendente |
| 02 | | | ARC | Pendente |
| ... | | | | |

### Conceito do Album
[arco tematico gerado a partir dos versiculos — narrativa espiritual do album]

### Identidade Sonora
[descricao do som do album — instrumentacao, vocais, energia, atmosfera]
```

---

## LOGS

### Log de Sessao — `suno/logs/log_suno03_AAAA-MM-DD.md`

```markdown
# COIAS MUSIC — Relatorio de Sessao
## Pipeline Suno 03 | [AAAA-MM-DD HH:MM]

### Configuracao
- Modo: [SINGLE / ALBUM]
- Album: [NOME_ALBUM ou "—"]
- Estilo: [ESTILO]
- Quantidade: [QUANTIDADE_MUSICAS]
- Pasta: [caminho de saida]

### Faixas Produzidas

| # | Titulo | Versiculo | Estilo | Prompt Suno | Status |
|---|--------|-----------|--------|-------------|--------|

### Ocorrencias de Qualidade
- Reescritas por filtro doutrinario: [N]
- Correcoes por filtro anti-rejeicao: [N]
- Versiculos substituidos por duplicacao: [N]
- Reescritas por auditoria de rimas: [N]

### Versiculos da Sessao
1.
2.

### Notas da Producao
[observacoes livres]
```

### Log Master — `suno/logs/log_suno03_master.md`

Acumulado. Adicionar ao final do arquivo existente (ou criar se nao existir).

```markdown
# COIAS MUSIC — Log Master Pipeline Suno 03

## Historico de Producao

| Data | Modo | Album | # | Titulo | Versiculo | Estilo | Arquivo | Status |
|------|------|-------|---|--------|-----------|--------|---------|--------|

## Versiculos Ja Produzidos
*(lista acumulada — nunca repetir)*

## Ultimos 5 Estilos Usados
*(atualizar a cada sessao)*
```

---

## SAIDA OBRIGATORIA DESTA FASE

Apos gravar todos os arquivos, apresentar:

```
======================================
ENTREGA FINAL — SESSAO [AAAA-MM-DD]
======================================
Modo: [SINGLE / ALBUM]
Faixas entregues: [N]

Arquivos criados:
  - [caminho/arquivo1.txt]
  - [caminho/arquivo2.txt]
  - [...]

Logs atualizados:
  - suno/logs/log_suno03_AAAA-MM-DD.md
  - suno/logs/log_suno03_master.md

Ocorrencias:
  - Reescritas por filtro doutrinario: [N]
  - Correcoes por filtro anti-rejeicao: [N]
  - Reescritas por auditoria de rimas: [N]

======================================
SESSAO ENCERRADA COM SUCESSO
======================================
```

**Fim do pipeline. Sessao concluida.**
