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
    
    public int selectTotalCount() {
    	return session.selectOne("Board.selectByTotalCount");
    }
    
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
}
