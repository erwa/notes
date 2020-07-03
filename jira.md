### Jira Chrome search engine

https://jira.example.com/issues/?jql=%s

https://stackoverflow.com/questions/17239740/add-jira-quick-search-to-chrome-omnibox


### Filter by sprint

```
sprint = Hadoop0212
```


### Queries

```
(summary ~ currentUser() OR description ~ currentUser() OR comment ~ currentUser()) and updatedDate >= -7d
```


### Email notifications

If you are mentioned in a ticket you're not the assignee or a watcher on, the email subject includes "mentioned you on".


### Viewed Recently

```
issuekey in issueHistory() order by lastViewed DESC
```


### Specifying date in search

```
createddate > "2015/6/1"
```


### Keyboard Shortcuts

```
# Create Link
. # Then type Link

# Add comment
m
```