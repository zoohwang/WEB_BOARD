package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse reaponse) throws Throwable {
		
		request.setCharacterEncoding("euc-kr");
		
		//
		//파일 업로드
		//
		MultipartRequest  multi = null;
		
		int sizeLimit = 10 * 1024 * 1024; //10MB
		
		String savePath = request.getRealPath("/upload");// 파일업로드 경로(WebContent 기준)
		
		try{
			multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String filename = multi.getFilesystemName("filename");
		
		Board board = new Board();
		
		board.setTitle(multi.getParameter("title"));
		board.setWriter(multi.getParameter("writer"));
		board.setRegdate(multi.getParameter("regdate"));
		board.setContent(multi.getParameter("content"));
		board.setRegip(request.getRemoteAddr());
		board.setFilename(filename);
		
		BoardDao.getInstance().insert(board);
		
		return "list.do";
	}

}
