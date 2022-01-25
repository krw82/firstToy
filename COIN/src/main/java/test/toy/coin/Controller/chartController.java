package test.toy.coin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chartController {
	@RequestMapping("/chart")
	public String chart() {
		return "chart/chartt";
	}

}
