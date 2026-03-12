# COIAS MUSIC — Pipeline Suno 03 (Faseado)

## Como usar este pipeline

Este pipeline foi dividido em **8 fases independentes** para garantir que a IA execute cada etapa com qualidade e que voce (produtor) aprove cada passo antes de avancar.

---

## Por que faseado?

O pipeline original (arquivo unico) tem um problema: IAs tendem a "pular" regras quando recebem tudo de uma vez — especialmente as regras de rima e metrica. Ao dividir em fases, a IA:

1. **So ve as regras da fase atual** — nao tem como "otimizar" pulando etapas
2. **Para e mostra o trabalho** — voce aprova antes de avancar
3. **Faz auditoria obrigatoria** — especialmente na Fase 4 (rimas)

---

## Fluxo de uso — passo a passo

### PASSO 1: Abra uma conversa nova com a IA

Cole o conteudo do arquivo `fase1_entrevista.md` e diga:
> "Execute esta fase."

A IA vai fazer as 3 perguntas de configuracao e mostrar o resumo. Aprove ou corrija.

### PASSO 2: Cole a proxima fase

Quando a fase anterior estiver aprovada, cole o conteudo de `fase2_pre_producao.md` e diga:
> "Aqui esta a configuracao aprovada: [colar resumo da Fase 1]. Execute a Fase 2."

### PASSO 3: Continue fase por fase

Repita o processo para cada fase:

| Ordem | Arquivo | O que faz | Voce aprova |
|-------|---------|-----------|-------------|
| 1 | `fase1_entrevista.md` | Configura a sessao | Modo, estilo, quantidade |
| 2 | `fase2_pre_producao.md` | Seleciona versiculos e estilos | Versiculos e mapa de producao |
| 3 | `fase3_meditacao.md` | Meditacao devocional por faixa | Entendimento do versiculo |
| 4 | `fase4_composicao.md` | Compoe a letra + auditoria de rimas | Letra E rimas (faixa por faixa) |
| 5 | `fase5_filtro_doutrinario.md` | Checa teologia | Checklist doutrinario |
| 6 | `fase6_filtro_suno.md` | Monta prompt Suno + verifica regras | Prompt tecnico |
| 7 | `fase7_aprovacao_final.md` | Checklist completo (20 itens) | Aprovacao final |
| 8 | `fase8_entrega.md` | Grava arquivos e logs | Pacote entregue |

### PASSO 4: Cada fase para e espera sua aprovacao

A IA NAO avanca sozinha. Em cada fase ela mostra o resultado e pergunta:
> "Posso avancar para a proxima fase?"

Voce pode dizer:
- **"Sim"** — avanca
- **"Muda X"** — ela corrige e mostra de novo
- **"Reprova"** — ela refaz

---

## Dicas para melhor resultado

### Na Fase 4 (Composicao) — a mais critica
- **Leia a auditoria de rimas com atencao** — e ali que a IA tenta enganar
- Se vir "amar/cantar", "Senhor/amor", "coracao/mao" como pares de rima, reprove na hora
- Peca pra ela mostrar a auditoria ANTES de voce ler a letra — assim voce ja chega sabendo

### Carregando contexto entre fases
- Ao colar uma nova fase, **inclua o resumo/resultado da fase anterior**
- Exemplo: "Configuracao: SINGLE, AUTO, 3 musicas. Versiculos aprovados: Sl 23:1, Is 41:10, Rm 8:28. Execute a Fase 3."

### Se a conversa ficar longa
- Voce pode comecar uma conversa NOVA a partir de qualquer fase
- Basta colar a fase + o contexto acumulado das fases anteriores

---

## Resumo rapido

```
Fase 1 (Entrevista)     → "Quantas? Single/Album? Estilo?"
Fase 2 (Pre-producao)   → Escolhe versiculos, monta mapa
Fase 3 (Meditacao)      → Medita no versiculo (1 por vez)
Fase 4 (Composicao)     → Escreve letra + AUDITORIA DE RIMAS (1 por vez)
Fase 5 (Filtro doutrin.) → Checa teologia (1 por vez)
Fase 6 (Filtro Suno)    → Monta prompt tecnico (1 por vez)
Fase 7 (Aprovacao final) → Checklist 20 itens (1 por vez)
Fase 8 (Entrega)        → Grava arquivos e logs
```

**O ponto chave: voce controla cada portao. A IA so avanca quando voce diz "sim".**
