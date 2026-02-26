
# Claude Code Configuration Helpers

Redirect the **Claude Code CLI** to use **OpenRouter** as a backend. This allows for the use of alternative models, such as Arcee-AI Trinity, within the Claude interface.

## Setup

1. **Create a `.env` file** in the root directory.
2. **Add your OpenRouter key** to the file:
```bash
OPENROUTER_API_KEY=your_key_here

```


3. **Security:** Ensure your `.gitignore` file includes `.env` to prevent private keys from being committed to version control.

##  Usage

### Switching to OpenRouter

To point Claude at a custom model, you **must source** the setup script. Sourcing ensures the environment variables are applied to your current terminal session rather than a temporary subshell.

```bash
source ./claude_openrouter.sh

```

**What this script does:**

* Loads the `OPENROUTER_API_KEY` from your local `.env` file.
* Redirects `ANTHROPIC_BASE_URL` to OpenRouter's API endpoint.
* Sets `ANTHROPIC_MODEL` to the specified model ID.
* Uses the `CLAUDE_CODE_USE_KEY=true` flag to bypass the standard browser-based login check.

### Reverting to Default

To return to the original Anthropic API configuration, run the reset script:

```bash
source ./reset_claude.sh

```

**What this script does:**

* Clears all custom model overrides and base URL redirects.
* Restores the CLI to its default behavior, allowing it to communicate with Anthropic's servers.

---

## Customization

To use a different model, edit the `MODEL_ID` variable in `start_claude.sh` with any valid OpenRouter model slug, such as:

* `google/gemini-2.0-flash-001`
* `deepseek/deepseek-chat`
* `meta-llama/llama-3.3-70b-instruct`

## Troubleshooting

* **Verify Variables:** You can check which environment variables are currently active by running `env | grep ANTHROPIC`.
* **Persistent Access:** For easier access, consider adding an alias to your `.bashrc` or `.zshrc` file:
`alias trinity="source /path/to/start_claude.sh"`

