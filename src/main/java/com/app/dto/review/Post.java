package com.app.dto.review;

import java.util.Date;

import lombok.Data;

@Data
public class Post {
	
	int postId;	// 글순서?
	String title; // 제목
	String content; // 내용
	String nickName; //닉네임
	String userId; // 글쓴이 유저아이디
	Date createdAt; // 생성날짜
	int postLike; // 좋아요수
	int postViews; // 조회수
	int status; // 글 상태(일반글,비밀글)
	String report; // 신고 상태 N:기본 Y:신고당함

}
