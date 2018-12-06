### Archive Play zip

```
artifacts {
  archives tasks.getByPath(':' + project.name + ':createPlayBinaryZipDist')
}
```


### Change base name of artifacts

```
model {
    distributions {
        playBinary {
            baseName = "somethingElse"
        }
    }
}
```

https://discuss.gradle.org/t/gradle-play-plugin-how-to-change-the-default-distribution-package-name/12123