package test.toy.coin.common.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test.toy.coin.common.VO.COIN_board_VO;
import test.toy.coin.common.VO.memberVo;
import test.toy.coin.common.dao.crudDao;
@Service("test")
public class testService implements testServiceIM{
	
	@Resource(name="crudDao")
	private crudDao Dao;
	
	
	@Override
	public void coin_member(memberVo membervo) {
		// TODO Auto-generated method stub
		Dao.member_create(membervo);
	}


	@Override
	public List<Object> select_board() {
		// TODO Auto-generated method stub
		return (List<Object>) Dao.select_board();
	}


	@Override
	public String login(String ID) {
		// TODO Auto-generated method stub
		return Dao.login(ID);
	}


	@Override
	public memberVo selectMember(String ID) {
		// TODO Auto-generated method stub
		return Dao.selectMember(ID);
	}


	@Override
	public void createBoard(COIN_board_VO coin_vo) {
		// TODO Auto-generated method stub
		Dao.createBoard(coin_vo);
		
	}




	
	
}
