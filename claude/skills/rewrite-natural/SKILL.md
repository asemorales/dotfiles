---
name: rewrite-natural
description: Rewrite any prose so it reads as natural, direct, and human-written rather than AI-generated. Applies the user's standing writing conventions (no em-dashes, no semicolons, no "X, not Y" contrast pattern, no comma-spliced "clause, clause" pairs, one claim per paragraph) to writing of any kind, including emails, messages, docs, READMEs, commit messages, blog posts, and reports. Use when the user asks to rewrite, tighten, de-AI, or humanize a piece of writing, or asks for the writing style to be applied to something.
---

# Rewrite Natural

Rewrite prose so a reader would take it for human writing. This applies to all
writing, not only research papers. For academic manuscripts, use `rewrite-paper`
instead, which layers Sutton's and Littman's technical-writing rules on top of
everything here.

## The aim

Natural, direct, plain. Every rule below serves that one aim, so when a rule and
the aim collide, keep the aim.

The tell of AI writing is rhetorical cadence: sentences shaped for rhythm and
balance rather than for what they say. Cut anything that exists for cadence.

## Hard constraints (never skip)

1. **No "clause, conjunction clause" contrast pattern.** Never write the
   antithesis tail "X, not Y".
   - Bad: "This is a motivation, not a contribution."
   - Good: "This motivates the work. It is not a contribution."
   - Bad: "The model is fast, not accurate."
   - Good: "The model is fast. Its accuracy is lower than the baseline's."

   The whole family goes:
   - "not just X, it's Y" / "isn't merely X, it's Y"
   - "not only X, but also Y"
   - any sentence whose shape is contrast-for-effect
   - trailing participial tails that editorialize: "..., making it the fastest
     option", "..., a key advantage here"
   - three-item lists used for rhythm rather than because there are three things
   - throat-clearing openers: "In today's landscape of...", "As we all know..."
   - hedge stacks: "It is important to note that", "It's worth mentioning that"

   Fix by stating the claim and stopping, or by splitting into two sentences.

2. **No "clause, clause" juxtaposition.** Two independent clauses joined by a
   bare comma read as cadence, whatever the second one says. Split them, or
   subordinate one to the other.
   - Bad: "The parser handles nesting, the tokenizer does not."
   - Good: "The parser handles nesting. The tokenizer does not."
   - Bad: "It's not about speed, it's about correctness."
   - Good: "Correctness matters here. Speed does not."
   - Bad: "We ran it twice, both runs failed."
   - Good: "We ran it twice and both runs failed."

   This holds even without a contrast: mirrored halves ("the API is stable, the
   docs are not"), echoed openers ("you write the test, you write the fix"), and
   any pair whose second half exists to complete a rhythm. A comma before a
   dependent clause or a short trailing phrase is fine.

3. **No em-dashes.** Never emit `—` or `---`. Use a comma, parentheses, or a
   colon. When bulk-replacing `---`, substitute `, ` (comma + space) so you never
   produce `word,word`. Never touch numeric commas like `6,600`. En-dashes (`--`,
   ranges, `vision--language`) are fine.

4. **No semicolons.** Replace `;` with a comma, period, or colon, or split into
   two sentences. Keep one only in a list whose items themselves contain commas.

5. **No bold on names.** Do not bold product, model, method, or system names in
   prose or tables. Bold stays for the single best value in a results table.

## Rewriting rules

- **One paragraph, one claim.** The first sentence states that claim on its own.
  The rest supports it and adds no second claim. A reader must get the whole
  argument from the first sentences alone. Split paragraphs carrying two claims,
  promote buried points to sentence one.
- **Most important thing first**, as long as the reader can already understand
  it. Show intent early.
- **Cut words that carry nothing.** Drop "very", "really", "quite", "actually",
  "basically". Drop qualifiers that weaken a true claim.
- **Prefer strong verbs.** Replace "is"/"has" constructions where a real verb
  exists ("the system has support for X" -> "the system supports X").
- **Say it literally.** No metaphor where a plain word works, no scare quotes, no
  superlatives you cannot back.
- **Vary sentence length.** AI prose defaults to a uniform medium length. Real
  writing mixes short sentences with longer ones.
- **Say nothing Arguably-Not-True, and nothing whose Opposite-is-Also-True.** If
  a sentence would still sound fine with its claim reversed, it says nothing.
- **English, not Latin.** "for example" over "e.g.", "that is" over "i.e.".
- **No dangling "this".** Give it a noun: "this result", "this failure".
- **Keep the user's voice.** Match the register of the surrounding text, and do
  not upgrade casual writing into formal writing unless asked.

## Procedure

1. Identify the target: a file (read it first) or a pasted passage. Note the
   format (Markdown, LaTeX, plain text, email) and confirm the scope if it is
   ambiguous.
2. Rewrite for substance first (order of ideas, one claim per paragraph,
   concision), then for mechanics (the hard constraints above).
3. Sweep the edited region: `grep -nE '—|---|;' <file>`, then reread for the
   "X, not Y" pattern and its family, which no grep catches reliably. Searching
   for `, not ` and `, but ` finds most of them. For bare "clause, clause"
   splices, check each comma in the region and ask whether the text after it
   could stand alone as a sentence.
4. Skim test: read only the first sentence of each edited paragraph in order.
   They must form a coherent argument on their own.
5. Preserve all facts, numbers, quotes, links, and code exactly. This is a style
   rewrite. If a sentence's meaning is unclear, ask rather than guess.
6. Report what changed at a high level and list the hard-constraint fixes.

## Notes

- Apply these rules by default whenever writing prose for the user, even without
  an explicit request. Invoking the skill by name is for sweeping an existing
  document or for pulling the full rule list back into context.
- For papers, abstracts, and technical manuscripts, `rewrite-paper` supersedes
  this skill and includes the same constraints.
