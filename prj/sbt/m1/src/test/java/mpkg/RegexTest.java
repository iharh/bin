package cmppkg;

import net.sourceforge.reb4j.Alternative;
import net.sourceforge.reb4j.Alternation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

import static org.hamcrest.CoreMatchers.is;

import static net.sourceforge.reb4j.charclass.CharClass.*;

public class RegexTest {
    @Test
    public void testRegex() throws Exception {
        Pattern pattern = Pattern.compile("_(\\d)+");
        Matcher matcher = pattern.matcher("This is _345my test st_1ring_ and ab343");

        assertEquals("This is my test string_ and ab343", matcher.replaceAll(""));

        Alternative oneDigitOctet = Perl.DIGIT;

        Alternation octet = Alternation.alternatives(oneDigitOctet, oneDigitOctet);

        assertThat(octet.toPattern().pattern(), is("\\d|\\d"));
    }
};
