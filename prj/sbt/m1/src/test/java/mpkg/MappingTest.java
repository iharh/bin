package cmppkg;

import java.util.Properties;

import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.io.IOException;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertEquals;

public class MappingTest {
    private static final String RES_MAPPING_PROPERTIES = "mapping.properties";
    private static final String PROP_ASP_C = "asp.c";
    private static final String PROP_ASP_C_VAL = "GrammarForm.Aspect: \"Command\"";

    private static final String OUT_FILE_PROPERTIES = "list.properties";

    @Test
    public void testMapping() throws Exception {
        Properties mappingProps = new Properties();
        try(
            InputStream is = getClass().getResourceAsStream("/" + RES_MAPPING_PROPERTIES);
            PrintStream ps = new PrintStream(new FileOutputStream(OUT_FILE_PROPERTIES));
        ) {
            mappingProps.load(is);
            //mappingProps.setProperty(PROP_ASP_C, "v1");
            mappingProps.list(ps);
        }
        String propVal = mappingProps.getProperty(PROP_ASP_C);
        assertEquals(PROP_ASP_C_VAL, propVal);
    }
};
