package test.toy.coin.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import test.toy.coin.common.Service.testService;
import test.toy.coin.common.VO.COIN_board_VO;
import test.toy.coin.common.VO.memberVo;

@Controller
public class crudController {
	@Resource(name="test")
	testService test;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)

	public String login(HttpServletRequest reqeust) {
		HttpSession session = reqeust.getSession();
		if(session.getAttribute("VO")!=null) {
			return "redirect:/board";
		}
		
		return "login/login";
	}
	//login ajax
	@RequestMapping(value="/loginAJ",method=RequestMethod.GET)
	public ModelAndView login(@RequestParam("ID") String id,@RequestParam("PASSWORD") String password) {
		ModelAndView mv = new ModelAndView("jsonView");
		String sql_password=test.login(id);
		if(sql_password==null) {
			mv.addObject("login_check",0);
			return mv;
		}
		
		else if(password.equals(sql_password)) {
			mv.addObject("login_check",1);
		}
		else {
			mv.addObject("login_check",0);
		}
		

				return mv;
	}
	
	@RequestMapping(value="/login/success",method=RequestMethod.POST)
	public String success(HttpServletRequest request,@RequestParam("ID") String id) {
		HttpSession session =request.getSession();
		session.setAttribute("VO",test.selectMember(id));
		
		
		return "redirect:/board";
	}
	
	
	
	
	//회원가입창
	@RequestMapping(value="/memberCreate",method=RequestMethod.GET)

	public String member_create() {
		
		return "login/create";
	}
	
	
	@RequestMapping(value="/memberCreate",method=RequestMethod.POST)

	public String member_action_create(Model model,@ModelAttribute memberVo memvbervo) {
		System.out.println(memvbervo.getMONEY()+"ㅁㄴㅇㄴㅁㅇㄴㅁㅇㄴ");
		test.coin_member(memvbervo);
		return "login/login";
	}
	
	
	
	@RequestMapping(value="/board",method=RequestMethod.GET)

	public String allBoard(Model model) {
		
		model.addAttribute("list",test.select_board());
		
		return "CRUD/READ";
	}
	
	//
	@RequestMapping(value="/create",method=RequestMethod.GET)

	public String board_Create(Model model,@ModelAttribute COIN_board_VO vo) {
		
		return "CRUD/create";
	}
	@RequestMapping(value="/create",method=RequestMethod.POST)

	public String board_Createe(HttpServletRequest request,@ModelAttribute COIN_board_VO vo) {
		HttpSession session = request.getSession();
		
		
		String id =((memberVo)session.getAttribute("VO")).getID();
		System.out.println(id+"ididididididid");
		vo.setID(id);
		test.createBoard(vo);
		return "CRUD/READ";
	}
	
	
	

}
