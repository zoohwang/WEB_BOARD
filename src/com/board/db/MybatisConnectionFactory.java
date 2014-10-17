package com.board.db;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class MybatisConnectionFactory {

    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            String resource = "com/board/db/config.xml";
            Reader reader = Resources.getResourceAsReader(resource);

            if (sqlSessionFactory == null) {
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            }
        } catch (FileNotFoundException fileNotFoundException) {
            fileNotFoundException.printStackTrace();
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }

    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }


}
