#!/usr/bin/env bash
set -e


RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${RED}WARNING:${RESET} ${YELLOW}This removes all current skills before adding new ones.${RESET}"


read -p "Continue? (y/N): " answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
  echo "Aborted."
  exit 1
fi


echo "Cleaning skill directories..."

mkdir -p ~/.codex/skills
mkdir -p ~/.config/opencode/skills
mkdir -p ~/.gemini/skills
mkdir -p ~/.qwen/skills

rm -rf ~/.codex/skills/*
rm -rf ~/.config/opencode/skills/*
rm -rf ~/.gemini/skills/*
rm -rf ~/.qwen/skills/*

echo "Copying skills..."

# Coding Skills
cp -r ./skills/coding/* ~/.codex/skills/
cp -r ./skills/coding/* ~/.config/opencode/skills/
cp -r ./skills/coding/* ~/.gemini/skills/
cp -r ./skills/coding/* ~/.qwen/skills/

# Marketing Skills
#cp -r ./skills/marketing/* ~/.codex/skills/
#cp -r ./skills/marketing/* ~/.config/opencode/skills/
#cp -r ./skills/marketing/* ~/.gemini/skills/
#cp -r ./skills/marketing/* ~/.qwen/skills/

echo "Done."
