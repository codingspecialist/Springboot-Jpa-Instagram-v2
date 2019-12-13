package com.cos.insta.util;

import java.util.ArrayList;
import java.util.List;

public class Utils {
	
	// Tag 파싱
	public static List<String> tagParser(String tags){
		String temp[] = tags.split("#");
		
		List<String> tagList = new ArrayList<String>();
		
		int len = temp.length;
		
		for(int i=1; i<len; i++) {
			tagList.add(temp[i]);
		}
		return tagList;
	}
}
