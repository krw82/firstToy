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
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)

	public String loginOut(HttpServletRequest reqeust) {
		HttpSession session = reqeust.getSession();
		session.removeAttribute("VO");
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
		
		return "login/memberCreate";
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
		
		return "CRUD/board";
	}
	
	//게시글 작성
	@RequestMapping(value="/create",method=RequestMethod.GET)

	public String board_Create(Model model,@ModelAttribute COIN_board_VO vo) {
		
		return "CRUD/create";
	}
	
	@RequestMapping(value="/create",method=RequestMethod.POST)

	public String board_Createe(HttpServletRequest request,@ModelAttribute COIN_board_VO vo) {
		HttpSession session = request.getSession();
		String id =((memberVo)session.getAttribute("VO")).getID();
		vo.setID(id);
		test.createBoard(vo);
		return "redirect:/board";
	}
	//게시글 상세보기
	@RequestMapping(value="/READ",method=RequestMethod.GET)
	
	public String board_READ(Model model,@RequestParam("BOARD_NUMBER") int BOARD_NUMBER) {
		test.BOARD_COUNT(BOARD_NUMBER);
		model.addAttribute("model",test.board_Detail(BOARD_NUMBER));
		return "CRUD/READ";
	}
	//게시글수정
	@RequestMapping(value="/UPDATE",method=RequestMethod.GET)
	
	public String board_UPDATE(Model model,@RequestParam("BOARD_NUMBER") int BOARD_NUMBER) {
		model.addAttribute("model",test.board_Detail(BOARD_NUMBER));
		return "CRUD/UPDATE";
	}
	
	@RequestMapping(value="/UPDATE",method=RequestMethod.POST)
	public String board_UPDATEE(@RequestParam("BOARD_NUMBER") int BOARD_NUMBER,@ModelAttribute COIN_board_VO vo) {
		vo.setBOARD_NUMBER(BOARD_NUMBER);
		test.board_Update(vo);
		
		return "redirect:/READ?BOARD_NUMBER="+BOARD_NUMBER;
		
	}
	
	@RequestMapping(value="/DELETE",method=RequestMethod.GET)
	public String board_DELETE(@RequestParam("BOARD_NUMBER") int BOARD_NUMBER) {
		test.board_Delete(BOARD_NUMBER);
		return "redirect:/board";
		
	}
	
	//세션id 값과 현재 게시물 작성자와 동일한지 여부 체크 겸 세션 id있는지 없는 확인용
	
	@RequestMapping(value="/IDCHECK/ajax",method=RequestMethod.GET)
	public ModelAndView session_IDcheck(HttpServletRequest reqeust, HttpSession session) {
		
		
		ModelAndView mv = new ModelAndView("jsonView");
		String create_check=reqeust.getParameter("CREATE");
		System.out.println(((memberVo)session.getAttribute("VO")));
		
		if(((memberVo)session.getAttribute("VO"))==null) {
			mv.addObject("ID_CHECK",0);
			return mv;
		}
		if(create_check!=null) {
			mv.addObject("ID_CHECK",1);
			
			return mv;
			
			
		}
		String session_id=((memberVo)session.getAttribute("VO")).getID();
		
		
		 if(reqeust.getParameter("ID").equals(session_id)) {
		
			mv.addObject("ID_CHECK",1);
		}
		else {
			mv.addObject("ID_CHECK",0);
		}
		return mv;
		
	}
	
	
	
	

}
