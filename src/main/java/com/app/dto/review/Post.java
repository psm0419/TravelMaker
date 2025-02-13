package com.app.dto.review;

import java.util.Date;

import lombok.Data;

@Data
public class Post {
	
	int postId;	// 글순서?
	int boardId; // 후기글인지(1) 질문글인지(2)
	String title; // 제목
	String content; // 내용
	String userId; // 글쓴이 유저아이디
	String nickName; // 글쓴이 닉네임
	Date createdAt; // 생성날짜
	int postLike; // 좋아요수
	int postViews; // 조회수
	int status; // 글 상태(일반글,비밀글)
	String report; // 신고 상태 N:기본 Y:신고당함
	String images; // 기존 이미지 경로
    String fileName; // 랜덤으로 생성된 파일 이름
    String originalFileName; // 원본 파일 이름
    String filePath; // 파일 저장 경로
    String urlFilePath; // 파일 URL 경로

}
