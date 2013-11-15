package cmppkg;

import mdm.MDMConverter;

import mdm.in.InDoc;
import mdm.in.InSeg;

import java.io.Writer;
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.io.FileOutputStream;


import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertNotNull;


import static java.nio.charset.StandardCharsets.*;

public class InTest {
    private static final String OUT_FILE = "mdm_in.xml";

    private static final String DOC_ID = "ExampleDocument";
    private static final String SEG_ID = "SENT1";
    private static final String SEG_VAL = "السلطة الفلسطينية تستنكر استمرار سياسة الاغتيالات الاسرائي";
  
    @Test
    public void testPrepareInput() throws Exception {
        InSeg [] segs = new InSeg[1];
        segs[0] = new InSeg(SEG_ID, SEG_VAL);

        MDMConverter.marshal(new InDoc(DOC_ID, segs),
            new BufferedWriter(new OutputStreamWriter(new FileOutputStream(OUT_FILE), UTF_8)));
    }
};
