package com.app.dto.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewImages {
	
	int imageId;
	int postId;
	String fileName;
	String originalFileName;
	String filePath;
	String urlFilePath;
	String fileExtension;
	Date uploadedAt;

}
