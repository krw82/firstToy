package test.toy.coin.common.VO;

import com.google.gson.annotations.SerializedName;

public class RestUpbit_Vo {
	@SerializedName("market")
	String market;
	
	@SerializedName("candle_date_time_kst")
	String candle_date_time_kst;
	
	@SerializedName("opening_price")
	double opening_price;
	
	@SerializedName("high_price")
	double high_price;
	
	@SerializedName("low_price")
	double low_price;
	
	@SerializedName("trade_price")
	double trade_price;
	
	@SerializedName("first_day_of_period")
	String first_day_of_period;
	
	public String getMarket() {
		return market;
	}
	public void setMarket(String market) {
		this.market = market;
	}
	public String getCandle_date_time_kst() {
		return candle_date_time_kst;
	}
	public void setCandle_date_time_kst(String candle_date_time_kst) {
		this.candle_date_time_kst = candle_date_time_kst;
	}
	public double getOpening_price() {
		return opening_price;
	}
	public void setOpening_price(double opening_price) {
		this.opening_price = opening_price;
	}
	public double getHigh_price() {
		return high_price;
	}
	public void setHigh_price(double high_price) {
		this.high_price = high_price;
	}
	public double getLow_price() {
		return low_price;
	}
	public void setLow_price(double low_price) {
		this.low_price = low_price;
	}
	public double getTrade_price() {
		return trade_price;
	}
	public void setTrade_price(double trade_price) {
		this.trade_price = trade_price;
	}
	public String getFirst_day_of_period() {
		return first_day_of_period;
	}
	public void setFirst_day_of_period(String first_day_of_period) {
		this.first_day_of_period = first_day_of_period;
	}
}
