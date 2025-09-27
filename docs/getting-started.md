markdown# Getting Started with AgentUX

## Quick Start Checklist

Before implementing AgentUX patterns, ensure your application meets **FR-1: Initial Payload Accessibility** - the foundational requirement that content exists in the server response.

### ✅ Step 1: Check Your Rendering Strategy

**Test this first:** View source (Ctrl+U) on your live site. Can you see your content in the HTML?

- **✅ SSR/SSG**: Content visible in source → Agent accessible
- **❌ CSR only**: Empty divs in source → Agents can't see content

### ✅ Step 2: Implement Basic Semantic Structure
```html
<!-- Before: Agent-invisible -->
<div class="header">
  <div class="nav">...</div>
</div>

<!-- After: Agent-accessible -->
<header role="banner">
  <nav role="navigation" aria-label="Main navigation">
    <ul>
      <li><a href="/products">Products</a></li>
      <li><a href="/about">About</a></li>
    </ul>
  </nav>
</header>
✅ Step 3: Add Agent-Friendly Form Structure
html<form data-agent-intent="user-registration">
  <fieldset data-agent-group="personal-info">
    <legend>Personal Information</legend>
    
    <label for="email">Email Address</label>
    <input id="email" 
           type="email" 
           data-agent-field="user.email"
           aria-required="true">
  </fieldset>
  
  <button type="submit" data-agent-action="submit-registration">
    Create Account
  </button>
</form>
Framework-Specific Implementation
Next.js (Recommended)
bash# Ensure SSR/SSG for agent accessibility
npm create next-app@latest --typescript --app
Nuxt (Vue)
bash# Built-in SSR
npx nuxi@latest init my-agentux-app
Astro (Best for content sites)
bash# Static generation by default
npm create astro@latest
Testing Agent Accessibility
Quick Test: cURL Method
bash# Test if agents can see your content
curl -s https://yoursite.com | grep "main content"

# Should return your actual content, not empty divs
Browser Test

Disable JavaScript in your browser
Navigate to your site
Can you still see and use the core functionality?

Common Mistakes to Avoid
❌ CSR-only without fallbacks - Most agents can't execute JavaScript
❌ Dynamic IDs - id="btn-xyz123" breaks agent selectors
❌ Visual-only cues - Color changes without semantic updates
❌ Missing labels - Agents need aria-label or explicit labels
Next Steps

Validate compliance: Use our compliance checklist
Add structured data: Implement JSON-LD for better agent understanding
Test with real agents: Set up automated testing

Need Help?

📖 Full White Paper
🐛 Report Issues
💬 Discussions

