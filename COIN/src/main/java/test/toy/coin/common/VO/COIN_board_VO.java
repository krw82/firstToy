package test.toy.coin.common.VO;

import java.util.Date;

public class COIN_board_VO {
	
	int BOARD_NUMBER;
	String BOARD_TITLE;
	String ID;
	Date BOARD_DATE;
	int BOARD_COUNT;
	int BOARD_GOOD;
	int BOARD_BAD;
	String BOARD_CONTENT;
	int BOARD_IDX;
	public int getBOARD_NUMBER() {
		return BOARD_NUMBER;
	}
	public void setBOARD_NUMBER(int bOARD_NUMBER) {
		BOARD_NUMBER = bOARD_NUMBER;
	}
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public int getBOARD_COUNT() {
		return BOARD_COUNT;
	}
	public void setBOARD_COUNT(int bOARD_COUNT) {
		BOARD_COUNT = bOARD_COUNT;
	}
	public int getBOARD_GOOD() {
		return BOARD_GOOD;
	}
	public void setBOARD_GOOD(int bOARD_GOOD) {
		BOARD_GOOD = bOARD_GOOD;
	}
	public int getBOARD_BAD() {
		return BOARD_BAD;
	}
	public void setBOARD_BAD(int bOARD_BAD) {
		BOARD_BAD = bOARD_BAD;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public int getBOARD_IDX() {
		return BOARD_IDX;
	}
	public void setBOARD_IDX(int bOARD_IDX) {
		BOARD_IDX = bOARD_IDX;
	}
	

}


/*create table COIN_board(
board_number number PRIMARY KEY,
board_title varchar2(20) not null,
ID varchar2(20) ,
board_date date not null ,
board_count number not null,
board_good number not null,
board_bad number not null,
board_content varchar(3000),
board_IDX NUMBER,
CONSTRAINT FK_MEMBER FOREIGN KEY (ID) REFERENCES COIN_MEMBER(ID) on delete cascade
);*/