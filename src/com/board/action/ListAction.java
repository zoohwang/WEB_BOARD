package com.board.action;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import com.board.beans.Board;
import com.board.controller.CommandAction;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class ListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse reaponse) throws Throwable {

        try{
            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/board";

            ResultSet rs = null;

            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url, "root", "2413");
            System.out.println("index page Success DB Connection");

            Statement stmt = con.createStatement();

            String sql = "select * from board order by idx desc";

            rs = stmt.executeQuery(sql);

            ArrayList<Board> articleList = new ArrayList<Board>();

            while(rs.next()) {
                Board article = new Board();
                article.setIdx(rs.getInt("idx"));
                article.setTitle(rs.getString("title"));
                article.setWriter(rs.getString("writer"));
                article.setRegdate(rs.getString("regdate"));
                article.setCount(rs.getInt("count"));
                articleList.add(article);
            }

            request.setAttribute("articleList", articleList);

            con.close();
        }catch(Exception e) {
            System.out.println("DB Connection Error");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return "list.jsp";
    }
}
