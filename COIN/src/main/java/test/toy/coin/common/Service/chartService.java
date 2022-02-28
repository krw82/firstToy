package test.toy.coin.common.Service;

public interface chartService {

	public String coinSelect(String coinName); //코인 심볼
	public String getUrl(String coinName,int scale);
	public String scaleString(int scale); // 몇분봉인지 한국말 리턴
	public String coinKorea(String coinName);// 코인한국말
	
}
