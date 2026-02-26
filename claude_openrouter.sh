#!/bin/bash

# 1. Load the variables from the .env file
# This reads each line and exports it to the current shell
!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Load the variables from the .env file located in the script's directory
if [ -f "$SCRIPT_DIR/.env" ]; then
  # Use a safer way to export that handles comments correctly
  export $(grep -v '^#' "$SCRIPT_DIR/.env" | xargs)
  echo "Loaded environment variables from $SCRIPT_DIR/.env"
else
  echo "Error: .env file not found in $SCRIPT_DIR!"
  exit 1
fi

# 2. Routing Configuration
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
#export ANTHROPIC_MODEL="arcee-ai/trinity-large-preview:free"
export ANTHROPIC_MODEL="z-ai/glm-4.5-air:free"

# 3. Authentication Overrides
# We use the key loaded from your .env file
export ANTHROPIC_API_KEY=""
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"

# 4. Bypass Flag
export CLAUDE_CODE_USE_KEY=true

# echo "Starting Claude with Arcee-AI Trinity..."
# claude
