package cmppkg;

import com.google.common.base.CharMatcher;
import com.google.common.base.Splitter;

import java.io.InputStream;
import java.io.FileOutputStream;
//import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.IOException;

import java.util.Map;
import java.util.Properties;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertEquals;

public class MappingTest {
    private static final String RES_MAPPING_PROPERTIES = "morph_ar_mapping.properties";

    private static final String PROP_ASP_C = "asp.c";
    private static final String PROP_ASP_C_VAL = "GrammarForm.Aspect: \"Command\"";

    private static final String OUT_FILE_PROPERTIES = "list.properties";
    private static final String OUT_FILE_PARESE_LOG = "parse.log";

    @Test
    public void testMapping() throws Exception {
        Properties mappingProps = new Properties();
        try(
            InputStream is = getClass().getResourceAsStream("/" + RES_MAPPING_PROPERTIES);
            //PrintStream ps = new PrintStream(new FileOutputStream(OUT_FILE_PROPERTIES));
            PrintWriter pl = new PrintWriter(OUT_FILE_PARESE_LOG);
        ) {
            mappingProps.load(is);
            //mappingProps.setProperty(PROP_ASP_C, "v1");
            //mappingProps.list(ps);
            for (String propKey : mappingProps.stringPropertyNames()) {
                pl.println("mapping key: " + propKey);
                String propVal = mappingProps.getProperty(propKey);
                pl.println("  mapping val: " + propVal);

                Splitter kvSplitter = Splitter.on(':').omitEmptyStrings().trimResults();
                Map<String, String> mapSplitter = Splitter.on(',').trimResults().omitEmptyStrings().withKeyValueSeparator(kvSplitter).split(propVal);
                for (Map.Entry<String, String> e : mapSplitter.entrySet()) {
                    pl.println("    attr name: " + e.getKey());
                    String attrVal = CharMatcher.is('\"').trimFrom(e.getValue());
                    pl.println("    attr tval: " + attrVal);
                }
            }
        }
        String propVal = mappingProps.getProperty(PROP_ASP_C);
        assertEquals(PROP_ASP_C_VAL, propVal);
    }
};
