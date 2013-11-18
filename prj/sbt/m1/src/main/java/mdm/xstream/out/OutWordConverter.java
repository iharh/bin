package mdm.xstream.out;

import mdm.out.Word;
import mdm.out.WordAttr;
import mdm.out.Analysis;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

import static mdm.xstream.MDMXStreamConstants.*;

public class OutWordConverter implements Converter {
    private XStream xstream;

    public OutWordConverter(XStream xstream) {
        this.xstream = xstream;
    }

    public boolean canConvert(Class clazz) {
            return Word.class == clazz;
    }

    public void marshal(Object value, HierarchicalStreamWriter writer, MarshallingContext context) {
	throw new UnsupportedOperationException("serialization is not supported by design here");
    }

    public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {
        Word word = new Word();
        word.setId(reader.getAttribute(FIELD_ID));
        word.setWord(reader.getAttribute(FIELD_WORD));

        if (reader.hasMoreChildren()) {
            reader.moveDown();
            Analysis analysis = (Analysis) xstream.unmarshal(reader);
            word.setAnalysis(analysis);
            reader.moveUp();
        }

        return word;
    }
};

