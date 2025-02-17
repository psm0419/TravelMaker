package com.app.controller.board;

import java.io.File;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.app.dto.review.Comment;
import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;
import com.app.dto.signup.User;
import com.app.service.file.FileService;
import com.app.service.review.post.PostService;
import com.app.service.review.reviewDetail.comment.CommentService;
import com.app.service.signup.UserService;


@Controller
public class BoardController {
	
	@Autowired
	PostService postService;

	@Autowired
	CommentService commentService;

	@Autowired
	FileService fileService;
	
	@Autowired
	UserService userService;
	
//	UserService userService;
	

	@GetMapping("/reviewBoard") // 후기게시판 화면
	public String reviewBoard(@RequestParam("boardId") int boardId, Model model) {
		List<Post> reviewPostList = postService.findPostListByBoardId(boardId); // boardId가 1인 후기게시글리스트 전체호출

//		for (Post post : reviewPostList) {
//	        String urlFilePath = postService.getUrlFilePathByPostId(post.getPostId()); // 이미지 URL 가져오기
//	        post.setUrlFilePath(urlFilePath); // 이미지 URL 설정
//	    }
		
		for (Post post : reviewPostList) {
	        postService.setImageUrlForPost(post);  // 각 포스트에 이미지 URL을 설정
	    }
		
		System.out.println("후기 리스트:" + reviewPostList);

		model.addAttribute("reviewPostList", reviewPostList); // 화면에 표시

		return "boardpage/ReviewBoard";
	}


	@GetMapping("/reviewDetail/{postId}") // 후기게시판 후기글 페이지
	public String getReviewDetail(@PathVariable int postId, Model model) {
		
		postService.increasePostViews(postId); // 조회수 증가
		
		Post post = postService.findPostByPostId(postId); // postId에맞는 post객체 호출
		
		model.addAttribute("postList", post); // 호출된 post 표시
		
		List<Comment> commentList = commentService.findCommentListByPostId(postId); //postId에맞는 comment들 호출
		
		model.addAttribute("commentList", commentList); //comment들 표시
		
		ReviewImages reviewImages = postService.findReviewImagesByPostId(postId);
		
		model.addAttribute("reviewImages",reviewImages);
		
		return "boardpage/ReviewDetail"; // JSP 파일명
	}

	
	@PostMapping("/reviewDetail/{postId}/comment")
	public String saveReviewDetailComment(@PathVariable("postId") int postId,
											@RequestParam("content") String content,
											 @RequestParam("nickName") String nickName,
											 @RequestParam("userId") String userId,
											 @SessionAttribute(name = "loggedInUser", required = false) User loggedInUser) {
		
		if (loggedInUser == null) {
	        // 로그인되지 않으면 로그인 페이지로 리다이렉트
	        return "redirect:/user/login";
	    }
		
		int result = commentService.saveReviewDetailCommentByPostId(postId, content, nickName, userId);

		System.out.println("결과값:" + result);

		return "redirect:/reviewDetail/" + postId;
	}
	
	@PostMapping("/reviewDetail/{postId}/comment/delete")
	public String deleteReviewDetailComment(@PathVariable("postId") int postId,
											@RequestParam("commentId") int commentId ) {
		int result = commentService.deleteReviewDetailCommentByPostIdAndCommentId(postId, commentId);
		System.out.println(postId);
		System.out.println(commentId);
		System.out.println(result);
		return "redirect:/reviewDetail/" + postId;
	}
	

	@GetMapping("/writeReview")
	public String writeReview(HttpSession session, Model model) {
		Object loggedInUserObj = session.getAttribute("loggedInUser");

	    if (loggedInUserObj instanceof User) { // ✅ 안전한 타입 체크
	        User loggedInUser = (User) loggedInUserObj;
	        System.out.println("현재 로그인된 사용자: " + loggedInUser.getNickName());
	        model.addAttribute("loggedInUser", loggedInUser);
	    } else {
	        System.out.println("현재 로그인된 사용자가 없습니다.");
	    }
		return "boardpage/WriteReview";
	}
	

	@PostMapping("/saveWriteReview")
	public String saveWriteReview(	@RequestParam("boardId") int boardId,	
									@RequestParam("userId") String userId,
									@RequestParam("nickName") String nickName,
									@RequestParam("title") String title,
									@RequestParam("content") String content,
									@RequestParam(value = "reviewImage", required = false) MultipartFile reviewImage) {
		System.out.println("게시글유형(1:후기 2:질문) : " + boardId);
		try {
		        // 1️⃣ 게시글 저장 (RETURNING INTO로 postId 자동 설정)
		        Post post = new Post();
		        post.setBoardId(boardId);
		        post.setUserId(userId);
		        post.setNickName(nickName);
		        post.setTitle(title);
		        post.setContent(content);
		        
		        
		        postService.savePost(post); // postId 자동 저장됨
		        int postId = postService.getLastPostId();
		        
		        // 2️⃣ 이미지가 있을 경우 저장
		        if (reviewImage != null && !reviewImage.isEmpty()) {
		            // 파일명, 경로 등을 직접 처리
		            String originalFileName = reviewImage.getOriginalFilename();
		            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		            String fileName = UUID.randomUUID().toString() + "." + fileExtension; // 파일명 생성

		            // 파일 저장 경로 설정
		            String filePath = "d:/fileStorage/" + fileName; // 서버 저장 경로
		            String urlFilePath = "/fileStorage/" + fileName; // URL 경로

		            // 파일 저장
		            reviewImage.transferTo(new File(filePath)); // 실제 파일 저장

		            // ReviewImages 객체 생성하여 이미지 정보 설정
		            ReviewImages reviewImages = new ReviewImages();
		            reviewImages.setPostId(postId); // 게시글 ID 설정
		            reviewImages.setFileName(fileName);       // 저장된 파일명
		            reviewImages.setOriginalFileName(originalFileName); // 원본 파일명
		            reviewImages.setFilePath(filePath);       // 파일 저장 경로
		            reviewImages.setUrlFilePath(urlFilePath); // URL 경로
		            reviewImages.setFileExtension(fileExtension); // 파일 확장자
		            reviewImages.setUploadedAt(new Date());    // 업로드 시간 설정

		            // 이미지 정보 DB 저장
		            postService.saveReviewImage(reviewImages); // images 테이블에 저장
		            
		            post.setUrlFilePath(urlFilePath);  //이미지 urlfilepath 따온 후 post객체에 저장
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

	    return "redirect:/reviewBoard?boardId=1";
	}
	
	
	
	@GetMapping("/QnABoard") // 질문게시판 화면
	public String QnABoard(@RequestParam("boardId") int boardId, Model model) {
		List<Post> QnAPostList = postService.findPostListByBoardId(boardId); // boardId가 2인 질문게시글리스트 전체호출
		
		System.out.println("질문글 리스트:" + QnAPostList);

		model.addAttribute("QnAPostList", QnAPostList); // 화면에 표시

		return "boardpage/QnABoard";
	}
	
	@GetMapping("/writeQnA") // 질문글 작성 화면
	public String WriteQnA(HttpSession session, Model model) {
		Object loggedInUserObj = session.getAttribute("loggedInUser");
		
		if (loggedInUserObj instanceof User) { // ✅ 안전한 타입 체크
	        User loggedInUser = (User) loggedInUserObj;
	        System.out.println("현재 로그인된 사용자: " + loggedInUser.getNickName());
	        model.addAttribute("loggedInUser", loggedInUser);
	    } else {
	        System.out.println("현재 로그인된 사용자가 없습니다.");
	    }
		
		return "boardpage/WriteQnA";
	}
	
	@PostMapping("/saveWriteQnA")
	public String saveWriteQnA(		@RequestParam("boardId") int boardId,	
									@RequestParam("userId") String userId,
									@RequestParam("nickName") String nickName,
									@RequestParam("title") String title,
									@RequestParam("content") String content
									) {
		System.out.println("게시글유형(1:후기 2:질문) : " + boardId);
		Post post = new Post();
        post.setBoardId(boardId);
        post.setUserId(userId);
        post.setNickName(nickName);
        post.setTitle(title);
        post.setContent(content);
        
        postService.savePost(post);

	    return "redirect:/QnABoard?boardId=2";
	}
	
	@GetMapping("/QnADetail/{postId}") // 후기게시판 후기글 페이지
	public String getQnADetail(@PathVariable int postId, Model model) {
		
		postService.increasePostViews(postId); // 조회수 증가
		
		Post post = postService.findPostByPostId(postId); // postId에맞는 post객체 호출
		
		model.addAttribute("post", post); // 호출된 post 표시
		
		List<Comment> commentList = commentService.findCommentListByPostId(postId); //postId에맞는 comment들 호출
		
		model.addAttribute("commentList", commentList); //comment들 표시
		
		return "boardpage/QnADetail";
	}

	
	@PostMapping("/QnADetail/{postId}/comment")
	public String saveQnADetailComment(@PathVariable("postId") int postId,
											@RequestParam("content") String content,
											 @RequestParam("nickName") String nickName,
											 @RequestParam("userId") String userId,
											 @SessionAttribute(name = "loggedInUser", required = false) User loggedInUser) {
		
		if (loggedInUser == null) {
	        // 로그인되지 않으면 로그인 페이지로 리다이렉트
	        return "redirect:/user/login";
	    }
		
		int result = commentService.saveQnADetailCommentByPostId(postId, content, nickName, userId);

		System.out.println("결과값:" + result);

		return "redirect:/QnADetail/" + postId;
	}
	
	
	

}
