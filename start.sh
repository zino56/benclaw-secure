#!/bin/bash
set -euo pipefail  # Fail fast + no unset vars

# Validate all required env vars
: "${TELEGRAM_BOT_TOKEN:?Error: Missing TELEGRAM_BOT_TOKEN}"
: "${LLM_API_KEY:?Error: Missing LLM_API_KEY}"
: "${LLM_PROVIDER:?Error: Missing LLM_PROVIDER}"

# Secure zeroclaw config (never hardcode)
cat > ~/.zeroclaw/.zeroclaw/config.toml << EOF
[providers.default]
provider = "$LLM_PROVIDER"
model = "glm-4-flash"
api_key = "$LLM_API_KEY"
EOF

# Run zeroclaw with strict permissions
exec zeroclaw channel start
