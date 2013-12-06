package mpkg;

import mdm.MDMProcessor;

import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListeningExecutorService;
import com.google.common.util.concurrent.MoreExecutors;
import com.google.common.util.concurrent.FutureCallback;
import com.google.common.util.concurrent.Futures;

import java.io.OutputStream;
import java.io.FileOutputStream;

import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;


import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class HttpTest {
    @Test 
    public void testHttp() throws Exception {
        try {
            final int runs = 10000;
            for (int k=0; k < runs; ++k) {
                MDMTestUtils.checkOutDoc1(MDMProcessor.process(MDMTestUtils.getInDoc1()));
            };
            /*
            ListeningExecutorService executor = MoreExecutors.listeningDecorator(Executors.newFixedThreadPool(4));
            int runs = 15;
            for (int k=0; k < runs; ++k) {
                Callable<Integer> job = new Callable<Integer>() {
                    @Override
                    public Integer call() throws Exception {
                        MDMTestUtils.checkOutDoc1(MDMProcessor.process(MDMTestUtils.getInDoc1()));
                        return 0;
                    }
                };

                ListenableFuture<Integer> completion = executor.submit(job);
                Futures.addCallback(completion, new FutureCallback<Integer>() {
                    @Override
                    public void onFailure(Throwable t) {
                        // log error
                    }
                    @Override
                    public void onSuccess(Integer result) {
                        // do something with the result
                    }
                });
            }

            executor.shutdown();
            while (!executor.isTerminated()) {
                executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
            }
            */
        } finally {
            MDMProcessor.close();
        }
        assertTrue(true);
    }
};
