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

//    public ArrayList<Board> getArticleList() throws SQLException {
//
//        ResultSet rs = null;
//
//        String sql = "select * from BOARD order by idx desc";
//
//        rs = openConnection().executeQuery(sql); // sql을 실행하기위해 연결을 열어 쿼리를 실행하고
//
//        // rs에 반환합니다.
//
//        ArrayList<Board> articleList = new ArrayList<Board>();//  Board형 배열객체를 선언
//
//        while (rs.next()) {
//            Board article = new Board();// 데이터들을 담기위해 Board객체에 메모리를 할당
//
//            article.setIdx(rs.getInt("idx"));
//            article.setTitle(rs.getString("title"));
//            article.setWriter(rs.getString("writer"));
//            article.setRegdate(rs.getString("regdate"));
//
//            articleList.add(article);// 셋팅된 빈을 리스트에 추가합니다.
//        }
//
//        closeConnection(); // 연결을 꼭 닫아줍시다.
//
//        return articleList;
//
//    }
}
