### Get JDK version

```
[dr-elephant] $ eval System.getProperty("java.version")
[info] ans: String = 1.8.0_131
```

https://stackoverflow.com/questions/20371144/which-version-of-java-does-sbt-use/20405679


### % vs %%

With `%%`, SBT auto adds `_<project_scala_version>` to artifact.

https://stackoverflow.com/questions/17461453/build-scala-and-symbols-meaning


### Check sbt version

```
sbt sbtVersion
```

https://stackoverflow.com/questions/8461013/how-to-check-sbt-version


### See dependency tree

Run `sbt update` and then check the files in `target/resolution-cache/reports`.


### Run one test method

```
sbt "testOnly *TuningManagerTest -- -t testFlowTestRunner"

# use -z to run all tests that include the string
```

https://stackoverflow.com/questions/11159953/scalatest-in-sbt-is-there-a-way-to-run-a-single-test-without-tags

https://blog.ssanj.net/posts/2015-08-02-run-a-test-method-of-a-test-class-from-sbt.html