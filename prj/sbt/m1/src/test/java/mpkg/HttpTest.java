package mpkg;

import mdm.MDMProcessor;

import java.io.OutputStream;
import java.io.FileOutputStream;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class HttpTest {
    @Ignore 
    public void testHttp() throws Exception {
        try {
            MDMTestUtils.checkOutDoc1(MDMProcessor.process(MDMTestUtils.getInDoc1()));
        } finally {
            MDMProcessor.close();
        }
        assertTrue(true);
    }
};
