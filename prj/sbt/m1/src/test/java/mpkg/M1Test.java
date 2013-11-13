package cmppkg;

import com.thoughtworks.xstream.XStream;


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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Writer;
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;

import org.junit.Test;
import org.junit.Ignore;


import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

public class M1Test {
    @Test
    public void testXStream() throws Exception {
        XStream xstream = new XStream();

        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("D:\\oXStream.xml")), "utf8"));
        ObjectOutputStream out = null;
        try {
            out = xstream.createObjectOutputStream(writer);
            out.writeObject("abc");
            out.writeObject("def");
            out.writeObject(56);
        } finally {
            if (out != null) {
                out.close();
            }
        }

        assertTrue(true);
    }

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

            InputStreamEntity reqEntity = new InputStreamEntity(new FileInputStream(new File("D:\\1\\data\\i1.xml")), -1);
            reqEntity.setContentType("application/xml");
            reqEntity.setChunked(true);

            httppost.setEntity(reqEntity);

            CloseableHttpResponse response = httpclient.execute(httppost);
            try {
                HttpEntity resEntity = response.getEntity();
                resEntity.writeTo(new FileOutputStream(new File("D:\\aOut.xml")));
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
