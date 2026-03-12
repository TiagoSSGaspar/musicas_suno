---
name: pipeline_suno_fases
description: Pipeline rigoroso de 8 fases para geração de músicas no Suno (COIAS MUSIC).
---

# COIAS MUSIC — Pipeline Suno 03 (Faseado)

Esta skill define o processo oficial e rigoroso para a compilação, criação e aprovação de novas faixas para o COIAS MUSIC utlizando o Suno AI. Para garantir qualidade poética, profundidade teológica e métrica correta, o processo deve obrigatoriamente seguir as **8 fases independentes** descritas a seguir. 

**REGRA DE OURO:** A IA nunca deve avançar de uma fase para a próxima sem a aprovação explícita do usuário. A IA deve parar no final de cada fase e perguntar se pode avançar. Crie apenas UMA faixa por vez dentro das fases que lidam com versículos e letras.

---

## FASE 1 — ENTREVISTA DE SESSÃO

**Objetivo:** Configurar a sessão de produção.
**Ação:** Faça as 3 perguntas ao usuário (uma por vez ou todas juntas, se preferir):
1. "Quantas músicas vamos fazer hoje?" (`QUANTIDADE_MUSICAS`)
2. "O formato é SINGLE (faixas avulsas) ou ALBUM (projeto fechado)?" (`MODO`)
3. "Qual será o Estilo?" (`ESTILO` - se SINGLE pode ser AUTO, se ALBUM deve ter um estilo definido e exigir o `NOME_ALBUM`).
Estilos: Blues Gospel, Sertanejo Gospel, Forró Gospel, Worship Balada, Rap Gospel, Rock Cristão, Reggae Gospel, Gospel Épico, Hino Tradicional, Pop Contemporâneo.

**Saída Obrigatória Fase 1:**
```text
======================================
CONFIGURAÇÃO DA SESSÃO — FASE 1 CONCLUÍDA
======================================
Data: [AAAA-MM-DD]
Modo: [SINGLE / ALBUM]
Álbum: [NOME_ALBUM ou "—"]
Estilo: [ESTILO escolhido ou "AUTO"]
Quantidade: [QUANTIDADE_MUSICAS]
Pasta de saída: [caminho]
======================================
```
*Pergunta obrigatória:* "Configuração correta? Posso avançar para a Fase 2 (Pré-Produção)?"

---

## FASE 2 — PRÉ-PRODUÇÃO

**Objetivo:** Selecionar versículos novos e definir os estilos.
**Ação:**
1. Consulte o log master (`suno/logs/log_suno03_master.md`) para não repetir versículos.
2. Escolha `QUANTIDADE_MUSICAS` novos versículos (fortes, emocionais, narrativa profunda - ARC, ARA ou KJV).
3. Atribua o estilo para cada faixa conforme a Fase 1.

**Saída Obrigatória Fase 2:**
```text
======================================
MAPA DE PRODUÇÃO — FASE 2 CONCLUÍDA
======================================
Faixa 1 de [N]:
  Versículo: [LIVRO CAP:VER]
  Texto: "[texto literal ARC]"
  Estilo: [estilo escolhido]
...
======================================
```
*Pergunta obrigatória:* "Mapa de produção correto? Posso avançar para a Fase 3 (Meditação)?"

---

## FASE 3 — MEDITAÇÃO PRÉ-COMPOSIÇÃO (1 faixa por vez)

**Objetivo:** Base emocional e teológica.
**Ação:** Responda de forma profunda para CADA faixa:
1. Contexto, 2. Cristo, 3. Caráter de Deus, 4. Cruz, 5. Ação Divina, 6. Emoção Humana, 7. Ouvinte, 8. Imagem Central, 9. Última Linha.

**Saída Obrigatória Fase 3:** Apresentar a meditação completa para a faixa atual.
*Pergunta obrigatória:* "Meditação da faixa [N] está boa? Posso avançar para a Fase 4 (Composição)?"

---

## FASE 4 — COMPOSIÇÃO (1 faixa por vez)

**Objetivo:** Letra poética e métrica rigorosa.
**Ação:** Componha a letra na estrutura: Verso 1, Refrão, Verso 2, Refrão, Bridge, Refrão Final. 
**IMPRESCINDÍVEL:** O esquema de rimas deve ser AABB ou ABAB. 
**PROIBIÇÕES ABSOLUTAS DE RIMA:** 
- Verbos no infinitivo (rima de amar/cantar, viver/morrer).
- Clichês (Senhor/amor/dor, coração/mão).
Substitua por substantivos ricos e imagens concretas!

**Saída Obrigatória Fase 4:**
Apresente a Letra completa e, logo abaixo, a **AUDITORIA DE RIMAS**:
```text
======================================
AUDITORIA DE RIMAS — FAIXA [N]
======================================
[Analisar pares de rima de cada seção indicando palavras e tipos (verbo/substantivo)]
RESULTADO:
- Total de pares de rima: [N]
- Pares com dois verbos no infinitivo: [N] (MÁXIMO PERMITIDO: 0)
- Pares da lista proibida: [N] (MÁXIMO PERMITIDO: 0)
======================================
```
Se a auditoria apontar falha, REESCREVA a letra por conta própria antes de apresentar.
*Pergunta obrigatória:* "Letra e auditoria de rimas da faixa [N] estão boas? Posso avançar para a Fase 5 (Filtro Doutrinário)?"

---

## FASE 5 — FILTRO DOUTRINÁRIO (1 faixa por vez)

**Objetivo:** Validação teológica Anti-Heresia.
**Ação:** Verifique a presença de Misticismo, Relativismo, Confissão Positiva (como Decretar), Evangelho da Prosperidade. Verifique se contém as doutrinas básicas (Soberania, Graça, Redenção, Arrependimento, Fidelidade, Autoridade da Escritura).
O versículo base deve existir na letra.

**Saída Obrigatória Fase 5:** Um checklist respondendo a cada item de Desvios (OK ou ENCONTRADO) e Fundamentos (SIM ou NÃO).
*Pergunta obrigatória:* "Faixa [N] [APROVADA/REPROVADA] no filtro doutrinário. Posso avançar para a Fase 6 (Filtro Suno)?"

---

## FASE 6 — FILTRO ANTI-REJEIÇÃO SUNO (1 faixa por vez)

**Objetivo:** Montar o prompt em até 120 caracteres.
**Ação:** Crie o `[Prompt Suno]` (gênero, bpm, instrumentos, vocal, etc, sem usar nomes de artistas reais ou marcas). Verifique se a letra tem palavras sensíveis ou repetição excessiva (5+ vezes na mesma seção).

**Saída Obrigatória Fase 6:**
Apresentar o Prompt (com contagem de caracteres) e o Checklist de Verificação da Letra e do Prompt.
*Pergunta obrigatória:* "Prompt Suno e verificação da faixa [N] estão OK? Posso avançar?"

---

## FASE 7 — APROVAÇÃO FINAL (1 faixa por vez)

**Objetivo:** Revisão de 20 pontos de qualidade.
**Ação:** Preencha os 20 critérios avaliando Teologia, Composição, Técnico e Rimas (as mais extremas: 0 infinitivos juntos). 

**Saída Obrigatória Fase 7:** O checklist completo e a contagem final de `[N] de 20 aprovados`.
*Pergunta obrigatória:* "Faixa [N] APROVADA em todos os critérios. Posso avançar para a próxima / para a Fase 8 (Entrega)?" (Ou, se reprovar algo, ofereça a correção).

---

## FASE 8 — ENTREGA

**Objetivo:** Salvar arquivos!
**Ação:**
1. Crie os `.txt` com as Fichas Técnicas das músicas e a letra completa dentro de `suno/singles/AAAA-MM-DD/` ou `suno/albums/[nome]/`.
2. Adicione os metadados e as Hashtags ao final do txt.
3. Se for ÁLBUM, crie o encarte (`album-info.md`).
4. Grave os logs em `suno/logs/log_suno03_[data].md` e acumule as entradas no `log_suno03_master.md`.

**Saída Obrigatória Fase 8:**
```text
======================================
ENTREGA FINAL — SESSÃO [AAAA-MM-DD]
======================================
Modo: [SINGLE / ALBUM]
Faixas entregues: [N]
Arquivos criados: [...]
Logs atualizados: [...]
======================================
SESSÃO ENCERRADA COM SUCESSO
======================================
```
