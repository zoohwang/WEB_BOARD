package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class SelectArticleAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse reaponse) throws Throwable {
		int idx = Integer.parseInt(request.getParameter("idx"));
		Board article = BoardDao.getInstance().selectById(idx);

        request.setAttribute("article", article);

        return "content.jsp";
	}

}
