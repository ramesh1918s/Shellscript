#!/bin/bash
Git 
Git is a version control system that helps developers track changes in their code, collaborate with others, and manage different versions of a project. 
Think of it as a tool that lets you save "checkpoints" of your work, go back to earlier versions if needed, and work alongside other people without stepping on each other's toes.

- **Track changes**: Git keeps a history of changes to your project, so you can see who made what changes and when.
- **Branching and merging**: You can create separate branches to work on new features or fixes without affecting the main codebase. 
    Once you're done, you can merge your changes back in.
- **Collaboration**: Multiple people can work on the same project simultaneously. 
    Git helps manage this by allowing each person to work on their own version (branch) and then combine their work.
- **Distributed**: Git is decentralized, meaning every developer has a full copy of the repository, which makes it fast and reliable even when you're working offline.

Git is the engine behind platforms like GitHub, GitLab, and Bitbucket, where you can host your Git repositories and collaborate with others.


git staging area to remove the file we can use this command 
- git rm --cached <filename>
-------------------------Git Commands------------------------------------------------------------------
Here are some common Git commands that you'll use in everyday development:

### **Basic Git Commands:**

1. **`git init`**  
   Initializes a new Git repository in the current directory.
   ```bash
   git init
   ```

2. **`git clone <repository-url>`**  
   Clones a remote repository to your local machine.
   ```bash
   git clone https://github.com/user/repo.git
   ```

3. **`git status`**  
   Shows the status of your working directory and staging area. It tells you which files are modified, staged, or untracked.
   ```bash
   git status
   ```

4. **`git add <file>`**  
   Adds a file to the staging area (ready to be committed).
   ```bash
   git add index.html
   ```

   Or to add all changed files:
   ```bash
   git add .
   ```

5. **`git commit -m "<message>"`**  
   Commits the staged changes with a message.
   ```bash
   git commit -m "Added new feature"
   ```

6. **`git push <remote> <branch>`**  
   Pushes your local commits to a remote repository (e.g., GitHub).
   ```bash
   git push origin main
   ```

7. **`git pull <remote> <branch>`**  
   Fetches the latest changes from a remote repository and merges them into your local branch.
   ```bash
   git pull origin main
   ```

8. **`git fetch`**  
   Downloads objects and refs from another repository without merging the changes.
   ```bash
   git fetch origin
   ```

9. **`git merge <branch>`**  
   Merges the changes from the specified branch into the current branch.
   ```bash
   git merge feature-branch
   ```

10. **`git log`**  
    Shows the commit history for the current branch.
    ```bash
    git log
    ```

11. **`git diff`**  
    Shows the differences between the working directory and the staging area or between two commits.
    ```bash
    git diff
    ```

12. **`git reset`**  
    Undoes changes:
    - `git reset <file>`: Unstages a file (if you added it with `git add` but haven’t committed yet).
    - `git reset --hard`: Resets both staged and working directory changes (be cautious with this one!).
    ```bash
    git reset <file>
    ```

### **Branching and Merging:**

1. **`git branch`**  
   Lists all the branches in your project. You can also create a new branch using `git branch <branch-name>`.
   ```bash
   git branch
   ```

2. **`git checkout <branch>`**  
   Switches to a different branch.
   ```bash
   git checkout feature-branch
   ```

3. **`git checkout -b <branch>`**  
   Creates a new branch and switches to it.
   ```bash
   git checkout -b new-feature
   ```

4. **`git merge <branch>`**  
   Merges a branch (e.g., `feature-branch`) into the current branch.
   ```bash
   git merge feature-branch
   ```

5. **`git branch -d <branch>`**  
   Deletes a local branch (only if it’s been merged).
   ```bash
   git branch -d feature-branch
   ```

### **Remote Repositories:**

1. **`git remote -v`**  
   Lists the remotes associated with the repository (e.g., GitHub).
   ```bash
   git remote -v
   ```

2. **`git remote add <name> <url>`**  
   Adds a new remote repository.
   ```bash
   git remote add origin https://github.com/user/repo.git
   ```

3. **`git remote remove <name>`**  
   Removes a remote repository.
   ```bash
   git remote remove origin
   ```

### **Rebasing (Advanced):**

1. **`git rebase <branch>`**  
   Rebases the current branch onto the specified branch (rewrites history, so be cautious!).
   ```bash
   git rebase main
   ```

2. **`git rebase --continue`**  
   Continues a rebase after resolving any merge conflicts.
   ```bash
   git rebase --continue
   ```

3. **`git rebase --abort`**  
   Aborts a rebase if things go wrong.
   ```bash
   git rebase --abort
   ```

### **Tagging:**

1. **`git tag <tag-name>`**  
   Creates a tag at the current commit.
   ```bash
   git tag v1.0
   ```

2. **`git push origin <tag-name>`**  
   Pushes a tag to the remote repository.
   ```bash
   git push origin v1.0
   ```

3. **`git tag -d <tag-name>`**  
   Deletes a local tag.
   ```bash
   git tag -d v1.0
   



     