### Encountered files that should have been pointers, but weren't

```
git lfs uninstall
git reset --hard
git lfs install
git lfs pull
```

https://github.com/git-lfs/git-lfs/issues/1939


### Git Large File Storage / Git LFS

https://github.com/git-lfs/git-lfs

```
# this modifies .gitattributes file
git lfs track "*.psd"

# then just use git add, git commit
# make sure you also commit changes to .gitattributes!

# to untrack
git lfs untrack foo.psd

# clone repo / pull without large files
# one-time
GIT_LFS_SKIP_SMUDGE=1 git clone SERVER-REPOSITORY

# always
git config --global filter.lfs.smudge "git-lfs smudge --skip"
```

https://stackoverflow.com/questions/42019529/how-to-clone-pull-a-git-repository-ignoring-lfs


### Break commit into several commits

```
git rebase -i <commit>^ # 1 before the commit
git reset HEAD^
# replace "pick" with "edit"
# commit pieces individually in usual way
git rebase --continue
```

https://stackoverflow.com/questions/6217156/break-a-previous-commit-into-multiple-commits


### Update initial commit

```
git rebase -i --root
```

https://stackoverflow.com/questions/2246208/change-first-commit-of-project-with-git


### Change default editor

```
git config --global core.editor "vi"
```


### Checkout Submodules

```
# in one command
git submodule update --init --recursive

# separately
git submodule init
git submodule update
```

https://git-scm.com/book/en/v2/Git-Tools-Submodules
https://stackoverflow.com/questions/3796927/how-to-git-clone-including-submodules

Example: horovod uses them: https://github.com/horovod/horovod/blob/master/.gitmodules


### Find largest files in git history

```
git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print$1}')"
```


### Find common ancestor of two branches

```
git merge-base <branch1> <branch2>
```

http://stackoverflow.com/questions/1549146/find-common-ancestor-of-two-git-branches


### Search across all branches

```
git branch | tr -d \* | xargs git grep "foo"
```

http://stackoverflow.com/questions/15292391/is-it-possible-to-perform-a-grep-search-in-all-the-branches-of-git-project


### Ignore file but not directory

```
# order matters as rules are processed sequentially
*.user     # ignore all paths ending in '.user'
!*.user/   # but don't ignore these paths if they are directories.
```

https://stackoverflow.com/questions/16770282/how-to-gitignore-only-files


### Ignore file only in root directory

```
/file
```

https://stackoverflow.com/questions/3637660/how-to-exclude-file-only-from-root-folder-in-git


### Case sensitive git ignore / Change casing of file name

```
git config core.ignorecase false

# alternative approach
git mv File file.tmp
git mv file.tmp file
```

https://stackoverflow.com/questions/17683458/how-do-i-commit-case-sensitive-only-filename-changes-in-git


### Git Aliases for .bashrc or .bash_profile

```
# Git aliases
alias ga="git add"
alias gb="git branch"
alias gca="git commit --amend"
alias gce="git commit --allow-empty -m"
alias gcfd="git clean -fd"
alias gcm="git commit -am"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcr2="git commit -am will-be-deleted && git rebase -i HEAD~2"
alias gcr2p="git commit -am will-be-deleted && git rebase -i HEAD~2 && rbt post -g no -r"
alias gd="git diff"
alias gdesc="git describe"
alias glg="git log"
alias gpl="git pull"
alias gp="git push"
alias gr="git rebase"
alias grs="git reset"
alias grsh1="git reset --hard HEAD~1"
alias grd="git review dcommit -r"
alias gsh="git show"
alias gst="git status"
alias gt="git tag"
```


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


### Abort pull with conflicts

```
git reset --hard HEAD
```


### Pull remote branch

```
git pull upstream master // git pull latest from upstream master
git pull <remote> <src>:<dest>
```

### Create and push to remote branch from local branch

```
git push <remote> <local branch>:<remote branch>
git push upstream junit-runner:master
git push origin initial-queries:initial-queries
```


### Set tracking branch

```
git branch --set-upstream <local-branch> <remote>/<remote-branch>
```


### See tracking branches

```
git branch -vv
```


### git push one branch

```
git push <remote> <branch>
```


### Fetch remote branches

```
git fetch <remote>
git fetch <remote> <local-branch>:<remote-branch>
```

http://stackoverflow.com/questions/11266478/git-add-remote-branch


### Convert shallow clone to full clone

```
git fetch --unshallow

# assuming you have less than 1 million commits
git fetch --depth=1000000
```

https://stackoverflow.com/questions/6802145/how-to-convert-a-git-shallow-clone-to-a-full-clone


### Add refspec / fetch branch in shallow clone

You might need to do this if you did a shallow clone originally.

```
git fetch origin +branch-1:branch-1
```


### Fetch tags

```
git fetch --tags
```

A git tag refers to a specific commit and does not change.


### Update tag

```
# delete remote branch
git push origin :<tagname>

# update commit local tag points to
git tag -fa <tagname>

# push tag
git push origin <tagname>
```


### Add annotated tag / create tag

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

http://stackoverflow.com/questions/5480258/how-to-delete-a-remote-git-tag


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

# also consider using
git log --one-line
# to quickly scan past commits and any tags associated with them
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


### Checkout file from another branch

```
git checkout <branch> <file>
```

https://stackoverflow.com/questions/2364147/how-to-get-just-one-file-from-another-branch/2364223


### Checkout remote branch and have local branch track it

```
git checkout -b li-0.10-1 origin/li-0.10-1
```


### Delete remote branch

```
git push origin --delete initial-queries
```


### Remove stale remote branches from local cache

```
git remote prune <remote>
```


### Merge branches and use theirs

https://stackoverflow.com/a/4969679/1128392


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


### Checkout old commit

```
git checkout HEAD~5 # checkout 5 commits ago
git checkout COMMIT_HASH # checkout at specific commit
```


### Get back on branch from detached HEAD state

```
git checkout <branch>
```


### Remove untracked files

```
git clean -f [-d]
# -d removes untracked directories, too

# -i for interactive
# -x do NOT use standard ignore rules from .gitignore and $GIT_DIR/info/exclude, allows for removing all untracked files including build products
git clean -idx
```


### Add all untracked files

```
git add -A
```


### Reset one file

```
git reset HEAD^ path/to/file
```


### Uncommit last commit but keep changes in staging

```
git reset --soft HEAD^
```


### Show changes in commit

git show <commit-hash>


### Show state of file at commit

```
git show <commit>:<file>
```


### git blame on old commit

```
git blame <commit> -- <file>
```
http://stackoverflow.com/questions/5098256/git-blame-prior-commits


### Modify a git commit message

```
# modify author
git commit --amend --author="Author Name <email@address.com>"
# https://stackoverflow.com/questions/3042437/change-commit-author-at-one-specific-commit

# Changes the most recent commit message
git commit --amend -m "New commit message"

# Change up to older commit
git rebase --interactive 'bbc643cd^'
# Change "pick" to "e" or "edit"
```

http://stackoverflow.com/questions/1186535/how-to-modify-a-specified-commit-in-git


### Do an empty commit

```
git commit --allow-empty
```


### Git Stash

```
# stash one file
git stash push path/to/file

git stash save "name"
git stash apply stash^{/name} # Doesn't seem to work anymore
git stash apply stash@{0} # where 0 is a number (do git stash list first)
```

https://stackoverflow.com/questions/3040833/stash-only-one-file-out-of-multiple-files-that-have-changed-with-git/3041055#3041055


### git pull rebase rather than merge

```
git pull --rebase
```


### git rename current branch

```
git branch -m <newname>
```


### Rename git branch

```
git branch -m old_branch_name new_branch_name
```


### Reorder commits in git

```
git rebase -i HEAD~2 # reorder last two commits
```


### Rebase and replay local commits on another branch

```
git rebase <branch> # replays <branch> on your current branch
git rebase <remote>/<branch>
```


### Rebase on top of a specific commit

```
git rebase -i COMMIT_HASH
```


### Undo a rebase

http://stackoverflow.com/questions/134882/undoing-a-git-rebase

```
git reflog
git reset --hard HEAD@{<number>}
```


### git push problems

Try changing URL from HTTPS to SSH. Try including/excluding https:// or ssh://. Try adding or removing USERNAME@. Try using git@.


### Diff tags / diff two tags

```
git diff tag1 tag2
```

https://stackoverflow.com/questions/3211809/how-to-compare-two-tags


### Apply patch to different file / path

```
cd first-repo
git diff HEAD^ -- hello.test > ~/patch_file

cd ../second-repo
patch -p1 blue/red/hi.test ~/patch_file
```

https://stackoverflow.com/questions/16526321/how-to-apply-a-git-patch-to-a-file-with-a-different-name-and-path


### Don't truncate file names in `--stat` output

```
# 200 is the line width
git show <commit> --stat=200
```

https://stackoverflow.com/questions/10459374/making-git-diff-stat-show-full-file-path


### Git Diff

```
# diff with parent
git diff 0ac424f0a17b341efe299da167791112e4a953e9^!
# http://stackoverflow.com/questions/17563726/how-to-see-the-changes-in-a-commit

# generate diff of one file in commit
git diff <commit>^! -- path/to/file > foo.patch

# apply patch to different path
# -p<n> removes `n` leading directories
# --directory prepends a path
# `-3` allows conflict resolution
cat foo.patch | git apply -3 -p2 --directory='new/path/'

# one-line
git diff <commit>^! -- path/to/file | git apply -3 -p2 --directory='new/path/'

# -p1 strips off a/ and b/ prefixes Git automatically adds
patch -p1 new/path foo.patch

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

# Treat all files as text
git diff --text

# Highlight whitespace changes
# Often easiest just to do reverse diff
git diff -R
# https://stackoverflow.com/questions/5257553/coloring-white-space-in-git-diffs-output

# diff while ignoring whitespace changes
git diff -w

# diff two branches
git diff branch1..branch2
# http://stackoverflow.com/questions/9834689/comparing-two-branches-in-git
```


### Apply diff from one file to another file

```
git diff path/to/file > changes.patch
patch -p1 path/to/other/file changes.patch
```


### Apply diff in one repo to another

```
# repo 1
# add --binary if binary change
git diff FILE > patch

# repo 2
git apply /path/to/patch
```

### Cherry-pick specific files

```
git cherry-pick -n <commit> # get your patch, but don't commit (-n = --no-commit)
git reset                   # unstage the changes from the cherry-picked commit
git add -p                  # make all your choices (add the changes you do want)
git commit                  # make the commit!
```

https://stackoverflow.com/questions/1526044/partly-cherry-picking-a-commit-with-git

```
# use `git apply -3 -` to allow for conflict resolution
# can also use `-p<n>` and `--directory`
git show SHA -- file1.txt file2.txt | git apply -
```

http://stackoverflow.com/questions/5717026/how-to-git-cherry-pick-only-changes-to-certain-files

`git apply` also support `--include=<path-pattern>` to only apply patches to some files.


### Apply commit from one branch on another

```
git cherry-pick HASH
git pull <remote> <branch>
# to pull from another local branch, push it to remote and then pull from remote
```


### Apply commit from one repo to another

```
# repo 1
git show <commit> > foo.patch

# repo 2
git apply /path/to/foo.patch

# Alternative
/path/to/1 $ git format-patch sha1^..sha1
/path/to/1 $ cd /path/to/2
/path/to/2 $ git am /path/to/1/0001-…-….patch
```

http://stackoverflow.com/questions/3816040/git-apply-changes-introduced-by-commit-in-one-repo-to-another-repo


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
# Add --no-edit to avoid edit prompt
git revert <commit_hash>
```

### Revert one file

http://stackoverflow.com/questions/2733873/reverting-a-single-file-to-a-previous-version-in-git
```
git checkout <commit> path/to/file
```


### Revert part of a commit

http://stackoverflow.com/questions/4795600/reverting-part-of-a-commit-with-git

```
$ git revert -n $bad_commit    # Revert the commit, but don't commit the changes; -n means --no-commit
$ git reset HEAD .             # Unstage the changes
$ git add --patch .            # Add whatever changes you want
$ git commit                   # Commit those changes
```


### Squash all history into one commit

http://stackoverflow.com/questions/1657017/squash-all-git-commits-into-a-single-commit

```
rm -rf .git
git init
git add .
git commit -m "<commit message>"
```


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
git log --follow -- [file]
```


### Show history of folder

```
git log [FOLDER]
```

http://stackoverflow.com/questions/11950037/view-git-history-for-folder


### Case-insensitive search for "word" in commit log *contents* | search log

http://stackoverflow.com/questions/1337320/how-to-grep-git-commit-diffs-or-contents-for-a-certain-word

```
git log -i -S word
```


### Case-insensitive search for "word" in commit log *message*

```
git log -i --grep=word
```


### Print message only of last commit

```
git log -1 --pretty=format:%s
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

On Windows, git looks for `~/.ssh/id_rsa` to use as your SSH key

After installing the side-by-side diff tool "meld", you can do

```
git difftool <commit_hash1>..<commit_hash2>
```

However, this compares files one by one. It's often easier to fit to a

```
git reset --soft HEAD~<number>
```

and then do a

```
meld .
```

which will open all the files at once


### Remove file from repo but keep locally

```
git rm --cached <files...>
```

### Git clone fails

When cloning with one URL fails, try another one (SSH, HTTP, Git)


### Enable color output

```
git config --global color.ui true
```

http://stackoverflow.com/questions/1156069/how-to-configure-mac-os-x-term-so-that-git-has-color


### Avoid escape (ESC) characters

```
git config --global core.pager more
```
http://michael.otacoo.com/linux-2/avoid-escape-characters-in-git/


### See configs

```
# one config
git config --get <CONFIG_NAME>

# all configs
git config -l
```


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


### Create a shallow copy with history truncated to 1 revision

```
git clone --depth 1 ...
```


### Checkout repo and give it a different name

```
git clone <repo> <new_name>
```


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


### Check if file or folder is tracked / under source control

```
git ls-files FILE --error-unmatch
```

http://stackoverflow.com/questions/2405305/git-how-to-tell-if-a-file-is-git-tracked-by-shell-exit-code


### Find commit that deleted a line

```
git log -S <string> path/to/file
```

http://stackoverflow.com/questions/4404444/how-do-i-blame-a-deleted-line


### Open file at commit

```
git show <revision>:path/to/file
```

https://stackoverflow.com/questions/338436/is-there-a-quick-git-command-to-see-an-old-version-of-a-file

In iTerm2:

```
git show <commit>
```

Cmd + click file name (--- a/path/to/file)


### Search for deleted file

http://stackoverflow.com/questions/7203515/git-how-to-search-for-a-deleted-file-on-in-the-project-commit-history

```
git log --all -- <path-to-file>

git log --all -- **/thefile.*
```


### List active SSH keys

```
ssh-add -l
```


### Convert SSH key to fingerprint

```
ssh-keygen -lf ahsu_ssh_key.pub
```


### Avoid prompt for passphrase

```
eval $(ssh-agent)
ssh-add PRIVATE_KEY_FILE
```

http://stackoverflow.com/questions/10032461/git-keeps-asking-me-for-my-ssh-key-passphrase

If you're SSHing to a remote host and want your ssh-agent forwarded, use

```
ssh -A ...
```

http://superuser.com/questions/141044/sharing-the-same-ssh-agent-among-multiple-login-sessions
