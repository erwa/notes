### Overview

From Databricks

https://www.slideshare.net/databricks/project-hydrogen-unifying-stateoftheart-ai-and-big-data-in-apache-spark-with-tim-hunter

* introduced gang scheduling for distributed DL jobs (which generally need all containers together) - slide 15
* RDD.barrier() - launch all tasks together
* context.barrier() - global barrier
* Adding barrier support in Spark for YARN, Kubernetes, Mesos (slide 19)
* Data exchange format between Spark and DL frameworks: https://jira.apache.org/jira/browse/SPARK-24579
* Pandas UDF support in Spark 2.3, uses Arrow for data exchange and Pandas for vectorized computation
* rdd.accelerated.by("/gpu/p100") (slide 32)
* valu gpus = context.getAcceleratorInfos() (slide 33)
* GPU support in Spark 3.0 - https://issues.apache.org/jira/browse/SPARK-20327