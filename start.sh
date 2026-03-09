#!/bin/sh
set -eu

mkdir -p /tmp/zc-home
export HOME=/tmp/zc-home

: "${LLM_PROVIDER:?Missing LLM_PROVIDER}"
: "${LLM_MODEL:?Missing LLM_MODEL}"
: "${LLM_API_KEY:?Missing LLM_API_KEY}"
: "${TELEGRAM_BOT_TOKEN:?Missing TELEGRAM_BOT_TOKEN}"

zeroclaw onboard --provider "$LLM_PROVIDER" --model "$LLM_MODEL" --api-key "$LLM_API_KEY"
zeroclaw channel add telegram --token "$TELEGRAM_BOT_TOKEN" || true
exec zeroclaw channel start
