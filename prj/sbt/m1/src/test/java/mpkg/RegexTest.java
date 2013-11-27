package mpkg;

import net.sourceforge.reb4j.Alternation;
import net.sourceforge.reb4j.Sequence;
import net.sourceforge.reb4j.Literal;
import net.sourceforge.reb4j.Quantified;
import net.sourceforge.reb4j.charclass.CharClass;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

import static org.hamcrest.CoreMatchers.is;

import static net.sourceforge.reb4j.charclass.CharClass.Perl.*;

public class RegexTest {
    @Test
    public void testRegex() throws Exception {
        // Literal, CharClass  are both Sequencable, Alternative, Quantifiable
        final Literal u = Literal.literal('_');
        final CharClass d = DIGIT;
        final Quantified dp = Quantified.atLeastOnce(d);

        final Sequence udp = Sequence.sequence(u, dp);
        assertThat(udp.toPattern().pattern(), is("_\\d+"));

        final Sequence dpu = Sequence.sequence(dp, u);
        assertThat(dpu.toPattern().pattern(), is("\\d+_"));

        final Alternation alt = Alternation.alternatives(udp, dpu);

        final Pattern pat = alt.toPattern();
        assertThat(pat.pattern(), is("_\\d+|\\d+_"));

        Matcher matcher = pat.matcher("Th234_is is _345my test st_1ring_ and ab343 or0_");
        assertEquals("This is my test string_ and ab343 or", matcher.replaceAll(""));
    }
};
