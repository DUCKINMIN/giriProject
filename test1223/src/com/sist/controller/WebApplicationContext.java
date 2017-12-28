package com.sist.controller;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import java.io.*;
public class WebApplicationContext {
	private List<String> list = new ArrayList<String>();
	
	public WebApplicationContext(String path) {
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm);
			
			List<String> packList = hm.getList();
			
			FileConfig fc = new FileConfig();
			for (String pack : packList) {
				List<String> p = fc.componentScan(pack);
				for (String s : p) {
					list.add(s);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<String> getList() {
		return list;
	}
}
