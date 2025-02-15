package com.app.controller.board;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.dto.review.Comment;
import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;
import com.app.service.file.FileService;
import com.app.service.review.post.PostService;
import com.app.service.review.reviewDetail.comment.CommentService;
import com.app.service.user.UserService;


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
	

	@GetMapping("/reviewBoard") // 후기게시판 화면
	public String board(Model model) {
		List<Post> postList = postService.findPostList(); // 게시글리스트 전체호출
		

		System.out.println("포스트리스트:" + postList);

		model.addAttribute("postList", postList); // 화면에 표시

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
											 @RequestParam("userId") String userId) {
		
		int result = commentService.saveReviewDetailCommentByPostId(postId, content, nickName, userId);

		System.out.println("결과값:" + result);

		return "redirect:/reviewDetail/" + postId;
	}
	

	@GetMapping("/writeReview")
	public String writeReview(Model model) {
		
		return "boardpage/WriteReview";
	}
	

	@PostMapping("/saveWriteReview")
	public String saveWriteReview(@RequestParam("userId") String userId,
									@RequestParam("nickName") String nickName,
									@RequestParam("title") String title,
									@RequestParam("content") String content,
									@RequestParam(value = "reviewImage", required = false) MultipartFile reviewImage) {
		
		
		try {
		        // 1️⃣ 게시글 저장 (RETURNING INTO로 postId 자동 설정)
		        Post post = new Post();
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
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

	    return "redirect:/reviewBoard/";
	}

}
