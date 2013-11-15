package cmppkg;

import mdm.MDMConverter;

import mdm.out.OutDoc;
import mdm.out.OutSeg;
import mdm.out.SegInfo;
import mdm.out.Word;
import mdm.out.Analysis;
import mdm.out.MorphFS;

import java.io.Reader;
import java.io.BufferedReader;
import java.io.InputStreamReader;


import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;


import static java.nio.charset.StandardCharsets.*;

public class OutTest {
    private static final String RES_OUT_XML    = "mdm_out.xml";

    private static final String DOC_ID         = "ExampleDocument";
    private static final String SEG_ID         = "SENT1";
    private static final String PREPROC_VAL    = "AlslTp AlflsTynyp tstnkr AstmrAr syAsp AlAgtyAlAt AlAsrA}y";
    private static final String WORD0_WORD_VAL = "السلطة";
    private static final String WORD0_STEM_VAL = "سُلْط";

    @Test
    public void testAnalyzeOutput() throws Exception {
        Reader reader = new BufferedReader(new InputStreamReader(
            getClass().getResourceAsStream("/" + RES_OUT_XML),
            UTF_8));

        OutDoc outDoc = MDMConverter.unmarshal(reader);

        assertNotNull(outDoc);
        assertEquals(DOC_ID, outDoc.getId());

        OutSeg [] segs = outDoc.getSegs();
        assertNotNull(segs);
        assertThat(segs.length, greaterThan(0));

        int idx = 0;
        OutSeg outSeg = segs[idx];
        assertNotNull(outSeg);
        assertEquals(SEG_ID, outSeg.getId());

        SegInfo segInfo = outSeg.getSegInfo();
        assertNotNull(segInfo);
        assertEquals(PREPROC_VAL, segInfo.getPreprocessed());

        Word [] words = outSeg.getWords();
        assertNotNull(words);
        assertThat(words.length, greaterThan(0));

        Word word = words[idx];
        assertNotNull(word);

        assertEquals(Integer.toString(idx), word.getId());
        assertEquals(WORD0_WORD_VAL, word.getWord());
        
        Analysis analysis = word.getAnalysis();
        assertNotNull(analysis);

        MorphFS morphFS = analysis.getMorphFS();
        assertNotNull(morphFS);
    }
};
