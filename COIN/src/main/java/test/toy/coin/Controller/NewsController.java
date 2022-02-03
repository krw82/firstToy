package test.toy.coin.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.parser.ParseException;


import com.google.gson.Gson;

import test.toy.coin.common.VO.news_VO;


public class NewsController {
	
	 private final static String CLIENT_ID = "HxPQSDOpp0T1YAdFjxU6";
	 private final static String CLIENT_SECRET = "vFqkvuzmiD";
	 
	 
	 
	  public List News(String search) throws ParseException {
		
	        String text = null;
	        try {
	            text = URLEncoder.encode(search, "UTF-8");
	        } catch (Exception e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }


	        String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text;    // json 결과
	        


	        Map<String, String> requestHeaders = new HashedMap();
	        requestHeaders.put("X-Naver-Client-Id",CLIENT_ID);
	        requestHeaders.put("X-Naver-Client-Secret", CLIENT_SECRET);
	        String responseBody = get(apiURL,requestHeaders);
	        
	        
	        Gson gson = new Gson();
	        news_VO VO=gson.fromJson(responseBody,news_VO.class);
	        
	       return VO.getItems();
	        
	       
	  }

	       
	 
	 
	
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
	
	 private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	 
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출	            	
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


}
