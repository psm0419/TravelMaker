package com.app.dto.review;

import java.util.Date;

import lombok.Data;

@Data
public class Comment { //댓글
	
	int commentId;  // 댓글아이디 PK
	String content;	// 댓글내용
	int postId;		// 댓글단 곳이 후기글(1)인지 질문글(2)인지
	int userId;		// 댓글단 유저 아이디
	Date createdAt; // 댓글생성시간
	String nickName; // 댓글단 유저 닉네임
	
}
