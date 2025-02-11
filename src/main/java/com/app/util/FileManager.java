package com.app.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.app.dto.file.FileInfo;

public class FileManager {

	static final String FILE_DIRECTORY_PATH = "d:/fileStorage/";
	static final String FILE_URL_PATH = "/fileStorage/";
	
	
	public static FileInfo storeFile(MultipartFile file) throws IllegalStateException, IOException {
		
		// 파일을 폴더에 저장 -> 파일에 대한 정보를 기반으로 -> DB에 저장
		FileInfo fileInfo = new FileInfo();
		
		
		fileInfo.setOriginalFileName(file.getOriginalFilename());
		fileInfo.setFilePath(FILE_DIRECTORY_PATH);
		fileInfo.setUrlFilePath(FILE_URL_PATH);
		
		String extension = extractExtension(file.getOriginalFilename()); //원래파일이름 담기
		String fileName = createFileName(extension);  //원래파일이름 넘겨서 유니크이름 받기
		
		fileInfo.setFileName(fileName); // 유니크이름 받은거 담기
		
		file.transferTo( new File( fileInfo.getFilePath() + fileInfo.getFileName() ) );
		
		return fileInfo;
		// tree.jpg
		// asd24-erfer-wqe34.jpg 유니크한 이름으로 저장
		// 확장자(jpg,png,hwp..)는 유니크id 뒤에 동적으로 붙어
	}
	
	private static String createFileName(String extension) {
		String fileName = UUID.randomUUID().toString();  //유니크한 id 만들어 주는 애
		  // asd24-erfer-wqe34  +  .jpg
		fileName = fileName + "." + extension;
		
		return fileName;
	}
	
	private static String extractExtension(String fileName) {  //확장자를 추출하는 메소드
		// ex) tree.jpg
		return fileName.substring( fileName.lastIndexOf(".") + 1);
	}
	
}








