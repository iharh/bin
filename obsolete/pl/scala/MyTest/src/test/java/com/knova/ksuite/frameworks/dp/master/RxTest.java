package com.knova.ksuite.frameworks.dp.master;

import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertFalse;
//import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;
//import static org.junit.Assert.assertNull;
//import static org.junit.Assert.fail;

import org.hamcrest.Matcher;
import org.hamcrest.CoreMatchers;
//git://github.com/hamcrest/JavaHamcrest.git
import static org.hamcrest.MatcherAssert.*;
import static org.hamcrest.collection.IsArrayContainingInAnyOrder.*;
//import static org.hamcrest.core.IsCollectionContaining.*;

import org.junit.Test;
//import org.junit.Ignore;
//import org.junit.Before;

import java.util.Arrays;
//import java.util.List;

public class RxTest {
	@Test
	public void test1() throws Exception {
		String [] speakers = { "bbb", "aaa" };
		assertNotNull(speakers);
		//assertEquals(7, speakers.length);
		//final List<String> list = Arrays.asList(speakers);
		//assertThat(Arrays.asList(speakers), hasItems("aaa", "bbb"));
		assertThat(speakers, arrayContainingInAnyOrder("aaa", "bbb"));
	}
};
