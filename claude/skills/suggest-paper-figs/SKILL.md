---
name: suggest-paper-figs
description: Audit a paper's figures and tables as a research assistant checking claims. Use when the user asks which figures/tables to include, whether a figure earns its place, what is missing, or how to split visuals between the main body and appendices. Recommends additions, demotions, and removals, and checks every visual against the conventions of the paper's own field.
---

# Suggest Paper Figures

Act as a critical research assistant auditing the figures and tables of a
manuscript. The job is not to praise the existing visuals but to judge whether
each one earns its place, whether the paper's claims are backed by the right
visual evidence, and whether the figure/table set matches the conventions of the
paper's field. Be honest, not narrative-supporting: recommend cutting a
beloved figure if it carries no information, and recommend adding a figure the
authors omitted if a claim needs it.

## When to use

- The user asks what figures or tables to include, or whether to add one.
- The user asks whether a current figure is worth keeping, or is filler.
- The user asks how to divide visuals between the main paper and appendices.
- The user asks whether their figures match what reviewers in their field expect.

## Procedure

1. **Identify the field and venue first.** Conventions differ sharply (an ML
   conference paper, a medical-imaging journal, a systems paper, and a biology
   paper each expect different visuals). Read the manuscript's title, abstract,
   and target venue. If the venue is unclear, ask. The field sets the bar for
   every later judgment, so do not skip this.

2. **Inventory what exists.** List every figure and table with its number,
   caption, and current location (main body vs appendix). Note the type of each:
   architecture diagram, qualitative examples, quantitative results table,
   training/learning curve, ablation, confusion matrix, ROC/PR curve,
   distribution plot, schematic, etc.

3. **Extract the paper's claims.** Read the contributions, results, and
   discussion. Write down each substantive claim the paper makes ("model X beats
   baseline Y", "method is lightweight", "generalizes out of distribution",
   "fails on class Z"). Every headline claim should have a visual or a table that
   a skeptical reviewer can check it against. A claim with no backing visual is a
   gap; a visual backing no claim is a candidate for cutting or demotion.

4. **Score each existing visual.** For each figure/table, judge:
   - *Does it support a stated claim, or is it decorative?* A confusion matrix
     that no sentence interprets is filler.
   - *Information density.* Does it convey something the text cannot say in one
     line? A table of three numbers is usually a sentence. A bar chart of values
     already in a table is redundant.
   - *Honesty.* Does it hide a weakness (truncated axis, cherry-picked example,
     missing baseline, no error bars/variance where the field expects them)?
     Flag this even when it helps the paper's story.
   - *Field fit.* Is this the visual a reviewer in this field expects for this
     claim? (e.g., detection papers expect PR curves and qualitative
     detections; classification papers expect confusion matrices and per-class
     metrics; any learning paper reporting a single seed invites a variance
     question.)
   - Give a verdict: keep in main, demote to appendix, merge with another,
     or cut.

5. **Find what is missing.** Cross the claim list against the visual list. For
   each unbacked claim, recommend the specific figure or table that would back
   it, and say what it must contain (axes, baselines, splits, error bars). Call
   out field-standard visuals the paper omits (a method-overview/architecture
   figure, a dataset-summary table, an ablation table, a qualitative
   success/failure panel, a complexity/efficiency table when the paper claims to
   be lightweight or fast).

6. **Assign main body vs appendix.** The main body holds the minimum set that
   carries the headline argument: typically the method figure, the primary
   results table, and one or two figures for the central claims. Everything that
   supports rigor but not the headline (full hyperparameters, per-class
   breakdowns, extra qualitative examples, secondary ablations, robustness
   sweeps, additional datasets) goes to the appendix. Respect page limits: if
   the venue caps pages, say what to move first. State a reason for each
   placement.

7. **Report.** Produce four short sections:
   - *Keep as-is* (main-body visuals that earn their place).
   - *Change* (demote, promote, merge, fix axes/baselines/variance), each with
     the reason and the specific fix.
   - *Add* (missing visuals, each tied to the claim it backs and what it must
     contain).
   - *Cut* (visuals carrying no information, with the one-line text that replaces
     them).
   Order recommendations by impact on the paper's credibility, most important
   first. End with a one-line view of whether the figure set, as revised, would
   satisfy a reviewer in this field.

## Notes

- Default to the user's standing conventions when you draft any caption or prose:
  no em-dashes, no semicolons, no bold on method names (bold only the best value
  in a results table). See the `rewrite-paper` skill for the full style.
- Be concrete about the field. "ML papers usually include X" is weak; name the
  visual the specific subfield expects (object detection vs image classification
  vs generative modeling each differ).
- Never recommend a figure to make results look better than they are. If a
  visual would mislead (hidden variance, cherry-picked sample, truncated axis),
  say so even when it strengthens the narrative.
- When you cannot tell whether a visual backs a real claim without seeing the
  underlying numbers, ask for them rather than guessing.
- A good default test: if removing a figure and replacing it with one sentence
  loses nothing, it belongs in an appendix or in the text, not in the main body.
