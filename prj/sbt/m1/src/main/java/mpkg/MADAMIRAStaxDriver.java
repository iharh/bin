package cmppkg;

import com.thoughtworks.xstream.io.xml.StaxDriver;
import com.thoughtworks.xstream.io.xml.StaxWriter;
import com.thoughtworks.xstream.io.naming.NoNameCoder;

import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;

public class MADAMIRAStaxDriver extends StaxDriver {
    public MADAMIRAStaxDriver() {
        super(new NoNameCoder());
        getQnameMap().setDefaultNamespace("urn:edu.columbia.ccls.madamira.configuration:0.1");
    }

    public StaxWriter createStaxWriter(XMLStreamWriter out) throws XMLStreamException {
        return createStaxWriter(out, false);
    }
};

