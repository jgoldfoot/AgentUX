# **BiModal Design**

> **A design framework for building dual-mode interfaces that work optimally for both humans and AI agents.**

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Status: Research Framework](https://img.shields.io/badge/Status-Research%20Framework-yellow.svg)]()
[![Node.js](https://img.shields.io/badge/node-%3E%3D20.11.0-brightgreen.svg)]()
[![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## 🧭 Table of Contents

1. [Overview](#-overview)
2. [The Problem](#-the-problem)
3. [The Solution](#-the-solution)
4. [Quick Start](#-quick-start)
5. [Key Research Findings](#-key-research-findings)
6. [Documentation](#-documentation)
7. [Tools & Examples](#-tools--examples)
8. [Framework Maturity Levels](#-framework-maturity-levels)
9. [Contributing](#-contributing)
10. [Development Setup](#-development-setup)
11. [Research & Citations](#-research--citations)
12. [License](#-license)
13. [Author](#-author)

---

## 🧠 Overview

**BiModal Design** defines best practices and validation tools for creating **dual-mode interfaces** — designs that remain equally functional for **human users** and **AI agents**.

As agentic technologies proliferate, ensuring mutual interpretability between people and machines becomes essential. BiModal Design bridges that gap through **semantic design standards**, **agent-readable metadata**, and **progressive rendering strategies**.

---

## ❌ The Problem

Most AI agents (~80%) perform **simple HTTP requests** without executing JavaScript.  
Client-side rendered (CSR) apps appear blank to them, even when perfectly optimized for human experience.

| Perspective | Experience |
|-------------|------------|
| 👩‍💻 **Human** | Sees a rich, interactive, accessible interface |
| 🤖 **AI Agent** | Receives `<div id="root"></div>` — no content |

This invisibility undermines discoverability, automation, and LLM-driven workflows.

---

## ✅ The Solution

BiModal Design establishes **foundational requirements, design principles, and validation tools** to ensure both humans and agents perceive meaningful structure.

### 🏗️ Foundational Requirements

- **FR-1: Initial Payload Accessibility** — content must exist in the first server response  
- **Rendering Strategy Guidance** — patterns for SSR / SSG / CSR and hybrid models  
- **Progressive Enhancement** — interactivity should build upon accessible content

### 🎨 Design Principles

- Semantic HTML5 landmarks  
- WCAG 2.2 AA alignment  
- ARIA roles and agent-specific attributes  
- JSON-LD structured data for discoverability

### 🔧 Validation Tools

- **FR-1 Checker** — verify server payload accessibility
- **Compliance Auditor** — full BiModal Design rule suite
- **CI/CD Integration** — continuous validation

---

## ⚡ Quick Start

### 1. Test Your Current Site
```bash
# Check if your site exposes accessible structure to agents
curl -s https://your-site.com | grep -E '<(nav|main|h1|form)'
```

✅ Expect visible semantic HTML.  
❌ Empty `<div id="root"></div>` means content is invisible to agents.

### 2. Run BiModal Design Validation
```bash
cd tools/validators
node fr1-checker.js https://your-site.com --verbose
```

### 3. Implement Core Patterns
```html
<main role="main" data-agent-context="homepage">
  <h1>Your Content</h1>
  <nav role="navigation" aria-label="Main navigation">
    <a href="/products" data-agent-action="browse-products">Products</a>
  </nav>
</main>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Your Site",
  "description": "Your description"
}
</script>
```

---

## 📊 Key Research Findings

| Metric | Conventional Interfaces | BiModal Design-Optimized | Improvement |
|--------|------------------------|--------------------------|-------------|
| Human Task Success | 72% | — | — |
| Agent Task Success | 12% | 42–70% | +40–75% |
| Agent Completion Rate | — | +40–75% | Significant |

---

## 📘 Documentation

| Document | Description |
|----------|-------------|
| 📄 White Paper | Framework specification v2.1 |
| 🛠️ Implementation Guide | Development & deployment practices |
| 📊 Case Studies | Real-world validation data |
| 🔍 Troubleshooting | Common errors and corrections |

---

## 🧪 Tools & Examples

### Validation Tools

- **FR-1 Checker** — test server payload accessibility
- **Compliance Auditor** — full framework compliance suite

### Implementation Examples

- **Astro SSG Example** — static rendering pattern
- **CSR Mitigation** — client-rendered fallback fixes

---

## 🧬 Framework Maturity Levels

| Level | Name | Requirements | Typical Agent Success |
|-------|------|--------------|----------------------|
| 0 | Infrastructure Ready | FR-1 compliant (content in payload) | Basic |
| 1 | Basic Accessibility | WCAG 2.2 AA + semantic HTML | ≥ 75% |
| 2 | Semantic Stability | ARIA + structured data | ≥ 85% |
| 3 | Agent-Tested | Automated validation | ≥ 90% |
| 4 | Agent-Native | AI-first design paradigm | ≥ 95% |

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Commit with a Conventional Commit message
4. Submit a Pull Request

Refer to the [Contributing Guidelines](CONTRIBUTING.md) for review standards and code style.

---

## 🧰 Development Setup
```bash
# Clone the repository
git clone https://github.com/jgoldfoot/BiModalDesign.git
cd BiModalDesign

# Install dependencies
cd tools/validators
npm install

# Run tests
npm test
```

---

## 🔬 Research & Citations

- **WebAgents Survey 2025** — "A Survey of WebAgents: Towards Next-Generation AI Agents for Web Automation" (arXiv:2503.23350v1)
- **ST-WebAgentBench** — "A Benchmark for Evaluating Safety and Trustworthiness in Web Agents" (arXiv:2410.06703v2)
- **τ-bench** — "A Benchmark for Tool-Agent-User Interaction in Real-World Domains" (arXiv:2406.12045)

---

## ⚖️ License

Licensed under the Apache License 2.0.  
See [LICENSE](LICENSE) for full details.

---

## 👤 Author

**Joel Goldfoot**  
Senior Director of Product Design | AI + UX Researcher

📧 joel@goldfoot.com  
🔗 [linkedin.com/in/joelgoldfoot](https://linkedin.com/in/joelgoldfoot)  
🌐 [ai-plus.design](https://ai-plus.design)

---

**BiModal Design** — Designing the future of human-AI collaboration, one interface at a time.
