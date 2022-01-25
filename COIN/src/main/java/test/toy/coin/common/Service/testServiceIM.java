package test.toy.coin.common.Service;

import java.util.List;

import test.toy.coin.common.VO.COIN_board_VO;
import test.toy.coin.common.VO.memberVo;

public interface testServiceIM {
	
	public void coin_member(memberVo membervo);
	
	public List<Object> select_board();
	
	public String login(String ID);
	
	public memberVo selectMember(String ID);
	
	public void createBoard(COIN_board_VO coin_vo);
	
	public COIN_board_VO board_Detail(int board_number);
	
	public void BOARD_COUNT(int board_number);
	
	public void board_Update(COIN_board_VO coin_vo);
	
	public void board_Delete(int board_number);

}
