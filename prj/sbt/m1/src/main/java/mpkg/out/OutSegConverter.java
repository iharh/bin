package cmppkg.out;

import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class OutSegConverter implements Converter {
    public boolean canConvert(Class clazz) {
            return OutSeg.class == clazz;
    }

    public void marshal(Object value, HierarchicalStreamWriter writer, MarshallingContext context) {
	throw new UnsupportedOperationException("deserialization is not supported by design here");
    }

    public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {
        OutSeg result = new OutSeg();
        result.setId(reader.getAttribute("id"));
        result.setValue(reader.getValue());
        return result;
    }
};

