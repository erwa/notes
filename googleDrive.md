### List files in folder

https://www.googleapis.com/drive/v3/files?q="folderId"+in+parents&fields=files(md5Checksum,+originalFilename)

```
filter_query = '"%s" in parents' % folder_id
response = service.files().list(q=filter_query).execute()
```

https://stackoverflow.com/questions/24720075/how-to-get-list-of-files-by-folder-on-google-drive-api
http://googleapis.github.io/google-api-python-client/docs/dyn/drive_v3.files.html#list


### Sync offline

Need to download "Backup and Sync" app: https://support.google.com/drive/answer/2374987

https://it.stonybrook.edu/help/kb/accessing-google-drive-files-offline-on-a-mobile-devicecomputer
