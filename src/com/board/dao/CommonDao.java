package com.board.dao;

import com.board.db.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.*;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class CommonDao {

    private SqlSessionFactory sqlSessionFactory = null;
    SqlSession session = null;

    public CommonDao() {
        this.sqlSessionFactory = MybatisConnectionFactory.getSqlSessionFactory();
        session = sqlSessionFactory.openSession();
    }

}
