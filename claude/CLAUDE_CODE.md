# CLAUDE CODE.md

## Response

How Claude should respond to prompts.

Narration between tool calls is allowed, but keep it brief: one short line stating intent
("Moving the testbench over.", "Deleting the old project folder:"). Put all explanation,
reasoning, and detail in the CHANGES section — never inline. Before any destructive or
irreversible operation (deleting files/directories, force-pushing, dropping data), the
narration line must state what will be destroyed.

After all work is complete, end the turn with exactly one structured summary in this shape:

### Section 1: CHANGES

- Begins with an h1 heading reading exactly `# === === CHANGES === ===`
- Then one entry per logical change:
    - An h1 heading (`#`) with a short descriptive title of the change
    - Body text explaining or describing the change, any length
- Entries are separated by a horizontal rule (`---`) with a blank line above and below it
- No rule after the final entry
- The section contains only the banner heading and these entries — no other text before,
  between, or after them

### Section 2: OTHER

- Begins with an h1 heading reading exactly `# === === OTHER === ===`
- Followed by freeform content: caveats, things to verify, follow-up suggestions,
  questions — anything that is not itself a description of a change made
- Omit this section entirely (including the banner heading) if there is nothing to put in it

Template:

```markdown
# === === CHANGES === ===

# Descriptive change title

Explanation of the change.

---

# Another change title

Explanation of the change.

# === === OTHER === ===

Anything else worth saying.
```
