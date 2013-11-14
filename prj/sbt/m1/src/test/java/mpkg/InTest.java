package cmppkg;

import cmppkg.in.InDoc;
import cmppkg.in.InSeg;
import cmppkg.in.InSegConverter;

import com.thoughtworks.xstream.XStream;

import java.io.Writer;
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;


import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertNotNull;


import static java.nio.charset.StandardCharsets.*;

public class InTest {
    private static final String DOC_ID = "ExampleDocument";
    private static final String SEG_ID = "SENT1";
    private static final String SEG_VAL = "السلطة الفلسطينية تستنكر استمرار سياسة الاغتيالات الاسرائي";
    private static final String OUT_FILE = "D:\\oXStream.xml";
    private static final String ROOT_EL = "madamira_input";

    @Ignore
    public void testPrepareInput() throws Exception {
        XStream xstream = new XStream(new MADAMIRAStaxDriver());

        xstream.alias("in_doc", InDoc.class);
        xstream.useAttributeFor(InDoc.class, "id");
        xstream.alias("in_seg", InSeg.class);
        xstream.useAttributeFor(InSeg.class, "id");
        xstream.addImplicitArray(InDoc.class, "segs");
        xstream.registerConverter(new InSegConverter());

        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(OUT_FILE), UTF_8));
        ObjectOutputStream out = null;
        try {
            out = xstream.createObjectOutputStream(writer, ROOT_EL);
            assertNotNull(out);
            InSeg [] segs = new InSeg[1];
            segs[0] = new InSeg(SEG_ID, SEG_VAL);
            out.writeObject(new InDoc(DOC_ID, segs));
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
};
