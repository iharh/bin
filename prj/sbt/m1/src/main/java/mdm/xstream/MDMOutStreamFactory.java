package mdm.xstream;

import mdm.out.OutDoc;
import mdm.out.OutSeg;
import mdm.out.SegInfo;
import mdm.out.Word;
import mdm.out.Analysis;
import mdm.out.MorphFS;

import com.thoughtworks.xstream.XStream;

public class MDMOutStreamFactory {
    private static final String FIELD_ID       = "id";
    private static final String FIELD_SEGS     = "segs";
    private static final String FIELD_WORDS    = "words";
    private static final String FIELD_WORD     = "word";
    private static final String FIELD_SEGINFO  = "segInfo";
    private static final String FIELD_MORPH_FS = "morphFS";
    private static final String FIELD_STEM     = "stem";

    private static final String ALIAS_OUT_DOC   = "out_doc";
    private static final String ALIAS_OUT_SEG   = "out_seg";
    private static final String ALIAS_SEG_INFO  = "segment_info";
    private static final String ALIAS_WORD_INFO = "word_info";
    private static final String ALIAS_WORD      = "word";
    private static final String ALIAS_ANALYSIS  = "analysis";
    private static final String ALIAS_MORPH_FS  = "morph_feature_set";

    private static XStream x;

    public static synchronized XStream getXStream() {
        if (x == null) {
            x = new XStream(new MDMStaxDriver());

            x.alias(ALIAS_OUT_DOC, OutDoc.class);
            x.useAttributeFor(OutDoc.class, FIELD_ID);
            x.addImplicitArray(OutDoc.class, FIELD_SEGS);

            x.alias(ALIAS_OUT_SEG, OutSeg.class);
            x.useAttributeFor(OutSeg.class, FIELD_ID);
            x.aliasField(ALIAS_SEG_INFO, OutSeg.class, FIELD_SEGINFO);
            x.aliasField(ALIAS_WORD_INFO, OutSeg.class, FIELD_WORDS);

            x.alias(ALIAS_WORD, Word.class);
            x.useAttributeFor(Word.class, FIELD_ID);
            x.useAttributeFor(Word.class, FIELD_WORD);

            x.alias(ALIAS_ANALYSIS, Analysis.class);
            x.aliasField(ALIAS_MORPH_FS, Analysis.class, FIELD_MORPH_FS);

            x.useAttributeFor(MorphFS.class, FIELD_STEM);
        }
        return x;
    }

};
