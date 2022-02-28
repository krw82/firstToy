package test.toy.coin.common.Service;

import org.springframework.stereotype.Service;

@Service("chartService")
public class chartServiceIM implements chartService{

	@Override
	public String coinSelect(String coinName) {
		// TODO Auto-generated method stub
		if(coinName.equals("비트코인")||coinName.equals("KRW-BTC")) {
			return "KRW-BTC";
		}
		else if(coinName.equals("이더리움")||coinName.equals("KRW-ETH")) {
			return "KRW-ETH";
		}
		else if(coinName.equals("리플")||coinName.equals("KRW-XRP")) {
			return "KRW-XRP";
		}
		// 코인이 더필요할경우 여기에다가 추가하면 끝;
		
		return null;
	}
	
	@Override
	public String coinKorea(String coinName) {
		// TODO Auto-generated method stub
		
		if(coinName.equals("비트코인")||coinName.equals("KRW-BTC")) {
			return "비트코인";
		}
		else if(coinName.equals("이더리움")||coinName.equals("KRW-ETH")) {
			return "이더리움";
		}
		else if(coinName.equals("리플")||coinName.equals("KRW-XRP")) {
			return "리플";
		}
		// 코인이 더필요할경우 여기에다가 추가하면 끝;
		// 뉴스에 심볼로 할경우 검색이 안됨. 한국말로 쳐야함
		
		
		return null;
	}

	@Override
	public String getUrl(String coinName, int scale) {
		// TODO Auto-generated method stub
		String url;
		if(scale<80000) {
			url="https://api.upbit.com/v1/candles/minutes/"+scale/60+"?market="+coinName+"&count=100";
		}
		else if(scale==86400) {
			url="https://api.upbit.com/v1/candles/days?market="+coinName+"&count=100";
			
		}
		else {
			url="https://api.upbit.com/v1/candles/weeks?market="+coinName+"&count=100";
		}
		
		return url;
	}

	@Override
	public String scaleString(int scale) {
		// TODO Auto-generated method stub
		if(scale==60) {return "1분봉"; }
		if(scale==300) {return "5분봉";}
		if(scale==900) {return "15분봉";}
		if(scale==3600) {return "1시간봉";}
		if(scale==14400) {return "4시간봉";}
		if(scale==86400) {return "일봉";}
		if(scale==604800) {return "주봉";}
		
		return null;
		
	}

	

}
