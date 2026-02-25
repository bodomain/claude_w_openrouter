#!/bin/bash

# 1. Load the variables from the .env file
# This reads each line and exports it to the current shell
if [ -f .env ]; then
  export $(cat .env | xargs)
  echo "Loaded environment variables from .env"
else
  echo "Error: .env file not found!"
  exit 1
fi

# 2. Routing Configuration
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_MODEL="arcee-ai/trinity-large-preview:free"

# 3. Authentication Overrides
# We use the key loaded from your .env file
export ANTHROPIC_API_KEY=""
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"

# 4. Bypass Flag
export CLAUDE_CODE_USE_KEY=true

# echo "Starting Claude with Arcee-AI Trinity..."
# claude
