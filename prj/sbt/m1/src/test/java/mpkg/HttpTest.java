package cmppkg;

import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;

import org.apache.http.entity.InputStreamEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.client.utils.URIBuilder;
// http://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/org/apache/http/impl/client/HttpClientBuilder.html
import java.net.URI;

import java.io.Writer;
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Reader;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.ObjectInputStream;


import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;


import static java.nio.charset.StandardCharsets.*;

public class HttpTest {
    @Ignore 
    public void testHttp() throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        String s1 = "ABC";
        try {
            URI uri = new URIBuilder()
                .setScheme("http")
                .setHost("localhost")
                .setPort(8223)
                //.setPath("/search")
                //.setParameter("q", "httpclient")
                .build();

            RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(1000)
                .setConnectTimeout(1000)
                .build();

            HttpPost httppost = new HttpPost(uri);
            // httppost.setConfig(requestConfig);

            InputStreamEntity reqEntity = new InputStreamEntity(new FileInputStream("D:\\1\\data\\i1.xml"), -1);
            reqEntity.setContentType("application/xml");
            reqEntity.setChunked(true);

            httppost.setEntity(reqEntity);

            CloseableHttpResponse response = httpclient.execute(httppost);
            try {
                HttpEntity resEntity = response.getEntity();
                resEntity.writeTo(new FileOutputStream("D:\\aOut.xml"));
                // s1 = EntityUtils.toString(resEntity);
                EntityUtils.consume(resEntity); // TODO: use toString(resEntity) in the PROD
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
            // When HttpClient instance is no longer needed,
            // shut down the connection manager to ensure
            // immediate deallocation of all system resources
            // httpclient.getConnectionManager().shutdown();
        }
        assertEquals("ABC", s1);
    }
};
