---
name: rewrite-paper
description: Rewrite or edit the user's prose (papers, abstracts, reports, READMEs, manuscripts) to follow Sutton's and Littman's technical-writing guidance plus the user's standing conventions (no em-dashes, no semicolons, no bold method names). Use when the user asks to rewrite, revise, copyedit, tighten, or apply the writing style to a document or passage, or to sweep a manuscript for style violations.
---

# Rewrite Paper

Rewrite the user's technical prose to follow a fixed style: Sutton's "Advice on
Technical Writing", Littman's "Stylistic Comments", and the user's standing
conventions. The full rules live in `style-guide.md` next to this file. This
skill is self-contained: everything needed is in these two files.

## When to use

- The user asks to rewrite, revise, copyedit, tighten, or "apply the style" to a
  paper, abstract, report, README, or passage.
- The user asks to sweep a manuscript for style violations before compiling or
  submitting.
- You are writing fresh prose for the user (default to these rules without being
  asked, per their standing feedback).

## Procedure

1. **Read `style-guide.md`** in this skill directory. It is the source of truth,
   organized in three priority layers (user conventions > Littman > Sutton) with
   conflict-resolution notes. Do not work from memory alone.

2. **Identify the target.** A file (read it first) or a pasted passage. For a
   file, note the format: LaTeX, Markdown, or plain prose. Confirm scope if
   ambiguous (whole document vs. one section).

3. **Calibrate to the field and venue.** Audience determines vocabulary and
   framing, so establish both before rewriting.
   - Identify the paper's topic and home field (for example medical imaging,
     NLP, systems).
   - Identify the target venue and its reader demographic from the document,
     the filename, or by asking the user.
   - Match the field's writing conventions: terminology, section structure, and
     what counts as assumed background versus what must be explained.
   - When the venue's audience differs from the paper's field, define terms that
     audience and its reviewers are unlikely to know on first use. A
     medical-imaging paper submitted to an applied-computer-science venue should
     define clinical terms (for example pneumothorax, consolidation) the first
     time they appear, because CS reviewers do not share that background. The
     reverse also holds: do not belabor CS basics for a CS audience. This is
     Sutton's "stand with your reader" and jargon-budget advice applied to a
     specific audience.

4. **Rewrite for substance first, then mechanics.** Apply in this order:
   - *Order of ideas:* most important thing first, nothing before it can be
     understood, intent shown early.
   - *Skimmable structure (strict):* one paragraph = one claim, and the first
     sentence is that claim stated on its own. The whole document must be
     understandable by reading only the first sentence of each paragraph. Split
     any paragraph carrying two claims; move any buried point to the front. For
     research manuscripts: problem, then gap, then enumerated contributions;
     related work positions rather than lists; failure cases stated explicitly.
   - *Separation and tense:* separate prior work from your work, results from
     conclusions, claims from speculation. Present tense for ideas and
     conclusions, past tense for experiments and results.
   - *Precision and concision:* omit unnecessary words, kill weakening
     superlatives ("very"), avoid metaphor and weak verbs ("has", "is"), drop
     anything Arguably-Not-True or whose Opposite-is-Also-True.
   - *Usage:* that/which, comma rules, hyphenated compound modifiers
     ("reinforcement-learning algorithm"), capitalized structural references
     (Section 3, Table 2), confusable pairs, citations integrated into sentences
     (never a bare parenthetical as a noun), spelled-out Latin ("for example",
     "that is").

5. **Run the hard-constraint sweep** (user conventions, never skip):
   - No `---` and no literal `—`. Replace with `, ` / parentheses / colon. Never
     create `word,word`. Never alter numeric commas like `6,600`.
   - No `;`. Replace with comma/period/colon or split the sentence. Keep only in
     list items that themselves contain commas.
   - No bold on model/method/system names (`\textbf{FlipR}` -> `FlipR`). Bold
     stays only on the best value in a results table.
   - En-dashes (`--`) are fine; leave them.
   - Do NOT bold Results topic sentences unless the user explicitly asks to
     restructure the Results section.

6. **Verify before delivering.**
   - *Skim test:* read only the first sentence of each edited paragraph in
     sequence. They must form a coherent, complete argument, and each must state
     that paragraph's single claim. If not, fix the paragraph (split it, or
     promote the buried claim to sentence one).
   - Grep the edited region for violations: `grep -nE '—|---|;' <file>` and
     `grep -n '\\textbf' <file>` (then confirm each `\textbf` is a table best
     value, not a method name).
   - For LaTeX, compile if the user wants a build; match the compile effort to
     the change (a small edit does not need a full multi-pass rebuild).
   - Preserve all data, numbers, equations, labels, and citation keys exactly.
     This is a style rewrite, not a content change. If a sentence's meaning is
     unclear, ask rather than guess.

7. **Report** what changed at a high level (order, tense, concision) and list
   the hard-constraint fixes (em-dashes removed, semicolons removed, bold
   stripped). Flag anything you could not resolve without the user's intent.

## Notes

- When two rules conflict, follow the priority in `style-guide.md`: user
  conventions beat Littman, Littman beats Sutton. Key cases: em-dashes forbidden
  (overrides Littman), Latin abbreviations spelled out (Littman over Sutton),
  `et al.` allowed in IEEE citations.
- Match the document's existing citation style rather than forcing apalike.
- Apply these rules by default whenever you write prose for the user, even
  without an explicit request.
