package com.jmt.indiego.cotroller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jmt.indiego.service.AbChoiceService;
import com.jmt.indiego.service.AbTestService;
import com.jmt.indiego.util.FileRenameUtil;
import com.jmt.indiego.vo.AbChoice;
import com.jmt.indiego.vo.AbTest;
import com.jmt.indiego.vo.User;

@Controller
public class AbTestController {
	private AbTestService abTestService;
	private AbChoiceService abChoiceService;
	private FileRenameUtil fileRenameUtil;
	
	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}
	
	public void setAbTestService(AbTestService abTestService) {
		this.abTestService = abTestService;
	}

	public void setAbChoiceService(AbChoiceService abChoiceService) {
		this.abChoiceService = abChoiceService;
	}
	
	@RequestMapping(value="/abTest/main",method=RequestMethod.GET)
	public String abTestmain(Model model, HttpSession session) {
		model.addAttribute("nearClosing",abTestService.showNearClosing());
		model.addAttribute("onGoing",abTestService.showOnGoingEvent());
		User user = (User) session.getAttribute("loginUser");
		if(user!=null) {
			System.out.println(user.getUserNo());
			model.addAttribute("iVoted",abTestService.showIVoted(user.getUserNo()));
			model.addAttribute("myAbTest",abTestService.showMyAbTest(user.getUserNo()));
		}
		return "abTest_main_page";
	}
	
	@RequestMapping(value="/ajax/abTest/main/page/{pageNo}"
			,method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,Object> getIndexContents(@PathVariable int pageNo) {
		return abTestService.getAllAbTest(pageNo);
	}
	
	@RequestMapping(value="/abTest/upload",
			method=RequestMethod.GET)
	public String writeForm() {
		
		return "abTest_upload";
	}
	
	@RequestMapping(value="/abTest/{no}/detail",
			method=RequestMethod.GET)
	public String detail(Model model, @PathVariable int no, 
			HttpSession session) {
		System.out.println("GET : test " + no);
		model.addAttribute("abTestResult",abTestService.showOne(no));
		
		
		String flag = "C";
		
		User user = (User) session.getAttribute("loginUser");
		
		if(user!=null) {
			AbChoice abChoice = new AbChoice();
			abChoice.setUserNo(user.getUserNo());
			abChoice.setContentsNo(no);
			flag = abChoiceService.chosen(abChoice);
		}//if end
		
		model.addAttribute("chosen",flag);
		System.out.println(no);
		model.addAttribute("resultA",abChoiceService.resultA(no));
		model.addAttribute("resultB",abChoiceService.resultB(no));
		model.addAttribute("finished",abTestService.finishedAbTest(no));
		return "abTest_detail";
	}
	
	
	@RequestMapping(value="/abTest/upload",
			method=RequestMethod.POST)
	public String upload(AbTest abTest, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		abTest.setUserNo(user.getUserNo());
		boolean result = abTestService.addAbTest(abTest);
		System.out.println(result);
		return "redirect:/abTest/"+abTest.getNo()+"/detail";
	}
	
	
	// json view
	// model no needed
	@RequestMapping(value="/ajax/image/upload",
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String uploadImg(MultipartFile image,
			HttpServletRequest request) { // 폼의 name과 같게
		System.out.println("POST /upload");
		System.out.println(image);
		
		// WAS경로
		String rootPath = request.getServletContext().getRealPath("/");
		
//		System.out.println(rootPath);
		
		String uploadPath = rootPath + "img" + File.separator + "abTest" + File.separator;
		System.out.println(uploadPath);
		
		String fileName = image.getOriginalFilename();

		// 파일업로드는 되어있지만 임시디렉토리입니다.
		System.out.println(fileName);
		
		// 이동할 파일
		File file = new File(uploadPath+fileName);

		// 그리고 같은 이름이 있을경우 처리도 해야 합니다.
		file=fileRenameUtil.rename(file);
		
		try {
			// 우리가 원하는 폴더로 이동해야 합니다.
			// 파일이동
			image.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} // try~catch end
		
		return "{\"src\":\""+file.getName()+"\"}"; 
	}
	
	@RequestMapping(value="/abChoice/AB",
			method=RequestMethod.POST)
	public String chooseAB(AbChoice abChoice, HttpSession session) {
		
		System.out.println("chooseAB");
		User user = (User) session.getAttribute("loginUser");
		abChoice.setUserNo(user.getUserNo());
		int result=	abChoiceService.addChoice(abChoice);
		System.out.println(result);
		return "redirect:/abTest/main";
	}
	
	
	@RequestMapping(value="/abChoice/edit",
			method=RequestMethod.PUT)
	public String updateChoice(AbChoice abChoice, HttpSession session) {
		System.out.println("chooseAB");
		User user = (User) session.getAttribute("loginUser");
		abChoice.setUserNo(user.getUserNo());
		System.out.println(user.getUserNo());
		System.out.println(abChoice.getChoice());
		System.out.println(abChoice.getContentsNo());
		boolean result=	abChoiceService.editChoice(abChoice);
		System.out.println(result);
		return "redirect:/abTest/main";
	}
	
}
