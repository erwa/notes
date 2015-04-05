# Curl Commands

Azkaban servlet routes registered in AzkabanWebServer.java:main.

```
curl -k https://<host>:<port> -d "username=<username>&password=<password>&action=login"
{
  "status" : "success",
  "session.id" : "<session.id>"
}

$ curl -k https://<host>:<port>/manager -G -d "project=project-name&flow=flow-name&ajax=fetchFlowExecutions&start=0&length=1" -b azkaban.browser.session.id=<session.id>
{
  "executions" : [ {
    "startTime" : 1396998055295,
    "submitUser" : "ahsu",
    "status" : "SUCCEEDED",
    "submitTime" : 1396998055231,
    "execId" : 44607,
    "projectId" : 909,
    "endTime" : 1396998377787,
    "flowId" : "flow-name"
  } ],
  "total" : 7,
  "project" : "project-name",
  "length" : 1,
  "from" : 0,
  "flow" : "flow-name",
  "projectId" : 909
}
```

### Create a project
```
curl -k https://<host>:<port>/manager -d "action=create&name=<name>&description=<description>" -b azkaban.browser.session.id=<session.id>
```

### Reload jobtype plugins without restarting executor server
```
curl http://localhost:<port>/executor?action=reloadJobTypePlugins
```

### Get project permissions
```
curl -k https://<host>:<port>/manager -G -d "ajax=getPermissions&project=project-name" -b azkaban.browser.sesson.id=<session.id>
{
  "project" : "project-name",
  "permissions" : [ {
    "username" : "ahsu",
    "permission" : [ "ADMIN" ]
  } ],
  "projectId" : 71
}
```

### Execute flow
```
curl -k https://<host>:<port>/executor -G -d "ajax=executeFlow&project=project-name&flow=flow-name" -b azkaban.browser.session.id=<session.id>
{
  "message" : "Execution submitted successfully with exec id 32285",
  "project" : "project-name",
  "flow" : "flow-name",
  "execid" : 32285
}
```

### Get flow status
```
curl -k https://<host>:<port>/executor -d "ajax=fetchexecflowupdate&execid=<exec.id>&lastUpdateTime=-1&session.id=<session.id>"

{
  "id" : "test",
  "startTime" : 1408152686395,
  "attempt" : 0,
  "status" : "RUNNING",
  "updateTime" : 1408152686423,
  "nodes" : [ {
    "attempt" : 0,
    "startTime" : 1408152686412,
    "id" : "test",
    "updateTime" : 1408152686420,
    "status" : "RUNNING",
    "endTime" : -1
  } ],
  "flow" : "test",
  "endTime" : -1
}
```

### Kill flow
```
curl -k https://<host>:<port>/executor -d "ajax=cancelFlow&execid=<exec.id>&session.id=<session.id>
```

### Scheduling a flow
Login first (see above).
```
curl -k https://<host>:<port>/schedule -d "ajax=scheduleFlow&projectName=<projectName>&flow=<flowName>&projectId=<projectId>&scheduleTime=12,00,pm,PDT&scheduleDate=07/22/2014" -b azkaban.browser.session.id=<session.id>
{
  "message" : "<projectName>.<flowName> scheduled.",
  "status" : "success"
}
```

### Cancel/remove/unschedule a scheduled flow
```
curl -k https://<host>:<port>/schedule -d "action=removeSched&scheduleId=SCHEDULE_ID" -b azkaban.browser.session.id=SESSION_ID
```

### Get all projects
```
curl -k https://<host>:<port>/index?all -b azkaban.browser.session.id=<session.id>
```

### Fetch giant log
Go to `https://<host>:<port>/executor?execid=<execid>&jobId=<jobid>&ajax=fetchExecJobLogs&offset=0&length=2147483647&attempt=0`.

-----

### Setting jobtype properties
Can just set hadoop.home and hive.home in common.properties and commonprivate.properties and don't need to redefine these properties in all the jobtype subdirectories.

### Pig job type Hadoop conf overrides
For Pig jobs, you can override Hadoop confs by setting setting `jvm.args`. Example:
```
-Dmapred.map.output.compression.codec=com.hadoop.compression.lzo.LzoCodec
```

### Flows in a project

The number of flows in a project is equal to the number of end nodes (sinks). If you have a dependency graph like
```
  A
 / \
B   C
```
when you upload the project, you will get two flows: B and C

### Session id
You can also use `&session.id=<session.id>` instead of setting the `azkaban.browser.session.id` cookie.

# Errors
If you're getting a Jetty NOT_FOUND error when you try to load Azkaban, it probably means one of your viewer plugins is not configured properly.

When installing Reportal, make sure to include velocity-tools-2.0.jar and slf4j-log4j12-1.6.4.jar.

If you're using Hadoop, make sure to include the hadoop-core jar and add the Hadoop conf directory to your classpath.



### Building Azkaban
To build just the jars (and skip the tests), run
```
./gradlew jar
```

### Data triggers

Azkaban currently does not support data triggers. However, one workaround is to use Azkaban's `retries` feature with `retry.backoff`.

### OSX Test Failures
On OSX, tests may fail unless you set
```
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
```
Fixed in https://github.com/azkaban/azkaban/pull/343.

### Running Azkaban as root
Do not run Azkaban as root or else many default environment variables like `JAVA_HOME` and `HADOOP_HOME` will probably not be set and jobs will fail.

### Updating the Azkaban documentation
Source resides in gh-pages branch: https://github.com/azkaban/azkaban/tree/gh-pages. To use Jekyll and GitHub Pages, see https://help.github.com/articles/using-jekyll-with-pages/.

```
gem install bundler
```

Create a `Gemfile` in repo with these contents:
```
source 'https://rubygems.org'
gem 'github-pages'
```

Then run:
```
bundle install
bundle exec jekyll serve
```

View the page at http://localhost:4000. If port is already in use, you can launch on different port:
```
jekyll serve -P 4001
```



### Azkaban Eclipse local setup
1.
```
git clone git@github.com:azkaban/azkaban.git
cd azkaban
gradle cleanEclipse eclipse
gradle build -x test
cd ..
mkdir azkaban-conf-local
cp azkaban/azkaban-soloserver/src/package/conf/* azkaban-conf-local
cp -r azkaban/azkaban-soloserver/build/package/web azkaban-conf-local
```
2. Modify the `azkaban.properties` file you copied to `azkaban-conf-local`:
  * Change `web.resource.dir` to `/PATH/TO/azkaban-conf-local/web`.
  * Change `user.manager.xml.file` to `/PATH/TO/azkaban-conf-local/azkaban-users.xml`.
  * Change `executor.global.properties` to `/PATH/TO/azkaban-conf-local/global.properties`
  * Change `database.sql.scripts.dir` to `/PATH/TO/azkaban/azkaban-sql/src/sql`.
3. In Eclipse, File -> Import -> Existing Project.
4. Build the azkaban-common project and then the azkaban-soloserver project. You may need to Refresh the project and/or Project -> Clean it.
5. Create a new Eclipse configuration:
  * Set Main class to `azkaban.soloserver.AzkabanSingleServer`.
  * In Arguments, set Program arguments to `-conf /PATH/TO/azkaban-conf-local`.

Now you should be able to run AzkabanSingleServer from Eclipse and view the web UI in your browser at http://localhost:8081.

### Add jobtype plugins
1.
```
git clone git@github.com:azkaban/azkaban-plugins.git
cd azkaban-plugins
ant
cp -r dist/packages/jobtypes /PATH/TO/azkaban-conf-local
cd /PATH/TO/azkaban-conf-local/jobtypes
ln -s pig-0.11.0 pig
```
2. Edit `commonprivate.properties`:
```
hadoop.home=/PATH/TO/HADOOP/HOME
hive.home=/PATH/TO/HIVE/HOME
```
3. Update `pig/private.properties`:
```
# For Hadoop 1.2.1
jobtype.classpath=${hadoop.home}/conf,${hadoop.home}/*,${hadoop.home}/lib/*,lib/*

```
4. Add the following to `azkaban.properties`:
```
azkaban.jobtype.plugin.dir=/PATH/TO/azkaban-conf-local/jobtypes
```
5. Add `azkaban-plugins` to Eclipse.
6. Before debugging, add a breakpoint in `Utils.callConstructor()` on the line that calls `cons.newInstance()`. Then launch AzkabanSingleServer in Debug mode. When the breakpoint is hit, F5, then Edit Source Lookup Path --> Add --> Workspace Folder --> `azkaban-plugins/plugins/jobtype/src`.

### OS X local SMTP mail server for testing
```
sudo postfix start
```