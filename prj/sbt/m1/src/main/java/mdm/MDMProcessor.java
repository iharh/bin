package mdm;

import mdm.in.InDoc;
import mdm.out.OutDoc;

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
import java.net.URISyntaxException;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.io.OutputStream;
import java.io.ByteArrayOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import static org.apache.http.entity.ContentType.*;

import static java.nio.charset.StandardCharsets.*;

public class MDMProcessor {
    private static final String HTTP_SCHEME = "http";
    private static final String HTTP_HOST = "localhost";
    private static final int HTTP_PORT = 8223;

    private static final int REQ_SOCKET_TIMEOUT = 1000;
    private static final int REQ_CONNECT_TIMEOUT = 1000;

    private static CloseableHttpClient mdmHttpClient;
    private static URI mdmURI;
    //private static RequestConfig mdmRequestConfig;

    private static synchronized CloseableHttpClient getHttpClient() throws URISyntaxException {
        if (mdmHttpClient == null) {
            mdmHttpClient = HttpClients.createDefault();

            mdmURI = new URIBuilder()
                .setScheme(HTTP_SCHEME)
                .setHost(HTTP_HOST)
                .setPort(HTTP_PORT)
                //.setPath("/search")
                //.setParameter("q", "value")
                .build();

            //mdmRequestConfig = RequestConfig.custom()
            //    .setSocketTimeout(REQ_SOCKET_TIMEOUT)
            //    .setConnectTimeout(REQ_CONNECT_TIMEOUT)
            //    .build();
        }
        return mdmHttpClient;
    }

    public static synchronized void close() throws IOException {
        if (mdmHttpClient != null) {
            // When HttpClient instance is no longer needed,
            // shut down the connection manager to ensure
            // immediate deallocation of all system resources
            // mdmHttpClient.getConnectionManager().shutdown();
            mdmHttpClient.close();
        }
    }

    public static void process(InputStream in, OutputStream out) throws IOException, URISyntaxException {
        CloseableHttpClient httpclient = getHttpClient(); // !!! side-effect is mdmURI initialization !!!

        InputStreamEntity reqEntity = new InputStreamEntity(in, APPLICATION_XML);
        reqEntity.setChunked(true);

        HttpPost httppost = new HttpPost(mdmURI);
        // httppost.setConfig(mdmRequestConfig);
        httppost.setEntity(reqEntity);

        try (CloseableHttpResponse response = httpclient.execute(httppost)) {
            HttpEntity resEntity = response.getEntity();
            resEntity.writeTo(out);
            EntityUtils.consume(resEntity); // we can use toString(resEntity) also
        }
    }

    public static OutDoc process(InDoc inDoc) throws IOException, URISyntaxException, ClassNotFoundException {
        ByteArrayInputStream bis = null;
        try {
            try (ByteArrayOutputStream bos = new ByteArrayOutputStream()) { // TODO: specifying direct size impacts performance a lot !!!
                MDMConverter.marshal(inDoc,
                    new BufferedWriter(
                        new OutputStreamWriter(bos, UTF_8)
                    )
                );
                bis = new ByteArrayInputStream(bos.toByteArray());
            }

            try (ByteArrayOutputStream bos = new ByteArrayOutputStream()) { // TODO: specifying direct size impacts performance a lot !!!
                process(bis, bos);

                bis.close();
                bis = new ByteArrayInputStream(bos.toByteArray());
            }

            OutDoc outDoc = MDMConverter.unmarshal(
                new BufferedReader(
                    new InputStreamReader(bis, UTF_8)
                )
            );
            return outDoc;
        } finally {
            if (bis != null)
                bis.close();
        }
    }
};

