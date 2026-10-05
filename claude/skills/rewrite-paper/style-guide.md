# Style Guide Reference

This file holds the full source material for the `rewrite-paper` skill. It is
self-contained: the original PDFs and web pages are not needed. Three layers,
in priority order when they conflict:

1. **User conventions** (hard constraints, override everything below)
2. **Littman, "Stylistic Comments"** (verbatim)
3. **Sutton, "Advice on Technical Writing"** (verbatim)

Where Littman and Sutton disagree with a user convention, the user convention
wins (see the conflict notes at the end).

---

## Layer 1: User conventions (hard constraints)

These come from the user's standing feedback. They are non-negotiable and must
be swept for on every pass.

- **One paragraph = one claim, skimmable.** Every paragraph makes exactly one
  point. The first sentence is the topic sentence and states that point on its
  own. The rest of the paragraph supports it and introduces no second claim. The
  reader must be able to skim the document by reading only the first sentence of
  each paragraph and still get the full argument. If a paragraph carries two
  claims, split it. If the point is buried, move it to the front. This applies to
  all prose, not only Results sections. (This is the strict, mandatory form of
  Sutton's and Littman's topic-sentence advice in Layers 2 and 3.)
- **Sound human, not AI.** This is the aim every other rule serves. Prose must
  read as natural, direct, and written by a person. The tell of AI text is
  rhetorical cadence, so cut anything present for rhythm rather than meaning.
- **No "clause, conjunction clause" contrast pattern.** Never write the
  antithesis tail "X, not Y" ("a motivation, not a contribution", "fast, not
  accurate"). State the claim and stop, or split into two sentences. Same family,
  also banned: "not just X, it's Y", "not only X but also Y", inverted parallel
  flourishes, trailing participial tails that editorialize ("..., making it the
  lightest model"), three-item lists that exist for rhythm, throat-clearing
  openers ("In today's landscape of..."), and hedge stacks ("It is important to
  note that"). Rewrite "Lightweight design is a motivation, not a contribution."
  as "Lightweight design motivates the work. The paper does not claim it as a
  contribution."
- **No em-dashes.** Never emit `---` or the literal `—`. Substitute a comma,
  parentheses, or a colon, whichever fits. When bulk-replacing `---`, use `, `
  (comma + space), not bare `,`, so you never produce `word,word`. Never
  space-out numeric commas like `6,600`. This overrides Littman's em-dash advice
  (see conflict notes).
- **No semicolons.** Replace `;` with a comma, period, or colon, or restructure
  into two sentences (apply Sutton's "separate what can be separated"). Keep a
  semicolon only where genuinely unavoidable: list items that themselves contain
  commas. For lists that conventionally use semicolons (IEEE keywords,
  parenthetical metric lists), use commas instead.
- **En-dashes are fine.** `--` (LaTeX en-dash, for example `vision--language`
  or page ranges `14--33`) is acceptable and should be left in place.
- **Never bold model/method/system names** in prose or tables. Write DraxNet,
  FlipR, ResNet-18, YOLO26, not `\textbf{...}`. Bold is reserved for the best
  value in a results table.
- **`et al.`** in IEEE-style citations may stay despite the avoid-Latin rule.
- **Results-section topic sentences** may be bolded (a deliberate exception to
  the bold-only-table-best rule), but ONLY when the user explicitly asks to
  restructure the Results section. Do not apply unprompted.

### ML-paper standards (default in research manuscripts)

- Structure: state the problem, then the gap in prior work, then contributions
  as an explicit enumerated list.
- Related work positions rather than lists: tie every cited work to how the
  present work differs.
- State failure cases and negative results explicitly (incomplete runs, weak
  classes, counterintuitive losses) as findings, not silent omissions.
- Consistent terminology and number formatting: one canonical name per
  method/dataset, uniform significant figures per metric, leading zeros,
  thousands separators, consistent math-vs-text notation for a given symbol.
- Results sections: one paragraph = one core claim, topic sentence first, so the
  section reads from the first sentences alone.

### Audience and venue calibration

- Establish the paper's topic, home field, and target venue before rewriting.
  Audience determines vocabulary, framing, and what counts as assumed
  background. Read it from the document or filename, or ask the user.
- Follow the conventions of the venue's field, not only the author's field.
  Terminology, section structure, and the line between assumed and explained
  background all shift across communities.
- Define terms the venue's audience and reviewers are unlikely to know on first
  use, especially when the field and the venue diverge. A medical-imaging paper
  at an applied-computer-science venue should define clinical terms (for example
  pneumothorax, consolidation) the first time they appear, because CS reviewers
  do not share that background. The reverse holds too: do not belabor CS basics
  for a CS audience. This is Sutton's "stand with your reader" and jargon-budget
  advice (Layer 3) applied to a specific audience.

---

## Layer 2: Littman, "Stylistic Comments" (verbatim)

Source: Michael L. Littman, https://cs.brown.edu/people/mlittman/etc/style.html
(updated 2012, 2014).

### Comma usage

- Use a comma after "but", "next", "here", "now", "then", adverbs etc., when
  starting a sentence. Then, your text will flow nicely.
- If your sentence has one, always use a comma to set off a leading
  prepositional phrase.
- Use commas to set off "parenthetical" type phrases, common in many people's
  writing, embedded in the sentence.
- As you, I, and everyone else knows, commas are important in lists.
- It is customary to use commas when joining two sentences together into one, so
  don't forget.
- Use "which" only after a comma, because it is used to add descriptive features
  instead of defining features. So, "the ball which I threw" should either be
  "the ball that I threw" (of the many possible balls, I'm talking about the
  thrown one) or "the ball, which I threw" (that ball I'm talking about, you
  might also like to know that I threw it).
- Avoid using commas for situations not on this list even if you want to add one
  because it feels like you want to take a breath.

### Apostrophe usage

- Pluralize abbreviations using an "s". Use "MDPs", not "MDP's", to mean Markov
  decision processes.
- Master "its" vs. "it's". "Its" is possessive and "it's" is a contraction for
  "it is".

### Clear, direct language

- Avoid the dangling "this". Write "this example shows that", not "this shows
  that". Hint: try changing "this" to "it". Usually that makes it obvious that
  more context (a noun) is needed.
- Change "in order to" to simply "to".
- Change "utilize" to "use".

### Dash/hyphen usage

- Hyphenate noun phrases if they defy the natural right-to-left grouping in
  English. "algorithm for reinforcement learning" is ok, but "reinforcement
  learning algorithm" should be "reinforcement-learning algorithm". Hyphenation
  groups words at the beginning of a noun phrase, but not when there are only
  two words. (Colbert example: "Nazi-treasure hunter" = someone seeking Nazi
  treasure, vs. "Nazi treasure hunter" = a Nazi seeking treasure.)
- Know the dash lengths: hyphen (single dash in LaTeX) within words; ranges use
  an en-dash (double dash `--` in LaTeX); em-dash (triple dash `---`) to set off
  a phrase. NOTE: the user forbids em-dashes; see Layer 1.

### Confusable pairs

- led / lead (past tense of "lead" is "led").
- affect / effect (affect is usually the verb, effect usually the noun).
- bare / bear.
- it's / its.
- dissertation / thesis (the dissertation is the document, the thesis is the
  claim it supports).
- their / there.
- hear / here.
- shear / sheer.
- fair / fare.

### One-word vs. two-word phrases

One word as a noun, two words as a verb:

| verb | noun |
| --- | --- |
| trade off | tradeoff |
| cut off | cutoff |
| print out | printout |
| pick up | pickup |
| write up | writeup |

More pairs: follow up / followup, speed up / speedup, set up / setup, in line /
inline, make up / makeup.

### Paper structure

- Don't use citations as nouns. Say "As explained by Kearns and Singh (2002)" or
  "As explained in the literature (Kearns and Singh 2002)", not "As explained by
  (Kearns and Singh, 2002)".
- Don't use Latin abbreviations. Say "that is" instead of "i.e." and "for
  example" instead of "e.g.". Spelled-out Latin like "ad hoc" is fine.
- Avoid empty sections. Put some text between a section title and its first
  subsection.
- Capitalize names of structural items: "Section 3.1", "Item 2", "Table 3",
  "Assumption 4", "Theorem 1.5". Lowercase "next section", but "Section 6".
- Don't begin a sentence with a variable or function name. Put "The equation
  ..." in front first.
- Put punctuation after an equation, especially if it ends a sentence.
- Every paragraph, section, paper, chapter, and dissertation should have a topic
  sentence.

---

## Layer 3: Sutton, "Advice on Technical Writing" (verbatim)

Source: Richard Sutton, "Rich's Advice on Technical Writing".

### Order of ideas (the most important thing)

1. Say the most important thing first, or as soon as possible consistent with
   the other two rules.
2. Don't say anything before it can be understood.
3. Show your intent early.

### Be precise and concise (and plain)

- Omit unnecessary words and ideas.
- Avoid metaphorical language.
- Avoid superlatives that weaken (like "very").
- Beware careless exaggeration.
- Don't say anything that is Arguably Not True (ANT).
- Don't say anything whose Opposite is Also True (OAT).
- Words should be used for their literal meanings.

### Separate what can be separated; complete what can be completed

These let the reader rest and free their short-term memory. Separate:

- prior work from your work
- algorithms from environments
- problems from solution methods
- results from conclusions (using tense)
- exposition from argument
- speculations from claims
- what you have shown from what you have suggested
- your motivations from your ambitions

### Use tense consistently and thoughtfully, to make distinctions

- Algorithms, environments, ideas, issues, and conclusions: present tense.
- Experiments and results: past tense.
- Use tense to telegraph whether you are describing results (past tense) or
  drawing conclusions from results (present tense).
- Save future tense for what is really future. Don't use it for things that
  just appear later in the document.

### Vocabulary

- Explicit definitions are often needed and helpful.
- Use definitions to say what you mean by the words in this document.
- Use italics for definitions.
- Even without a formal definition, it helps to allocate words to ideas.
- When assigning a word to an idea, explain the idea first, then attach the word.
- Imagine you have a jargon budget. Try not to define too many things.

### Elementary rules of usage

- Use a comma before "and" only when connecting independent clauses (clauses
  with their own subject).
- Use "that" and "which" correctly (one specifies, the other notes).
- Use commas (or parentheses) around parentheticals.
- Among near synonyms, choose the most specific word. Don't use "since" for
  "because", or "continuous" for "continual".
- Use "i.e." and "e.g." only in parentheses, always followed by a comma. NOTE:
  the user prefers spelled-out English (Littman); see conflict notes.
- Use the Oxford comma (a, b, and c).
- Never use a citation as part of a sentence.
- Use citations thoughtfully. What is their meaning? Is it clear?
- Don't cite a textbook for an idea unless it is the original source.
- Use quotation marks only for genuine quotations. No scare quotes.
- If a sentence has an "if", it should always have a "then".
- Punctuate equations so they are parts of the sentences.
- If a sentence is completely clear without commas, it may be best to omit them.
- Don't begin a sentence with mathematical notation or an equation number.
- Every rule has exceptions, but first learn to follow the rules.
- Numbered things are capitalized: Chapter 3, Section, Figure, Equation, Table.
- If you number equations like (3), refer to them like (3).

### Paragraphs are the primary unit of composition

- One clear topic per paragraph.
- Set the tone with an initial topic sentence, or build to a final one.
- The ideal: the paper can be understood by reading just the topic sentences.

### Generally

- Find the simple essence.
- Expect to re-think and re-write until the paper is as simple as it ought to be.
- Find your voice. Stand with your reader. You know things they don't, so you
  are telling them.
- Avoid weak verbs (like "has" and "is").
- You lose half your readers with each equation.
- Bibtex hides from the writer what the reader will see, causing weak citations
  and inconsistent references. Escape the Bibtex virus.
- Use name and year in citations whenever possible.
- Use "lastname, initials (year)" in references (`\bibliographystyle{apalike}`).
- Don't put citations and links in a different color.

---

## Conflict notes (how to resolve clashes)

- **Em-dashes:** user "no em-dash" beats Littman's em-dash usage. Never emit
  `---` or `—`.
- **Latin abbreviations:** Littman ("for example" / "that is") beats Sutton
  ("i.e." / "e.g." in parentheses). Spell them out in English. Exception:
  `et al.` in IEEE-style citations may stay.
- **Semicolons:** user "no semicolons" applies even though both sources use them
  freely in their own prose.
- **Citation format:** Sutton prefers name-year (apalike). Match the target
  document's existing citation style rather than forcing apalike. Both sources
  agree: never use a bare parenthetical citation as a sentence's noun.
- **Bold:** user convention (no bold method names) has no analog in the sources
  and simply applies.
