package com.board.dao;

import java.sql.*;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class CommonDao {

    //DB 접속에 공통적으로 사용되는 정보들을 상수로 선언.
    private final String driverName = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/board";
    private final String db_id = "root";
    private final String db_pw = "2413";
    private Connection con = null;
    private Statement stmt = null;

    //DB 접속 후 SQL문을 사용하기 위해 필요한 statement객체를 반환하는 method.
    public Statement openConnection() {

        try{
            Class.forName(driverName);
            con = DriverManager.getConnection(url, db_id, db_pw);
            stmt = con.createStatement();
        } catch(Exception e) {
            System.out.println("DB Connection Error");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return stmt;
    }

    //DB 접속 종료
    public void closeConnection() {
        try{
            if(!con.isClosed())
                con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
