package com.app.dto.review;

import lombok.Data;

@Data
public class PostLike {
	
	int postId; //좋아요 누른 글 아이디
	int userId; //좋아요 누른 유저 아이디

}
