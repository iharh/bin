package mdm.xstream;

import mdm.in.InDoc;
import mdm.in.InSeg;

import mdm.xstream.in.InSegConverter;

import com.thoughtworks.xstream.XStream;

public class MDMInStreamFactory {
    public static final String ROOT_EL = "madamira_input";

    private static final String FIELD_ID       = "id";
    private static final String FIELD_SEGS     = "segs";

    private static final String ALIAS_IN_DOC   = "in_doc";
    private static final String ALIAS_IN_SEG   = "in_seg";


    private static XStream x;

    public static synchronized XStream getXStream() {
        if (x == null) {
            x = new XStream(new MDMStaxDriver());

            x.alias(ALIAS_IN_DOC, InDoc.class);
            x.useAttributeFor(InDoc.class, FIELD_ID);
            x.addImplicitArray(InDoc.class, FIELD_SEGS);

            x.alias(ALIAS_IN_SEG, InSeg.class);
            x.useAttributeFor(InSeg.class, FIELD_ID);
            x.registerConverter(new InSegConverter());
        }
        return x;
    }

};
