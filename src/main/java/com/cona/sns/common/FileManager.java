package com.cona.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public final static String FILE_UPLOAD_PATH = "D:\\yuuur\\project\\upload\\sns";

	
	public static String saveFile(int userId, MultipartFile file) {
		
		if(file == null) {
			return null;
		}
		
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		
		// 디렉토리 생성 (폴더 생성)
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일 저장
		String filePath = directoryPath + "/" + file.getOriginalFilename();
		
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			// 파일 저장실패 
			return null;
		}
		
		
		// 클리이언트에서 접근가능한 url 규칙을 만들고 해당 문자열을 리턴
		// 파일 경로 : D:\\dulumaryT\\web\\230915\\springProject\\upload\\memo/2_9140918290/test.png
		// 경로 규칙 : /images/2_9140918290/test.png
		
		return "/images" + directoryName + "/" + file.getOriginalFilename();
	}
	
}
