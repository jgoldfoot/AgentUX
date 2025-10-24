# AGENTS.md

## For AI Coding Agents

This file helps AI agents understand how to contribute to BiModal Design, a framework
for building dual-mode interfaces that work for both humans and AI agents.

---

## Project Overview

**BiModal Design** addresses a critical gap: ~80% of AI agents make simple HTTP
requests without JavaScript execution, making client-side rendered applications
invisible to them.

**Core Concept:** FR-1 (Initial Payload Accessibility) - Content must exist in
the server's initial HTML response.

**Key Metrics:**

- Conventional interfaces: 72% human success vs. 12% agent success
- BiModal Design-optimized interfaces: 42-70% agent success
- Improvement: 40-75% better agent task completion

---

## Repository Structure

```
BiModal Design/
├── README.md                          # Main documentation
├── AGENTS.md                          # This file
├── docs/                              # White papers and guides
│   ├── whitepaper-v2.1.md            # Research and methodology
│   ├── implementation-guide.md       # How to implement FR-1
│   └── api-reference.md              # Technical reference
├── examples/                          # Working examples
│   ├── csr-fail-example.html         # CSR that fails FR-1
│   └── ssr-pass-example.html         # SSR that passes FR-1
└── tools/
    └── validators/
        └── fr1-validator.js          # CLI validation tool
```

---

## How to Contribute

### 1. Testing Changes

Before submitting any changes, validate examples:

```bash
# Test that CSR example fails FR-1
node tools/validators/fr1-validator.js examples/csr-fail-example.html
# Expected: FAIL with score < 70

# Test that SSR example passes FR-1
node tools/validators/fr1-validator.js examples/ssr-pass-example.html
# Expected: PASS with score >= 70
```

### 2. Adding New Examples

When adding examples:

- Create both a "fail" and "pass" version
- Use semantic HTML5 elements (article, section, nav, main)
- Include Open Graph metadata in passing examples
- Add clear comments explaining what makes it pass/fail FR-1
- Test with the validator before committing

Template for new examples:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="..." />
    <meta property="og:title" content="..." />
    <!-- Structured metadata helps agents -->
  </head>
  <body>
    <!-- All content in initial HTML for FR-1 compliance -->
    <main>
      <article>
        <!-- Use semantic HTML -->
      </article>
    </main>

    <script>
      // JavaScript is OPTIONAL - progressive enhancement only
    </script>
  </body>
</html>
```

### 3. Improving the Validator

The FR-1 validator checks:

- Content exists in initial payload (text length > 200 chars)
- Not a blank SPA shell (no empty `<div id="root">`)
- Uses semantic HTML5 elements
- No JavaScript required for core content
- Includes structured metadata
- Contains navigable links

To improve the validator:

```javascript
// Add new checks in analyzePayload() function
function analyzePayload(response) {
  const results = { passed: [], failed: [], warnings: [], score: 0 };

  // Add your check here
  const hasNewFeature = checkForNewFeature(response.body);
  if (hasNewFeature) {
    results.passed.push('Description of what passed');
    results.score += 10; // Weight appropriately
  }

  return results;
}
```

### 4. Documentation Updates

When updating docs:

- Keep README focused and brief (link to detailed docs)
- Update whitepaper for research findings
- Update implementation guide for practical steps
- Add real-world examples with before/after metrics

### 5. Adding New Patterns

To add a new design pattern:

1. Document the problem it solves
2. Show code examples (both incorrect and correct)
3. Explain why it matters for agent accessibility
4. Add validator checks if applicable
5. Reference relevant sections of the whitepaper

---

## Common Agent Tasks

### Task: Validate a URL for FR-1 compliance

```bash
node tools/validators/fr1-validator.js https://example.com
```

### Task: Create a new example

1. Copy either `csr-fail-example.html` or `ssr-pass-example.html`
2. Modify for your use case
3. Update comments to explain the pattern
4. Test with validator
5. Update README to reference the new example

### Task: Generate documentation

When generating docs:

- Focus on actionable guidance
- Include code examples
- Show before/after comparisons
- Cite specific metrics from the whitepaper
- Link to working examples

### Task: Add a new validator check

1. Edit `tools/validators/fr1-validator.js`
2. Add check in `analyzePayload()` function
3. Add appropriate scoring (ensure total = 100)
4. Update pass/fail thresholds if needed
5. Add test cases in comments

---

## Testing Your Contributions

### Manual Testing Checklist

- [ ] Validator runs without errors
- [ ] CSR example still fails FR-1
- [ ] SSR example still passes FR-1
- [ ] New examples are tested with validator
- [ ] Documentation is clear and actionable
- [ ] Links in README work
- [ ] Code follows existing patterns

### Validation Commands

```bash
# Test validator tool
node tools/validators/fr1-validator.js https://example.com

# Test local files
node tools/validators/fr1-validator.js file:///absolute/path/to/example.html

# Test that examples maintain expected results
node tools/validators/fr1-validator.js examples/csr-fail-example.html | grep "FAIL"
node tools/validators/fr1-validator.js examples/ssr-pass-example.html | grep "PASS"
```

---

## Key Principles for Agent-Readable Code

When contributing to this project, remember:

1. **Content First**: Initial HTML payload must contain all critical content
2. **Semantic Markup**: Use proper HTML5 elements (article, section, nav)
3. **Progressive Enhancement**: JavaScript should enhance, not enable
4. **Structured Data**: Include metadata (Open Graph, Schema.org)
5. **Testable**: Changes should be validatable with the FR-1 tool

---

## Questions or Issues?

- Check the [White Paper](docs/whitepaper-v2.1.md) for research methodology
- Review the [Implementation Guide](docs/implementation-guide.md) for practical
  steps
- Open an issue with the label `question` for clarification
- Reference existing examples for patterns

---

## License

This project is licensed under Apache-2.0. All contributions will be under the
same license.

---

**Note for AI Agents:** This project is meta - it's about making interfaces
accessible to agents like you. When contributing, consider: "Would an agent
using simple HTTP requests be able to access this content?" If no, it likely
violates FR-1.
