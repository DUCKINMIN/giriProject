package com.sist.controller;

import java.io.*;
import java.util.*;

public class FileConfig {
	public List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		try {
			String path = "C:\\Users\\purpu\\git\\giriProject\\test1223\\src\\";
			path=path+pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			for (File f : files) {
				String name = f.getName();
				String ext = name.substring(name.lastIndexOf(".")+1);

				if (ext.equals("java")) {
					String str = pack+"."+name.substring(0, name.lastIndexOf("."));
					list.add(str);
				}
			}
		} catch (Exception e) {
			System.out.println("FileConfig : " + e.getMessage());
		}
		return list;
	}
}

