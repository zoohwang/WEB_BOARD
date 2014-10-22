package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class InsertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse reaponse) throws Throwable {
		
		Board board = new Board();
		
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setRegdate(request.getParameter("regdate"));
		board.setContent(request.getParameter("content"));
		board.setRegip(request.getRemoteAddr());
		
		BoardDao.getInstance().insert(board);
		
		return "list.do";
	}

}
