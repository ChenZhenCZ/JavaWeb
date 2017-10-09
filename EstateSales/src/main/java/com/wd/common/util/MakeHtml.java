package com.wd.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class MakeHtml {
	public static String makeHtml(String content,String path) throws IOException{;
		String PAGE_HEAD="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body>";
		String PAGE_TAIL="</body></html>";
		content = PAGE_HEAD + content + PAGE_TAIL;
		File file = new File(path);
		FileOutputStream fos;
		fos = new FileOutputStream(file);
		fos.write(content.getBytes());
		fos.close();
		return content;
	}
}
