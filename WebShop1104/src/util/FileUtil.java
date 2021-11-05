package util;

import java.io.*;


public class FileUtil {

	// 서버에 진짜 파일을 올려주는 부분 
	public static void saveImage(String root, String pname, byte[] data) throws IOException {
		
//		File f = new File("photos/");
//		
//		if(!f.exists()) f.mkdir();
//		
//		f = new File(fname);
//		FileOutputStream out = new FileOutputStream(f);
//		out.write(data);;
//		out.close();
		root += "/images";
		
		File f = new File(root);
		if (!f.exists()) f.mkdir();
		
		f = new File(root + "/" +pname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();

	}
}
