package mdm.out;

public class Word {
    private String id;
    private String word;
    private Analysis analysis;
    private WordAttr [] attrs;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getWord() {
        return word;
    }
    public void setWord(String word) {
        this.word = word;
    }

    public Analysis getAnalysis() {
        return analysis;
    }
    public void setAnalysis(Analysis analysis) {
        this.analysis = analysis;
    }

    public WordAttr [] getAttrs() {
        return attrs;
    }
    public void setAttrs(WordAttr [] attrs) {
        this.attrs = attrs;
    }
};
