# Git Merge Demonstration Repository

This repository demonstrates key git merge concepts:
- Clean merges (no conflicts)
- Merge conflicts and resolution
- The importance of merging master into feature branches before merging back

## Repository Structure

- **master**: Main branch with production code
- **feature-A**: Adds a new function (clean merge - no conflicts)
- **feature-B**: Modifies existing function (creates merge conflict)

## Demo Script

### 1. Show the current state

```bash
# View all branches
git branch -a

# See the commit graph
git log --all --graph --oneline --decorate

# Look at master
cat hello.py
```

### 2. Demonstrate Clean Merge (Feature A)

```bash
# Feature A adds a new function without touching existing code
git checkout feature-A
cat hello.py

# Switch back to master and merge
git checkout master
git merge feature-A

# Show the result - notice it merged automatically!
cat hello.py
git log --graph --oneline
```

### 3. Reset and Demonstrate Merge Conflict (Feature B)

```bash
# Reset master to before the merge
git reset --hard HEAD~1

# Look at feature B
git checkout feature-B
cat hello.py

# Notice: Feature B modified the SAME lines that master modified
# This will cause a conflict

# Try to merge into master
git checkout master
git merge feature-B

# CONFLICT! Let's look at it
cat hello.py
```

### 4. Resolve the Conflict

```bash
# Edit hello.py to resolve the conflict
# Remove the conflict markers (<<<<<<, =======, >>>>>>>)
# Choose which changes to keep or combine them

# After editing:
git add hello.py
git commit -m "Merge feature-B: resolved conflicts"
```

### 5. Best Practice: Merge Master into Feature First

```bash
# Reset everything
git reset --hard HEAD~1

# The BETTER approach:
git checkout feature-B
git merge master

# Now resolve conflicts in the feature branch
# (After resolving and committing)

# Then merge the updated feature back into master
git checkout master
git merge feature-B
# This should now be a clean fast-forward merge!
```

## Key Takeaways

1. **Clean merges** happen when changes affect different parts of files
2. **Conflicts** occur when the same lines are modified in both branches
3. **Conflict markers** show both versions (HEAD vs incoming branch)
4. **Best practice**: Always merge master into your feature branch BEFORE merging the feature into master
   - Resolves conflicts in the feature branch (safer)
   - Keeps master's history clean
   - Allows testing the merged result before it hits master

## Testing the Code

```bash
# Make executable
chmod +x hello.py

# Run the program
./hello.py
```
