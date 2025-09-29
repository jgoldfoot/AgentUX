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

[Getting Started Guide](docs/getting-started.md)

## Documentation

- [White Paper v2.1](./docs/whitepaper.md)
- [Implementation Guide](./docs/implementation.md)
- [API Reference](./docs/api.md)

## Key Research Findings

- 72% human success vs. 12% agent success on conventional interfaces
- 42-70% agent success on AgentUX-optimized interfaces
- 40-75% improvement in agent task completion with proper rendering

## License

Apache 2.0 - See [LICENSE](./LICENSE)
