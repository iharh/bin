package mdm;

import mdm.xstream.MDMInStreamFactory;
import mdm.xstream.MDMOutStreamFactory;

import mdm.in.InDoc;
import mdm.out.OutDoc;

import com.thoughtworks.xstream.XStream;

import java.io.Reader;
import java.io.Writer;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.IOException;

import static mdm.xstream.MDMXStreamConstants.*;

public class MDMConverter {

    public static void marshal(InDoc inDoc, Writer writer) throws IOException {
        XStream x = MDMInStreamFactory.getXStream();

        ObjectOutputStream out = null;
        try {
            out = x.createObjectOutputStream(writer, ROOT_EL_IN);
            out.writeObject(inDoc);
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    public static OutDoc unmarshal(Reader reader) throws IOException, ClassNotFoundException {
        XStream x = MDMOutStreamFactory.getXStream();
        ObjectInputStream in = null;
        try {
            in = x.createObjectInputStream(reader);
            return (OutDoc) in.readObject();
        } finally {
            if (in != null) {
                in.close();
            }
        }
    }
};
