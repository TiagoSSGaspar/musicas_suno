# FASE 6 — FILTRO ANTI-REJEICAO SUNO

> **COIAS MUSIC | Pipeline Suno 03 | Fase 6 de 8**
> Setor tecnico. Garante que a faixa passe na plataforma Suno sem bloqueio.

---

## INSTRUCAO PARA A IA

Voce recebeu as letras aprovadas pelo filtro doutrinario (Fase 5).
Agora voce monta o PROMPT SUNO para cada faixa e verifica a letra contra as regras da plataforma.

**FACA UMA FAIXA POR VEZ.** Apresente o prompt e a verificacao, espere aprovacao.

---

## REGRAS DO CAMPO "Style of Music" (Prompt Suno)

| PROIBIDO | Substituto seguro |
|----------|-------------------|
| Nomes de artistas reais ("estilo Hillsong") | Descrever: "warm layered harmonies, gospel worship feel" |
| Marcas de plataformas | Nunca mencionar |
| Palavras com duplo sentido sexual/violento | Revisao lexical obrigatoria |
| Prompt > 120 caracteres | Breviar com virgulas |

**Formato padrao (max 120 chars):**
```
[genero], [BPM]bpm, [instrumentos], [tipo vocal], [energia], [textura]
```

### Diretivas opcionais (adicionar 1 a 3 ao final)
```
[no rap sections]          — evita rap nao solicitado
[no electric guitar]       — arranjo acustico
[church choir background]  — corais de apoio
[call and response]        — pergunta-resposta vocal
[key change at bridge]     — mudanca de tom na bridge
[spoken word intro]        — fala antes de cantar
[a cappella bridge]        — bridge so vocal
[fade out ending]          — encerramento suave
[anthemic build]           — crescendo progressivo
[whispered verse 1]        — verso 1 intimo
```

---

## REGRAS DO CAMPO "Lyrics"

| PROIBIDO | Solucao |
|----------|---------|
| Copiar estrofes de hinos registrados | Composicao 100% original |
| Nomes de artistas/bandas na letra | Nunca inserir |
| Conteudo politicamente provocativo | Foco teologico |
| Palavroes ou termos violentos (mesmo metaforicos) | Imagem biblica equivalente |
| Promessas de cura fisica especifica | Fe e esperanca, nao promessa medica |
| Repeticao excessiva (mesmo verso 5+ vezes) | Variar pelo menos 1 palavra por repeticao |

---

## SAIDA OBRIGATORIA DESTA FASE

Para CADA faixa (uma por vez):

```
======================================
FILTRO SUNO — FAIXA [N] de [TOTAL]
======================================
Titulo: [titulo]
Estilo: [estilo]

--- PROMPT SUNO (copiar direto na plataforma) ---
[prompt montado — max 120 chars]

Contagem de caracteres: [N] de 120

--- VERIFICACAO DA LETRA ---
[ ] Sem copias de hinos registrados — [OK / PROBLEMA: citar]
[ ] Sem nomes de artistas/bandas — [OK / PROBLEMA: citar]
[ ] Sem conteudo provocativo — [OK / PROBLEMA: citar]
[ ] Sem palavroes ou violencia — [OK / PROBLEMA: citar]
[ ] Sem promessas de cura especifica — [OK / PROBLEMA: citar]
[ ] Sem repeticao excessiva (5+ vezes) — [OK / PROBLEMA: citar]

--- VERIFICACAO DO PROMPT ---
[ ] Sem nomes de artistas — [OK / PROBLEMA]
[ ] Sem marcas de plataforma — [OK / PROBLEMA]
[ ] Sem duplo sentido — [OK / PROBLEMA]
[ ] Dentro de 120 caracteres — [OK / PROBLEMA]

==============================
RESULTADO: [APROVADA / CORRIGIR]
==============================
```

Se precisar corrigir, mostrar o que mudou.

Depois perguntar:
> "Prompt Suno e verificacao da faixa [N] estao OK? Posso avancar?"

**PARAR AQUI apos cada faixa. Nao avancar sem aprovacao do usuario.**
