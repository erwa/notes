### Starting and stopping Jenkins
```
sudo service jenkins start/stop/restart
sudo chkconfig jenkins on
```
https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions

#### Manual restart
```
(jenkins_url)/safeRestart
```
http://stackoverflow.com/questions/8072700/jenkins-manual-restart

### Manual Plugin installation
1. Download plugin from https://updates.jenkins-ci.org/download/plugins (e.g.: http://updates.jenkins-ci.org/latest/build-with-parameters.hpi)
2. Go to https://<host>:<port>/pluginManager/advanced
3. Upload .hpi file and install
4. Restart Jenkins by going to https://<host>:<port>/restart

* Build artifacts are stored in $JENKINS_HOME/jobs
* $JENKINS_HOME might be /export/apps/jenkins
* Jenkins JIRA Plugin can auto update JIRA tickets based on the ticket ID (example: HADOOP-1234) in the commit message

### Slave configuration
```
/computer
```