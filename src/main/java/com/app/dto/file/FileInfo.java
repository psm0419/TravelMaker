package com.app.dto.file;

import lombok.Data;

@Data
public class FileInfo {

	//String fileId;  //PK
	
	String fileName;  //저장된 파일이름 (유니크) pk로 활용
	String originalFileName;  // 원래 파일이름
	String filePath; // 저장된 경로
	String urlFilePath; // url 로 요청할때 경로
	
	// extension
	// fileSize
	// fileSaveDate
	
}
