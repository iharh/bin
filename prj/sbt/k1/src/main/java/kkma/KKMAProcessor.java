package kkma;

import org.snu.ids.ha.ma.MExpression;
import org.snu.ids.ha.ma.MorphemeAnalyzer;
import org.snu.ids.ha.ma.Sentence;

import java.util.List;
import java.util.Scanner;
/*
import java.io.IOException;
*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static java.nio.charset.StandardCharsets.*;

public class KKMAProcessor {
    private static final Logger log = LoggerFactory.getLogger(KKMAProcessor.class);
    
    public static void main(String [] args) {
        //System.setProperty("DO_DEBUG", "DO_DEBUG");
        MorphemeAnalyzer ma = new MorphemeAnalyzer();

        // create logger, null then System.out is set as a default logger
        ma.createLogger(null);

        Scanner sc = new Scanner(System.in, UTF_8.name());
        try {
            while(sc.hasNextLine()) {
                String s = sc.nextLine();

                // analyze morpheme without any post processing 
                List<MExpression> ret = ma.analyze(s);

                // refine spacing
                ret = ma.postProcess(ret);

                // leave the best analyzed result
                ret = ma.leaveJustBest(ret);

                // divide result to setences
                List<Sentence> stl = ma.divideToSentences(ret);

                // print the result
                for (int i = 0; i < stl.size(); ++i) {
                    Sentence st = stl.get(i);
                    System.out.println("===>  " + st.getSentence());
                    for (int j = 0; j < st.size(); ++j) {
                        System.out.println(st.get(j));
                    }
                }
            }
        }
        catch (Exception e) {
            log.error("Encountered ERROR: " + e.getMessage(), e);
            System.err.println("Encountered ERROR: " + e.getMessage());
        }

        System.out.println("Done with KKMA!");

        ma.closeLogger();
    }
};

