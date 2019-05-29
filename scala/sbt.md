### Run one test method

```
sbt "testOnly *TuningManagerTest -- -t testFlowTestRunner"

# use -z to run all tests that include the string
```

https://stackoverflow.com/questions/11159953/scalatest-in-sbt-is-there-a-way-to-run-a-single-test-without-tags