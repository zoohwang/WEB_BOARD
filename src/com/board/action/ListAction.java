package com.board.action;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class ListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request,
                             HttpServletResponse reaponse) throws Throwable {

        List<Board> articleList = BoardDao.getInstance().selectAll();

        request.setAttribute("articleList", articleList);

        return "list.jsp";
    }
}
