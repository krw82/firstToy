package test.toy.coin.Controller;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import test.toy.coin.common.Service.chartServiceIM;
import test.toy.coin.common.Service.testService;
import test.toy.coin.common.VO.RestUpbit_Vo;

@Controller
public class chartController {
	
	@Resource(name="chartService")
	chartServiceIM chart_ser;
	
	
	@RequestMapping("/chart")
	public String chart(Model model,@RequestParam("scale") int scale,@RequestParam("coin") String coin) throws IOException, ParseException {
		OkHttpClient client = new OkHttpClient();
		List<RestUpbit_Vo> list=new ArrayList<RestUpbit_Vo>() ;

		String url=chart_ser.getUrl(chart_ser.coinSelect(coin), scale);
		
		Request request = new Request.Builder()
				.url(url)
				.get()
				.addHeader("Accept", "application/json")
				.build();
		
		Response response = client.newCall(request).execute();
		ResponseBody body=response.body();
		JSONArray array =new JSONArray(body.string());
		
		Gson gson = new Gson();
		for(int i=array.length()-1; i>=0; i--) {
			JSONObject obb=(JSONObject)array.get(i);
			list.add(gson.fromJson(obb.toString(),RestUpbit_Vo.class));
		} 
		
		NewsController a1 =new NewsController(); 
		
		model.addAttribute("list",list);
		model.addAttribute("news", a1.News(chart_ser.coinKorea(coin)));
		model.addAttribute("coinSelect",chart_ser.coinSelect(coin));
		model.addAttribute("scalee",chart_ser.scaleString(scale));
		model.addAttribute("scaleNumber",scale);
		
		return "upbit";
	}
	
	
	
	
	

}
