#!/bin/bash
# Reset the demo to pristine state
# Run this after practicing merges to get back to the starting point

echo "Resetting demo to initial state..."

# Abort any in-progress merge
git merge --abort 2>/dev/null

# Go to master
git checkout master 2>/dev/null

# Get the initial setup commit hash (last commit on master before any demo work)
INITIAL_COMMIT=$(git log --oneline | head -1 | cut -d' ' -f1)

# Reset master to initial state
git reset --hard $INITIAL_COMMIT

# Reset branches to their original positions
git checkout feature-A 2>/dev/null
git reset --hard feature-A
git checkout feature-B 2>/dev/null  
git reset --hard feature-B
git checkout master 2>/dev/null

# Show the state
echo ""
echo "Demo reset complete. Current state:"
git log --all --graph --oneline --decorate

echo ""
echo "Ready for demo!"
echo "Try: git merge feature-A"
