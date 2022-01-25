package test.toy.coin.common.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.toy.coin.common.VO.COIN_board_VO;
import test.toy.coin.common.VO.memberVo;
@Repository("crudDao")
public class crudDao {
	
	protected Log log = LogFactory.getLog(crudDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	 private static String namespace = "test.toy.coin.sqlMapper.AdminMember_SQL";

	
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public void member_create (memberVo membervo){
		 sqlSession.insert("Utils.insertMEMBER",membervo);
		
	}
	
	public List<Object> select_board() {
		return  (List<Object>) sqlSession.selectList("Utils.selectBoard");
	}
	
	public String login(String ID) {
		return sqlSession.selectOne("Utils.login", ID);
	}
	
	public memberVo selectMember(String ID) {
		return sqlSession.selectOne("Utils.selectMember", ID);
	}
	
	public void createBoard(COIN_board_VO coin_board_vo) {
		 sqlSession.insert("Utils.insertBoard", coin_board_vo);
	}
	
}
