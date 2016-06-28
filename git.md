### Run git command from outside Git repo
```
git --work-tree=~/git --git-dir=~/git/.git diff -- git.c
```
http://stackoverflow.com/questions/8560618/how-can-i-use-full-paths-in-git

### Add remote repository
```
git remote add upstream git://github.com/user/repo.git
```

### Change URI that a remote points to
```
git remote set-url <remote> git://...
```

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

### Add annotated tag
Annotated tags are meant for release versions.
```
git tag -a TAG_NAME
```

### Sort tags chronologically by date
```
git tag --sort version:refname
```
http://stackoverflow.com/questions/18659959/git-tag-sorted-in-chronological-order-of-the-date-of-the-commit-pointed-to

### Delete remote tag
```
git push origin :tagname
```
* http://stackoverflow.com/questions/5480258/how-to-delete-a-remote-git-tag

### Show tags
```
git tag

# With one-line description
git tag -n1
```

### Show one tag with annotations
```
git tag -l 1.2.3 -n9
```

### Find most recent tag
```
git describe
```

### Show commit a tag points to
```
git rev-list $TAG | head -n 1
```
http://stackoverflow.com/questions/1862423/how-to-tell-which-commit-a-tag-points-to-in-git

### Count commits since tag
```
git rev-list TAG..HEAD --count
```
http://stackoverflow.com/questions/8595391/how-to-show-git-commit-using-number-of-commits-since-a-tag

### Push tags
```
# Push one tag
git push origin <tag>

# Push all tags
git push --tags
```

# git: checkout remote branch and have local branch track it
git checkout -b li-0.10-1 origin/li-0.10-1

# git delete remote branch
git push origin --delete initial-queries

# git remove stale remote branches from local cache
git remote prune <remote>

### Merge branch
```
# will fast forward by default
git merge <branch> # merges <branch> into current branch
```

### Resolve binary merge conflict
```
# Use branch that you're merging or rebasing
git checkout --theirs -- path/to/conflicted-file.txt

# Use your version of the file
git checkout --ours -- path/to/conflicted-file.txt

# http://stackoverflow.com/questions/278081/resolving-a-git-conflict-with-binary-files
```

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

### Show state of file at commit
```
git show <commit>:<file>
```

### git blame on old commit
```
git blame <commit> -- <file>
```

# Modify a git commit message
# Changes the most recent commit message
```
git commit --amend -m "New commit message"
```

### Do an empty commit
```
git commit --allow-empty
```

### Git Stash
```
git stash save "name"
git stash apply stash^{/name} # Doesn't seem to work anymore
git stash apply stash@{0} # where 0 is a number (do git stash list first)
```

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

### Git Diff
```
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

# diff two branches
git diff branch1..branch2
# http://stackoverflow.com/questions/9834689/comparing-two-branches-in-git
```

# git apply commit from one branch on another
git cherry-pick HASH
git pull <remote> <branch>
# to pull from another local branch, push it to remote and then pull from remote

# git apply commit from one repo to another
# http://stackoverflow.com/questions/3816040/git-apply-changes-introduced-by-commit-in-one-repo-to-another-repo
/path/to/1 $ git format-patch sha1^..sha1
/path/to/1 $ cd /path/to/2
/path/to/2 $ git am /path/to/1/0001-…-….patch

### Apply a patch
```
git apply --stat fix.patch # see patch changes
git apply --check fix.patch # dry-run
git apply fix.patch # apply for real
```
https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/

### Apply changes to one file
```
git checkout <branch> -- <filename>
```
http://stackoverflow.com/questions/16068186/git-how-to-cherry-pick-only-changes-for-only-one-file-not-the-whole-commit

# Reverting

### Revert a commit
```
git revert <commit_hash>
```

### Revert one file
http://stackoverflow.com/questions/2733873/reverting-a-single-file-to-a-previous-version-in-git
```
git checkout <commit> path/to/file
```

# revert part of a commit
# http://stackoverflow.com/questions/4795600/reverting-part-of-a-commit-with-git
$ git revert -n $bad_commit    # Revert the commit, but don't commit the changes; -n means --no-commit
$ git reset HEAD .             # Unstage the changes
$ git add --patch .            # Add whatever changes you want
$ git commit                   # Commit those changes

### Squash all history into one commit
# http://stackoverflow.com/questions/1657017/squash-all-git-commits-into-a-single-commit
rm -rf .git
git init
git add .
git commit -m "<commit message>"


### Squash several commits into one
```
# Squash last 3 commits
git reset --soft HEAD~3
git commit -m 'New commit message'
```
http://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git


### Show the history of one file
http://stackoverflow.com/questions/278192/view-the-change-history-of-a-file-using-git-versioning
```
git log -- [file]

# Tracks files through git mv's
# http://stackoverflow.com/questions/3845234/viewing-git-history-of-moved-files
git log --follow [file]
```

### Show history of folder
```
git log [FOLDER]
```
http://stackoverflow.com/questions/11950037/view-git-history-for-folder

# Case-insensitive search for "word" in commit log *contents*
# http://stackoverflow.com/questions/1337320/how-to-grep-git-commit-diffs-or-contents-for-a-certain-word
git log -i -S word

# Case-insensitive search for "word" in commit log *message*
git log -i --grep=word


### Print message only of last commit
```
git log -1 --pretty=format:"%s"
```

### Print history as graph
```
git log --graph
```
http://stackoverflow.com/questions/1838873/visualizing-branch-topology-in-git

# recover squashed commits, etc.
# http://stackoverflow.com/questions/7457942/how-to-undo-a-git-merge-squash
git reflog
git reset <commit>

# HEAD vs. working tree vs. index
http://stackoverflow.com/questions/3689838/difference-between-head-working-tree-index-in-git

### HEAD^ vs. HEAD~1

* `HEAD^` is short for `HEAD^1` and means the first parent of `HEAD`.
* `HEAD~n` means to go back n commits from `HEAD`, favoring the first parent in cases of ambiguity
* http://stackoverflow.com/questions/1955985/what-does-the-caret-character-mean
* To go back 1 commit on the second parent, use `HEAD^2`.

### Git SSH Key

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

### Config git push
```
# Push only current branch
git config --global push.default simple

# Push all matching branches
git config --global push.default matching
```
http://stackoverflow.com/questions/21839651/git-what-is-the-difference-between-push-default-matching-and-simple

### Set global user.email
http://stackoverflow.com/questions/10663492/how-to-change-default-author-and-commiter-in-eclipse-git-plugin
```
git config --global user.email "<email>"
```

### Specify author when committing
```
git commit --author="John Smith <john.smith@example.com>"
```

# Create a shallow copy with history truncated to 1 revision
git clone --depth 1 ...

# Checkout repo and give it a different name
git clone <repo> <new_name>

### Clone branch
```
git clone --depth DEPTH --branch BRANCH GIT_URI
```
http://strk.keybit.net/blog/2011/06/07/getting-just-the-tip-of-a-remote-git-branch/


### Clone commit
```
# Not directly possible, so you have to use `git reset`
git clone $URL
git reset --hard $SHA1
```
http://stackoverflow.com/questions/3489173/how-to-clone-git-repository-with-specific-revision-changeset


### Clone into folder
```
git clone git@github.com:whatever folder-name
```
http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder


### Check if file or folder is tracked
```
git ls-files FILE --error-unmatch
```
http://stackoverflow.com/questions/2405305/git-how-to-tell-if-a-file-is-git-tracked-by-shell-exit-code

### Find commit that deleted a line
```
git log -S <string> path/to/file
```
http://stackoverflow.com/questions/4404444/how-do-i-blame-a-deleted-line

### Search for deleted file
http://stackoverflow.com/questions/7203515/git-how-to-search-for-a-deleted-file-on-in-the-project-commit-history
```
git log --all -- <path-to-file>

git log --all -- **/thefile.*
```

### Convert SSH key to fingerprint
```
ssh-keygen -lf ahsu_ssh_key.pub
```

### Avoid prompt for passphrase
```
$ eval $(ssh-agent)
$ ssh-add PRIVATE_KEY_FILE
```
http://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase