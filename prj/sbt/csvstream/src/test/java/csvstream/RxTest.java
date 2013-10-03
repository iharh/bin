package csvstream;

import org.junit.Test;

import static org.junit.Assert.assertTrue;

import com.csvreader.CsvWriter;

import rx.Observable;
import rx.Observer;
import rx.observables.ConnectableObservable;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import java.util.List;
import java.util.ArrayList;

import static java.nio.charset.StandardCharsets.*;

public class RxTest {

	private class StatItem {
		private int id;
		private double freq;

		public StatItem(int id, double freq) {
			this.id = id;
			this.freq = freq;
		}

		public void write(CsvWriter w) throws IOException {
			w.write(Integer.toString(id));
			w.write(Double.toString(freq));
			w.endRecord();
		}
	}

	private class StatObserver implements Observer<StatItem> {
		private CsvWriter w;

		public StatObserver(CsvWriter w) throws IOException {
			this.w = w;
			w.writeRecord(new String [] {"RECORD_ID", "FREQ"});
		}

		@Override
		public void onNext(StatItem item) {
			try {
				item.write(w);
			}
			catch (IOException e) {
			}
		}

		@Override
		public void onCompleted() {
			w.close(); // ex-unsafe
		}

		@Override
		public void onError(Throwable t) {
		}
	}

	private CsvWriter createCsvWriter(String name) throws FileNotFoundException {
		return new CsvWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D:\\" + name + ".csv"), UTF_8)), ',');
	}

	@Test
	public void test1() throws Exception {
		final CsvWriter w1 = createCsvWriter("w1");
		final CsvWriter w2 = createCsvWriter("w2");

		final int IDS_SIZE = 6;
		List<StatItem> items = new ArrayList<StatItem>(IDS_SIZE);
		for (int i = 0; i < IDS_SIZE; ++i)
			items.add(new StatItem(i, i + 1));

		// call .publish() to get ConnectableObservable
		ConnectableObservable o = Observable.from(items).publish();
		o.subscribe(new StatObserver(w1));
		o.subscribe(new StatObserver(w2));
		o.connect();

		assertTrue(true);
    	}
}

