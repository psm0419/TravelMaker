package com.app.controller.home;

import java.io.File;
import java.io.IOException;
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

import com.app.dto.festival.Festival;
import com.app.dto.review.Comment;
import com.app.dto.review.Post;
import com.app.service.festival.FestivalService;
import com.app.service.file.FileService;
import com.app.service.review.post.PostService;
import com.app.service.review.reviewDetail.comment.CommentService;

@Controller
public class HomeController {

	@Autowired
	FestivalService festivalService;

	@Autowired
	PostService postService;

	@Autowired
	CommentService commentService;
	
	@Autowired
	FileService fileService;

	@GetMapping("/") // 홈 화면
	public String home(Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();

		System.out.println(festivalList);

		model.addAttribute("festivalList", festivalList);

		return "mainpage/MainPage";
	}

	@GetMapping("/reviewboard") // 후기게시판 화면
	public String board(Model model) {
		List<Post> postList = postService.findPostList();

		System.out.println(postList);

		model.addAttribute("postList", postList);

		return "boardpage/ReviewBoard";
	}

//	@GetMapping("/reviewdetail")
//	public String reviewDetail(Model model) {
//		Post post = postService.findPostByUserId("유저아이디");
//		
//		System.out.println(post);
//		
//		model.addAttribute("postList",post);
//		
//		return "boardpage/ReviewDetail";
//	}

	@GetMapping("/reviewdetail/{postId}") // 후기게시판 후기글 페이지
	public String getReviewDetail(@PathVariable int postId, Model model) {
		postService.increasePostViews(postId); // 조회수 증가

		Post post = postService.findPostByPostId(postId);

		List<Comment> commentList = commentService.findCommentListByPostId(postId);

		System.out.println(post);
		System.out.println(commentList);

		model.addAttribute("postList", post);
		model.addAttribute("commentList", commentList);
		return "boardpage/ReviewDetail"; // JSP 파일명
	}

	@PostMapping("/reviewdetail/{postId}/comment")
	public String saveReviewDetailComment(@PathVariable("postId") int postId, @RequestParam("content") String content) {

		int result = commentService.saveReviewDetailComment(postId, content);

		System.out.println(result);

		return "redirect:/reviewdetail/" + postId;
	}

	@GetMapping("/writereview")
	public String writeReview() {

		return "boardpage/WriteReview";
	}

	@PostMapping("/savewritereview")
	public String savePost(@RequestParam String title, @RequestParam String content,
			@RequestParam(required = false) MultipartFile reviewImage, @RequestParam int boardId,
			@RequestParam String userId, @RequestParam String nickName) {

		Post post = new Post();
		post.setTitle(title);
		post.setContent(content);
		post.setBoardId(boardId);
		post.setUserId(userId);
		post.setNickName(nickName);
		post.setCreatedAt(new Date()); // 생성 날짜는 서버에서 현재 날짜로 설정
		post.setPostLike(0); // 기본값은 0
		post.setPostViews(0); // 기본값은 0
		post.setStatus(1); // 예를 들어 기본값을 '일반글'로 설정
		post.setReport("N"); // 기본값은 신고되지 않음

		// 이미지 파일이 업로드된 경우 처리
		if (reviewImage != null && !reviewImage.isEmpty()) {
			String imagePath = saveImage(reviewImage); // 이미지 저장 로직
			post.setImages(imagePath); // 저장된 이미지 경로를 set
			System.out.println(imagePath);
		}

		postService.savePost(post);
		
		

		return "redirect:/reviewboard/";
	}			

	private String saveImage(MultipartFile image) {
        try {
        	// 랜덤한 파일 이름 생성 (UUID)
            String fileExtension = getFileExtension(image.getOriginalFilename()); // 파일 확장자 추출
            String randomFileName = UUID.randomUUID().toString() + fileExtension; // 랜덤 이름 + 확장자

            // 파일 저장 경로 설정
            File targetFile = new File("d:/fileStorage/", randomFileName);
            System.out.println(randomFileName);

            // 이미지를 해당 경로에 저장
            image.transferTo(targetFile);

            return targetFile.getAbsolutePath(); // 저장된 파일의 절대 경로 반환
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	// 파일 확장자 추출 메서드
    private String getFileExtension(String fileName) {
        if (fileName != null && fileName.lastIndexOf('.') > 0) {
            return fileName.substring(fileName.lastIndexOf('.'));
        }
        return ""; // 확장자가 없을 경우 빈 문자열 반환
    }
    
    
}
