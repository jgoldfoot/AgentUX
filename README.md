# AgentUX

> A design framework for building dual-mode interfaces that work optimally for both humans and AI agents.

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Status: Research Framework](https://img.shields.io/badge/Status-Research%20Framework-yellow.svg)]()

## The Problem

Most AI agents (~80%) make simple HTTP requests without JavaScript execution. Client-side rendered applications appear completely empty to them, regardless of how well-structured the content is. This creates a critical accessibility gap where interfaces can be perfectly optimized for agents yet completely invisible.

**Example of the problem:**
- **What humans see**: Beautiful, interactive interface with perfect semantic structure
- **What AI agents see**: `<div id="root"></div>` + empty page

## The Solution

AgentUX provides a comprehensive framework for designing interfaces that work for both audiences:

### 🏗️ **Foundational Requirements**
- **FR-1: Initial Payload Accessibility** - Content must exist in server response
- **Rendering Strategy Guidance** - SSR/SSG/CSR classification and patterns
- **Progressive Enhancement** - Layer functionality on accessible foundations

### 📋 **Design Principles**
- **Semantic HTML5** structure with proper landmarks
- **ARIA roles and properties** for enhanced meaning
- **Agent-specific attributes** for optimization
- **Structured data** (JSON-LD) for discoverability

### 🔧 **Validation Tools**
- **FR1 Checker** - Test initial payload accessibility
- **Compliance Auditor** - Full AgentUX assessment
- **CI/CD Integration** - Automated validation pipelines

## Quick Start

### 1. Test Your Current Site

```bash
# Test if your site is visible to AI agents
curl -s https://your-site.com | grep -E '<(nav|main|h1|form)'

# Should return semantic HTML elements, not empty divs
```

### 2. Run AgentUX Validation

```bash
# Use the FR1 checker tool
cd tools/validators
node fr1-checker.js https://your-site.com --verbose
```

### 3. Implement Core Patterns

```html
<!-- Ensure content is server-rendered -->
<main role="main" data-agent-context="homepage">
  <h1>Your Content</h1>
  <nav role="navigation" aria-label="Main navigation">
    <a href="/products" data-agent-action="browse-products">Products</a>
  </nav>
</main>

<!-- Add structured data -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Your Site",
  "description": "Your description"
}
</script>
```

## Key Research Findings

- **72% human success** vs **12% agent success** on conventional interfaces
- **42-70% agent success** on AgentUX-optimized interfaces  
- **40-75% improvement** in agent task completion with proper rendering

## Documentation

| Document | Description |
|----------|-------------|
| [📄 White Paper](./docs/whitepaper.md) | Complete framework specification v2.1 |
| [🛠️ Implementation Guide](./docs/implementation-guide.md) | Step-by-step development guide |
| [📊 Case Studies](./docs/case-studies.md) | Real-world examples and results |
| [🔍 Troubleshooting](./docs/troubleshooting.md) | Common issues and solutions |

## Tools & Examples

### Validation Tools
- **[FR1 Checker](./tools/validators/fr1-checker.js)** - Test initial payload accessibility
- **[Compliance Auditor](./tools/validators/compliance-audit.js)** - Full AgentUX assessment

### Implementation Examples  
- **[Astro SSG Example](./examples/astro-ssg-example.md)** - Static site generation approach
- **[CSR Mitigation](./examples/csr-mitigation.md)** - Client-side rendering fixes

## Framework Maturity Levels

| Level | Name | Requirements | Success Rate |
|-------|------|-------------|-------------|
| **0** | Infrastructure Ready | FR-1 compliant (content in initial payload) | Basic |
| **1** | Basic Accessibility | WCAG 2.2 AA + semantic HTML | >75% |
| **2** | Semantic Stability | ARIA roles + structured data | >85% |
| **3** | Agent-Tested | Automated validation + testing | >90% |
| **4** | Agent-Native | AI-first design patterns | >95% |

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Setup

```bash
# Clone the repository
git clone https://github.com/jgoldfoot/AgentUX.git
cd AgentUX

# Install dependencies for tools
cd tools/validators
npm install

# Run tests
npm test
```

## Research & Citations

This framework is based on peer-reviewed research:

- **WebAgents Survey 2025**: "A Survey of WebAgents: Towards Next-Generation AI Agents for Web Automation" - arXiv:2503.23350v1
- **ST-WebAgentBench**: "A Benchmark for Evaluating Safety and Trustworthiness in Web Agents" - arXiv:2410.06703v2  
- **τ-bench**: "A Benchmark for Tool-Agent-User Interaction in Real-World Domains" - arXiv:2406.12045

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Author

**Joel Goldfoot** - UX design leader and researcher specializing in human-AI interaction patterns.

- 📧 Contact: [joel@goldfoot.com](mailto:joel@goldfoot.com)
- 🔗 LinkedIn: [linkedin.com/in/joelgoldfoot](https://linkedin.com/in/joelgoldfoot)
- 🌐 Website: [ai-plus.design](https://ai-plus.design)

---

**AgentUX** - Designing the future of human-AI collaboration, one interface at a time.
