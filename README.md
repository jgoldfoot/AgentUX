# AgentUX
A design framework for building dual-mode interfaces that work for both humans and AI agents.

## The Problem
Most AI agents (~80%) make simple HTTP requests without JavaScript execution. Client-side rendered applications are invisible to them, regardless of how well-structured the content is. This creates a critical gap: interfaces can be perfectly optimized for agents yet completely inaccessible.

## The Solution
AgentUX provides:
- **FR-1: Initial Payload Accessibility** - Foundational requirement ensuring content exists in server response
- **Rendering Strategy Guidance** - SSR/SSG/CSR classification and implementation patterns
- **Validated Design Patterns** - Proven approaches backed by empirical research
- **Compliance Methodology** - Quantified metrics and validation protocols

## Quick Start

### See FR-1 in Action (5 minutes)

**1. Test the validator:**
```bash
node tools/validators/fr1-validator.js https://example.com
```

**2. Compare CSR vs SSR:**

Open both examples in your browser - they look identical to humans:
- [CSR Example (Fails)](examples/csr-fail-example.html) - Client-side rendered
- [SSR Example (Passes)](examples/ssr-pass-example.html) - Server-side rendered

**3. Validate them:**
```bash
# This will FAIL - content only in JavaScript
node tools/validators/fr1-validator.js examples/csr-fail-example.html

# This will PASS - content in initial HTML
node tools/validators/fr1-validator.js examples/ssr-pass-example.html
```

**The difference?** AI agents see the SSR example, but the CSR example is invisible to them.

### FR-1 Compliance Checklist

Does your site pass FR-1? Check if:

- ✅ Core content exists in initial HTML payload (not just `<div id="root">`)
- ✅ Meaningful text (200+ characters) loads without JavaScript
- ✅ Semantic HTML5 elements used (article, section, nav)
- ✅ Links are navigable without JavaScript
- ✅ Structured metadata included (Open Graph, Schema.org)

Test your site: `node tools/validators/fr1-validator.js https://yoursite.com`

## Key Research Findings
- 72% human success vs. 12% agent success on conventional interfaces
- 42-70% agent success on AgentUX-optimized interfaces
- 40-75% improvement in agent task completion with proper rendering

[See full methodology](./docs/whitepaper.md#methodology)

## Documentation
- [White Paper v2.1](./docs/whitepaper.md) - Research and methodology
- [Implementation Guide](./docs/implementation.md) - How to implement FR-1
- [API Reference](./docs/api.md) - Technical reference
- [Getting Started Guide](docs/getting-started.md) - Detailed setup instructions
- [AGENTS.md](AGENTS.md) - Guide for AI coding agents

## License
Apache 2.0 - See [LICENSE](./LICENSE)
