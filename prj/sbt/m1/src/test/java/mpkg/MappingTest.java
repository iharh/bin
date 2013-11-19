package cmppkg;

import org.apache.commons.io.IOUtils;

import java.util.Properties;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.io.IOException;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

public class MappingTest {
    private static final String RES_MAPPING_PROPERTIES = "mapping.properties";
    private static final String PROP_ASP_C = "asp:c";
    private static final String OUT_FILE = "dump.out";
    private static final String OUT_FILE_PROPERTIES = "list.properties";

    private static final String RES_IN_XML = "mapping.properties"; // "sample_mdm_out.xml";

    @Test
    public void testMapping() throws Exception {
        Properties mappingProps = new Properties();
        try(
            InputStream is = getClass().getResourceAsStream("/" + RES_IN_XML); // RES_MAPPING_PROPERTIES);
            OutputStream os = new FileOutputStream(OUT_FILE);
            PrintStream ps = new PrintStream(new FileOutputStream(OUT_FILE_PROPERTIES));
        ) {
            // IOUtils.copy(is, os);
            mappingProps.load(is);
            //mappingProps.setProperty(PROP_ASP_C, "v1");
            mappingProps.list(ps);
        }
        assertNotNull(mappingProps.getProperty(PROP_ASP_C));
    }
};
