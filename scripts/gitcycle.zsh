#!/bin/zsh


function gsu() {
  git status -u . | \
    sed -e 's/Your branch is ahead of/🔼/' \
        -e 's/Changes to be committed/✏️/' \
        -e 's/Changes not staged for commit/💬/' \
        -e 's/Untracked files/🆕/' \
        -e 's/Changes to be committed/📝/' \
        -e 's/Changes not staged for commit/🚨/' \
        -e 's/Untracked files/👀/' \
        -e 's/modified:/📝 /' \
        -e 's/Untracked files:/🆕 /' \
        -e 's/deleted:/🗑️ /' \
        -e 's/new file:/🆕 /' \
        -e 's/renamed:/🔄 /' \
        -e 's/Your branch is up-to-date with/🔽/' \
        -e 's/Your branch is behind/🔽/' | \
    GREP_COLOR='1;32' grep --color=always -E '✏️|🚨' | \
    GREP_COLOR='1;31' grep --color=always -E '💬|🆕|🗑️|🆕|🔄' | \
    GREP_COLOR='1;36' grep --color=always -E '🔽|🔼' | \
    GREP_COLOR='1;33' grep --color=always -E '\bmodified:|Untracked files:|deleted:|new file:|renamed:' | \
    sed -e 's/^/🌵 /'
}


# Define colors and icons
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
SUCCESS_ICON='✅ '
WARNING_ICON='⚠️ '
ERROR_ICON='❌ '
gsu 
# Add GitHub SSH key
echo "${YELLOW}Adding GitHub SSH key...${NC}"
ssh-add ~/.ssh/id_github
echo "${GREEN}${SUCCESS_ICON} GitHub SSH key added.${NC}"

# Add changes to Git staging area
echo "${YELLOW}Adding changes to Git staging area...${NC}"
git add .
echo "${GREEN}${SUCCESS_ICON} Changes added to Git staging area.${NC}"

# Prompt user for commit message
echo "${YELLOW}Please enter a commit message:${NC}"
read commit_message

# Commit changes with provided commit message
echo "${YELLOW}Committing changes...${NC}"
git commit -m "$commit_message"
echo "${GREEN}${SUCCESS_ICON} Changes committed with message: '$commit_message'${NC}"

# Push changes to GitHub
echo "${YELLOW}Pushing changes to GitHub...${NC}"
git push -u -f origin main
echo "${GREEN}${SUCCESS_ICON} Changes pushed to GitHub.${NC}"
gsu
