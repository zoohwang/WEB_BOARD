package com.board.dao;

import java.beans.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.beans.Board;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class BoardDao extends CommonDao {

    public static BoardDao getInstance() {

        BoardDao _instance = new BoardDao();

        return _instance;
    }

    public List<Board> selectAll() {
        List<Board> list = null;

        try {
            list = session.selectList("Board.selectAll");
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
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
