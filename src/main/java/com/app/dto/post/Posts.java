package com.app.dto.post;

import lombok.Data;

@Data
public class Posts {
	  int postId;
	  String title;
	  String content;
	  int userId;
	  String nickname;
	  int boardId;
	  String createdAt;
	  int postLike;
	  int postViews;
	  int status;
	  int authenticationStatus;
	  String authenticationAdmin;
	  String authenticationTime;
}
