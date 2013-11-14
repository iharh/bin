package cmppkg;

import cmppkg.out.OutDoc;
import cmppkg.out.OutSeg;
import cmppkg.out.OutSegConverter;

import com.thoughtworks.xstream.XStream;

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

public class OutTest {
    private static final String DOC_ID = "ExampleDocument";
    private static final String SEG_ID = "SENT1";
    private static final String SEG_VALUE = "abc def";

    @Test
    public void testAnalyzeOutput() throws Exception {
        XStream xstream = new XStream(new MADAMIRAStaxDriver());

        xstream.alias("out_doc", OutDoc.class);
        xstream.useAttributeFor(OutDoc.class, "id");
        xstream.alias("out_seg", OutSeg.class);
        xstream.useAttributeFor(OutSeg.class, "id");
        xstream.addImplicitArray(OutDoc.class, "segs");
        xstream.registerConverter(new OutSegConverter());

        Reader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\aaa.xml"), UTF_8));
        ObjectInputStream in = null;
        try {
            in = xstream.createObjectInputStream(reader);
            OutDoc outDoc = (OutDoc) in.readObject();

            assertNotNull(outDoc);
            assertEquals(DOC_ID, outDoc.getId());
            OutSeg [] segs = outDoc.getSegs();
            assertNotNull(segs);
            assertEquals(1, segs.length);
            OutSeg seg = segs[0];
            assertNotNull(seg);
            assertEquals(SEG_ID, seg.getId());
            assertEquals(SEG_VALUE, seg.getValue());
        } finally {
            if (in != null) {
                in.close();
            }
        }
    }
};
