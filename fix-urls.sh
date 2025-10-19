#!/bin/bash

# AgentUX Repository URL Fixer
# This script automatically fixes all broken URLs in the repository
# for immediate public launch readiness

echo "🔧 Starting AgentUX URL fixes..."

# Function to backup files before modification
backup_file() {
    if [ -f "$1" ]; then
        cp "$1" "$1.backup"
        echo "✅ Backed up $1"
    fi
}

# Function to apply fixes to a file
fix_file_urls() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo "⚠️  File not found: $file"
        return 1
    fi
    
    echo "🔄 Fixing URLs in $file..."
    
    # 1. Replace GitHub repository URLs
    sed -i.tmp 's|github\.com/agentux/core|github.com/jgoldfoot/AgentUX|g' "$file"
    
    # 2. Replace broken agentux.design domain references
    sed -i.tmp 's|\[agentux\.design\](https://agentux\.design)|agentux.design *(coming soon)*|g' "$file"
    sed -i.tmp 's|https://agentux\.design|https://github.com/jgoldfoot/AgentUX|g' "$file"
    sed -i.tmp 's|agentux\.design|github.com/jgoldfoot/AgentUX|g' "$file"
    
    # 3. Replace documentation URLs
    sed -i.tmp 's|docs\.agentux\.design|https://github.com/jgoldfoot/AgentUX/tree/main/docs|g' "$file"
    sed -i.tmp 's|\[docs\.agentux\.design\]([^)]*)|[AgentUX Documentation](https://github.com/jgoldfoot/AgentUX/tree/main/docs)|g' "$file"
    
    # 4. Replace community URLs
    sed -i.tmp 's|community\.agentux\.design|https://github.com/jgoldfoot/AgentUX/discussions|g' "$file"
    sed -i.tmp 's|\[community\.agentux\.design\]([^)]*)|[GitHub Discussions](https://github.com/jgoldfoot/AgentUX/discussions)|g' "$file"
    
    # 5. Fix NPM package references
    sed -i.tmp 's|`@agentux/core`|`@agentux/core` *(coming soon)*|g' "$file"
    sed -i.tmp 's|`@agentux/payload-validator`|`@agentux/payload-validator` *(coming soon)*|g' "$file"
    sed -i.tmp 's|`@agentux/cli`|`@agentux/cli` *(coming soon)*|g' "$file"
    sed -i.tmp 's|`@agentux/testing`|`@agentux/testing` *(coming soon)*|g' "$file"
    
    # 6. Fix npm install commands
    sed -i.tmp 's|npm install @agentux/core|# npm install @agentux/core  # Package coming soon|g' "$file"
    sed -i.tmp 's|npm install @agentux/payload-validator|# npm install @agentux/payload-validator  # Package coming soon|g' "$file"
    sed -i.tmp 's|npm install -g @agentux/cli|# npm install -g @agentux/cli  # Package coming soon|g' "$file"
    
    # 7. Fix import statements
    sed -i.tmp 's|import { AgentUX } from '"'"'@agentux/core'"'"';|// import { AgentUX } from '"'"'@agentux/core'"'"';  // Package coming soon|g' "$file"
    sed -i.tmp 's|import.*from.*@agentux|// &  // Package coming soon|g' "$file"
    
    # 8. Fix CLI commands
    sed -i.tmp 's|agentux validate|# agentux validate  # CLI coming soon|g' "$file"
    sed -i.tmp 's|agentux test|# agentux test  # CLI coming soon|g' "$file"
    
    # 9. Fix broken internal documentation links
    sed -i.tmp 's|\[Link to getting started guide\]|[Getting Started Guide](./docs/getting-started.md)|g' "$file"
    sed -i.tmp 's|\./docs/implementation\.md|./docs/implementation-guide.md|g' "$file"
    sed -i.tmp 's|\./docs/api\.md|./docs/api-reference.md|g' "$file"
    
    # Remove temporary file
    rm -f "$file.tmp"
    
    echo "✅ Fixed URLs in $file"
}

# Create comprehensive replacement script
echo "📁 Processing files in repository..."

# List of files to process
FILES=(
    "README.md"
    "docs/whitepaper.md"
    "docs/implementation-guide.md"
    "docs/api-reference.md"
    "docs/compliance-checklist.md"
    "docs/getting-started.md"
    "docs/troubleshooting.md"
    "examples/nextjs-ssr-example.md"
    "examples/astro-ssg-example.md"
    "tools/validators/fr1-checker.js"
)

# Backup and fix each file
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        backup_file "$file"
        fix_file_urls "$file"
    else
        echo "⚠️  File not found: $file (skipping)"
    fi
done

# Special fixes for specific content patterns
echo "🎯 Applying content-specific fixes..."

# Fix the AgentUX Resources section in whitepaper.md
if [ -f "docs/whitepaper.md" ]; then
    cat > whitepaper_resources_fix.tmp << 'EOF'
### **AgentUX Resources**

- **GitHub Repository**: [github.com/jgoldfoot/AgentUX](https://github.com/jgoldfoot/AgentUX)
- **Documentation**: [AgentUX Documentation](https://github.com/jgoldfoot/AgentUX/tree/main/docs)
- **Community**: [GitHub Discussions](https://github.com/jgoldfoot/AgentUX/discussions)
- **Examples**: [Implementation Examples](https://github.com/jgoldfoot/AgentUX/tree/main/examples)

> **Note**: Official website and NPM packages are planned for future release.
EOF
    
    # Replace the AgentUX Resources section
    sed -i.tmp '/### \*\*AgentUX Resources\*\*/,/^$/c\
### **AgentUX Resources**\
\
- **GitHub Repository**: [github.com/jgoldfoot/AgentUX](https://github.com/jgoldfoot/AgentUX)\
- **Documentation**: [AgentUX Documentation](https://github.com/jgoldfoot/AgentUX/tree/main/docs)\
- **Community**: [GitHub Discussions](https://github.com/jgoldfoot/AgentUX/discussions)\
- **Examples**: [Implementation Examples](https://github.com/jgoldfoot/AgentUX/tree/main/examples)\
\
> **Note**: Official website and NPM packages are planned for future release.' docs/whitepaper.md
    
    rm -f whitepaper_resources_fix.tmp
    rm -f docs/whitepaper.md.tmp
    echo "✅ Fixed AgentUX Resources section in whitepaper.md"
fi

# Fix README.md Quick Start link
if [ -f "README.md" ]; then
    sed -i.tmp 's|\[Link to getting started guide\]|[Getting Started Guide](./docs/getting-started.md)|g' README.md
    rm -f README.md.tmp
    echo "✅ Fixed Quick Start link in README.md"
fi

# Generate summary report
echo ""
echo "📊 URL Fix Summary Report"
echo "=========================="
echo "✅ Fixed GitHub repository URLs (agentux/core → jgoldfoot/AgentUX)"
echo "✅ Fixed documentation links (docs.agentux.design → GitHub docs)"
echo "✅ Fixed community links (community.agentux.design → GitHub Discussions)"
echo "✅ Marked NPM packages as 'coming soon'"
echo "✅ Commented out non-functional CLI commands"
echo "✅ Fixed internal documentation links"
echo "✅ Created backup files (.backup extension)"
echo ""

# Verification script
echo "🔍 Running verification checks..."

# Check for remaining broken URLs
echo "Checking for remaining broken URLs..."
BROKEN_FOUND=0

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        if grep -q "agentux\.design\|github\.com/agentux/core" "$file" 2>/dev/null; then
            echo "⚠️  Possible remaining broken URLs in $file"
            BROKEN_FOUND=1
        fi
    fi
done

if [ $BROKEN_FOUND -eq 0 ]; then
    echo "✅ No obvious broken URLs detected"
else
    echo "⚠️  Some URLs may need manual review"
fi

echo ""
echo "🎉 URL fixes completed!"
echo ""
echo "Next steps:"
echo "1. Review the changes: git diff"
echo "2. Test the links manually"
echo "3. Commit when satisfied: git add . && git commit -m 'Fix broken URLs for public launch'"
echo ""
echo "To restore backups if needed: "
echo "for f in *.backup; do mv \"\$f\" \"\${f%.backup}\"; done"
