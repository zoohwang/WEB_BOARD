package com.board.dao;

import java.beans.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.beans.Board;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class BoardDao extends CommonDao {

    public static BoardDao getInstance() {

        BoardDao _instance = new BoardDao();

        return _instance;
    }

    /**
     * 선택된 페이지의 게시물을 DB에서 조회 한다.
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<Board> selectAll(int pageNum, int pageSize) {
        List<Board> list = null;
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);

        try {
            list = session.selectList("Board.selectAll", params);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    /**
     * 전체 게시물의 수를 조회한다.
     * @return
     */
    public int selectTotalCount() {
    	return session.selectOne("Board.selectByTotalCount");
    }
    
    /**
     * 선택된 게시물(한개)의 내용을 조회한다.
     * @param idx
     * @return
     */
    public Board selectById(int idx) {
    	Board article = new Board();
    	try {
            article = session.selectOne("Board.selectById", idx);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
		return article;
    }
    
    /**
     * 사용자가 입력한 게시물을 DB에 추가한다.
     * @param board
     */
    public void insert(Board board) {
    	try {
    		session.insert("Board.insert", board);
    	} catch(Exception e) {
    		 e.printStackTrace();
    	} finally {
    		session.commit();
    		session.close();
    	}
    }
    
    /**
     * 개시글의 조회수를 업데이트 한다.(1증가)
     */
    public void setArticleCount(Board board) {
    	try{
    		session.update("setArticleCount", board);
    	} catch(Exception e) {
    		 e.printStackTrace();
    	} finally {
    		session.commit();
    		session.close();
    	}
    }
}
