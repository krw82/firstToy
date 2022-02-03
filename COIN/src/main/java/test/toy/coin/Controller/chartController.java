package test.toy.coin.Controller;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
import test.toy.coin.common.VO.RestUpbit_Vo;

@Controller
public class chartController {
	@RequestMapping("/chart")
	public String chart(Model model,@RequestParam("scale") int a,@RequestParam("coin") String coin) throws IOException, ParseException {
		OkHttpClient client = new OkHttpClient();
		List<RestUpbit_Vo> list=new ArrayList<RestUpbit_Vo>() ;
		String urlcoin=null;
		String scalee=null;
		int scaleNumber=0;
		if(coin.equals("비트코인")||coin.equals("KRW-BTC")) {
			urlcoin="KRW-BTC";
		}
		else if(coin.equals("이더리움")||coin.equals("KRW-ETH")) {
			urlcoin="KRW-ETH";
		}
		else if(coin.equals("리플")||coin.equals("KRW-XRP")) {
			urlcoin="KRW-XRP";
		}
		Gson gson = new Gson();
		String url;
		if(a<80000) {
			url="https://api.upbit.com/v1/candles/minutes/"+a/60+"?market="+urlcoin+"&count=20";
			if(a==60)scalee="1분봉"; scaleNumber=60;
			if(a==300)scalee="5분봉";scaleNumber=300;
			if(a==900)scalee="15분봉";scaleNumber=900;
			if(a==3600)scalee="1시간봉";scaleNumber=3600;
			if(a==14400)scalee="4시간봉";scaleNumber=14400;
			
		}
		else if(a==86400) {
			url="https://api.upbit.com/v1/candles/days?market="+urlcoin+"&count=20";
			scalee="일봉";
			scaleNumber=86400;
		}
		else {
			url="https://api.upbit.com/v1/candles/weeks?market="+urlcoin+"&count=20";
			scalee="주봉";
			scaleNumber=604800;
		}
		
		System.out.println(url);
	
		Request request = new Request.Builder()
				.url(url)
				.get()
				.addHeader("Accept", "application/json")
				.build();
		
		Response response = client.newCall(request).execute();
	
		
		ResponseBody body=response.body();
		
		
		JSONArray array =new JSONArray(body.string());
	
		for(int i=array.length()-1; i>=0; i--) {
			JSONObject obb=(JSONObject)array.get(i);
			list.add(gson.fromJson(obb.toString(),RestUpbit_Vo.class));
		} 
		
		NewsController a1 =new NewsController(); //컨트롤러는 아니지만 일단 이름은 이렇게 지음. 추후에 수정 예정
		model.addAttribute("list",list);
		model.addAttribute("news", a1.News(coin));
		model.addAttribute("coinSelect",urlcoin);
		model.addAttribute("scalee",scalee);
		model.addAttribute("scaleNumber",scaleNumber);
		
		return "upbit";
	}
	
	
	
	
	

}
