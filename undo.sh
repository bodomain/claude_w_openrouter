#!/bin/bash

# 1. Clear the custom Model Override
unset ANTHROPIC_MODEL

# 2. Revert the API Base URL to Anthropic's default
unset ANTHROPIC_BASE_URL

# 3. Clear Authentication Tokens
# This allows the CLI to look for your standard Anthropic keys or login session
unset ANTHROPIC_AUTH_TOKEN
unset ANTHROPIC_API_KEY

# 4. Disable the API key bypass flag
unset CLAUDE_CODE_USE_KEY

echo "Environment reset. Claude will now use original Anthropic settings."

# 5. Optional: Launch Claude
# claude
