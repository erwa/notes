### Kerberos authentication to REST service

Uses Kerberos credentials in local cache.

```
import org.apache.hadoop.security.authentication.client.AuthenticatedURL;
import java.net.HttpURLConnection;
import java.net.URL;


public class Test {
  public static void main(String[] args) throws Exception {
    String urlStr = "http://<jobhistoryserver.com>:19888/ws/v1/history/mapreduce/jobs/<job_id>/counters";
    URL url = new URL(urlStr);
    AuthenticatedURL.Token token = new AuthenticatedURL.Token();
    HttpURLConnection conn = new AuthenticatedURL().openConnection(url, token);
    conn = new AuthenticatedURL().openConnection(url, token);
    System.out.println(conn.getResponseMessage());
    System.out.println(conn.getResponseCode());
  }
}
```


### Word Count

```
# tempdir and tempdir2 are HDFS directories
hadoop jar hadoop-mapreduce-examples-2.6.1.47.jar wordcount tempdir tempdir2
```