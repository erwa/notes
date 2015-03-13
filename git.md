# Add remote repository
git remote add upstream git://github.com/user/repo.git

# Change URI that a remote points to
git remote set-url <remote> git://...

# git pull remote branch
git pull upstream master // git pull latest from upstream master
git pull <remote> <src>:<dest>

# create and push to remote branch from local branch
git push <remote> <local branch>:<remote branch>
git push upstream junit-runner:master
git push origin initial-queries:initial-queries

# set tracking branch
git branch --set-upstream <local-branch> <remote>/<remote-branch>

# see tracking branches
git branch -vv

# git push one branch
git push <remote> <branch>

# Fetch remote branches
git fetch <remote>

# A git tag refers to a specific commit and does not change.
# To fetch tags
git fetch --tags

# Show tags
git tag

# git: checkout remote branch and have local branch track it
git checkout -b li-0.10-1 origin/li-0.10-1

# git delete remote branch
git push origin --delete initial-queries

# git remove stale remote branches from local cache
git remote prune <remote>

# git merge branch, will fast forward by default
git merge <branch> # merges <branch> into current branch

# git: checkout old commit
git checkout HEAD~5 # checkout 5 commits ago
git checkout COMMIT_HASH # checkout at specific commit

# if you're in a detached HEAD state and want to get back on a branch, do
git checkout <branch>

# git remove untracked files
git clean -f [-d]
# -d removes untracked directories, too

# Add all untracked files
git add -A

# git: uncommit last commit but keep changes in staging
git reset --soft HEAD^

# git show changes in commit
git show <commit-hash>

# Modify a git commit message
# Changes the most recent commit message
git commit --amend -m "New commit message"

git stash save "name"
git stash apply stash^{/name} # Doesn't seem to work anymore
git stash apply stash@{0} # where 0 is a number (do git stash list first)

# git pull rebase rather than merge
git pull --rebase

# git rename current branch
git branch -m <newname>

# rename git branch
git branch -m old_branch_name new_branch_name

# To reorder commits in git
git rebase -i HEAD~2 # reorder last two commits

# To rebase and replay local commits on another branch
git rebase <branch> # replays <branch> on your current branch
git rebase <remote>/<branch>

# Rebase on top of a specific commit
git rebase -i COMMIT_HASH

# Undo a rebase: http://stackoverflow.com/questions/134882/undoing-a-git-rebase
git reflog
git reset --hard HEAD@{<number>}

# git push problems
Try changing URL from HTTPS to SSH. Try including/excluding https:// or ssh://. Try adding or removing USERNAME@. Try using git@.

# git: comparing a file between two branches
git diff BRANCH1 BRANCH2 FILE

# git diff file that has been moved
git diff  6fab939e28486ab6e6d5038f33f5e9c3b406d4e1:ql/src/java/org/apache/hadoop/hive/ql/exec/MapRedTask.java ql/src/java/org/apache/hadoop/hive/ql/exec/mr/MapRedTask.java

# git diff one file
git diff <commit1> <commit2> <file>
git diff HEAD~1 HEAD <file>

# git diff, only show files changed
git diff --stat f57ea64

# git binary diff
git diff --binary

# diff while ignoring whitespace changes
git diff -w

# git apply commit from one branch on another
git cherry-pick HASH
git pull <remote> <branch>
# to pull from another local branch, push it to remote and then pull from remote

# git apply commit from one repo to another
# http://stackoverflow.com/questions/3816040/git-apply-changes-introduced-by-commit-in-one-repo-to-another-repo
/path/to/1 $ git format-patch sha1^..sha1
/path/to/1 $ cd /path/to/2
/path/to/2 $ git am /path/to/1/0001-…-….patch

# apply a patch
# https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/
git apply --stat fix.patch # see patch changes
git apply --check fix.patch # dry-run
git apply fix.patch # apply for real

# revert a commit
git revert <commit_hash>

# revert part of a commit
# http://stackoverflow.com/questions/4795600/reverting-part-of-a-commit-with-git
$ git revert -n $bad_commit    # Revert the commit, but don't commit the changes; -n means --no-commit
$ git reset HEAD .             # Unstage the changes
$ git add --patch .            # Add whatever changes you want
$ git commit                   # Commit those changes

# squash all history into one commit
# http://stackoverflow.com/questions/1657017/squash-all-git-commits-into-a-single-commit
rm -rf .git
git init
git add .
git commit -m "<commit message>"

# show the history of one file
# http://stackoverflow.com/questions/278192/view-the-change-history-of-a-file-using-git-versioning
git log -- [file]

# Case-insensitive search for "word" in commit log *contents*
# http://stackoverflow.com/questions/1337320/how-to-grep-git-commit-diffs-or-contents-for-a-certain-word
git log -i -S word

# Case-insensitive search for "word" in commit log *message*
git log -i --grep=word

# recover squashed commits, etc.
# http://stackoverflow.com/questions/7457942/how-to-undo-a-git-merge-squash
git reflog
git reset <commit>

# HEAD vs. working tree vs. index
http://stackoverflow.com/questions/3689838/difference-between-head-working-tree-index-in-git

# HEAD^ vs. HEAD~1
# HEAD^ is short for HEAD^1 and means the first parent of HEAD
# HEAD~n means to go back n commits from HEAD, favoring the first parent in cases of ambiguity
http://stackoverflow.com/questions/1955985/what-does-the-caret-character-mean

On Windows, git looks for ~/.ssh/id_rsa to use as your SSH key

# After installing the side-by-side diff tool "meld", you can do
git difftool <commit_hash1>..<commit_hash2>
# however, this compares files one by one
# It's often easier to fit to a
git reset --soft HEAD~<number>
# and then do a
meld .
# which will open all the files at once

# remove file from repo but keep locally
git rm --cached <files...>

# When cloning with one URL fails, try another one (SSH, HTTP, Git)

# Enable color output on Mac
# http://stackoverflow.com/questions/1156069/how-to-configure-mac-os-x-term-so-that-git-has-color
git config --global color.ui true

# See configs
git config -l

# Set global user.email
# http://stackoverflow.com/questions/10663492/how-to-change-default-author-and-commiter-in-eclipse-git-plugin
git config --global user.email "<email>"

# Create a shallow copy with history truncated to 1 revision
git clone --depth 1 ...

# Checkout repo and give it a different name
git clone <repo> <new_name>