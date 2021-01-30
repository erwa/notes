### Draft pull request

Select in drop-down on create a pull request button.

Cannot be merged until marked ready for review.

https://github.blog/2019-02-14-introducing-draft-pull-requests/


### Webhooks

For Discord: https://gist.github.com/jagrosh/5b1761213e33fc5b54ec7f6379034a22
- need to be channel admin


### Size of repository

Use https://api.github.com/repos/<USER>/<PROJECT>. E.g.: https://api.github.com/repos/sml-nj/smlnj. Look at `size` field. Size is in KB. May not be the true size because it does not account for Git Alternates storage.

https://stackoverflow.com/questions/8646517/see-the-size-of-a-github-repo-before-cloning-it


### Upload image to GitHub's CDN

https://gist.github.com/vinkla/dca76249ba6b73c5dd66a4e986df4c8d

Create New Issue and drag an image in. Copy and use the URL. Don't need to publish the issue.


### Incremental diff between feature branches

Need to do development in the same repo. Then you can change the base branch.

https://blog.github.com/2016-08-15-change-the-base-branch-of-a-pull-request/


### Jump to oldest commit

Find a file that's likely to be old, look at blame, click commit or "View blame prior to this change" -> find commit with 0 parents

Checkout repo, use `git log`.

http://stackoverflow.com/questions/28533602/navigating-to-the-earliest-commit-in-github


### Commits to repo by user

https://github.com/azkaban/azkaban/commits/master?author=erwa

http://stackoverflow.com/questions/12174276/github-list-commits-by-author


### Link to specific commit (canonical URLs)

Press `y` in the source file.

http://stackoverflow.com/questions/23821235/how-to-link-to-specific-line-number-on-github


### Delete branch automatically when merging pull requests

In project Settings page, check "Automatically delete head branches" under "Merge button".


### Apply pull request locally

There is a "command line instructions" link at the bottom of the PR page.

https://help.github.com/en/articles/checking-out-pull-requests-locally


### Squash commits before merging pull request

Set pull request commit option to "Squash and merge"

https://help.github.com/articles/about-pull-request-merges/


### How to do a pull request

http://stackoverflow.com/questions/14680711/how-to-do-a-github-pull-request


### Notifications

When you comment on a specific commit of a pull request, a notification is only sent to the watchers of the repo being pulled from; a notification is NOT sent to the watchers of the repo being merged into.
