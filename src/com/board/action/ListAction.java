package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

/**
 * Created by Administrator on 14. 10. 17.
 */
public class ListAction implements CommandAction {
	
	// 한 페이지 당 보여줄 글 갯수
	private final static int pageSize = 4;
		
	// 페이지그룹안의 페이지 갯수
	//ex) [이전] 1 2 3 4 5 [다음] 일 경우 페이지 갯수는 5
	private final static int pageGroupSize = 3;
	 
    @Override
    public String requestPro(HttpServletRequest request,
                             HttpServletResponse reaponse) throws Throwable {
//Paging  	
//==============================================================================================
    	//페이지 번호
    	String pageNum = request.getParameter("pageNum");
    	 
    	if (pageNum == null) {
    	    pageNum = "1";
    	}
    	 
    	int currentPage = Integer.parseInt(pageNum);
    	//한 페이지의 시작글 번호
//    	int startRow = (currentPage - 1) * pageSize + 1;
    	//한 페이지의 마지막 글번호
//    	int endRow = currentPage * pageSize;
    	int totalArticlecount = 0;
    	int number = 0;
    	 
//    	ArrayList articleList = new ArrayList();
//    	BoardDAO dbPro = BoardDAO.getInstance();// DB연동
    	totalArticlecount = BoardDao.getInstance().selectTotalCount();// 전체 글의 수
    	 
//    	if (count > 0) {
//    	    if (endRow > count) {
//    	        endRow = count;
//    	    }
//    	     
//    	    // 현재 페이지에 해당하는 글 목록
//    	    articleList = dbPro.select(startRow, endRow);
//    	 
//    	} else {
//    	    articleList = null;
//    	}
    	 
    	//글목록에 표시할 글번호
//    	number = count - (currentPage - 1) * pageSize;
    	 
    	// 페이지그룹의 갯수
    	// ex) pageGroupSize가 3일 경우
    	//'[1][2][3]'가 pageGroupCount 개 만큼 있다.
    	int pageGroupCount =
    			totalArticlecount / (pageSize * pageGroupSize) +
    	    (totalArticlecount % (pageSize * pageGroupSize) == 0 ? 0 : 1);
    	// 페이지 그룹 번호
    	// ex) pageGroupSize가 3일 경우
    	//'[1][2][3]'의 페이지그룹번호는 1 이고 '[2][3][4]'의
    	// 페이지그룹번호는 2 이다.
    	int numPageGroup = (int) Math
    	        .ceil((double) currentPage / pageGroupSize);
    	 
    	// 해당 뷰에서 사용할 속성
    	request.setAttribute("currentPage", new Integer(currentPage));
//    	request.setAttribute("startRow", new Integer(startRow));
//    	request.setAttribute("endRow", new Integer(endRow));
    	request.setAttribute("count", new Integer(totalArticlecount));
    	request.setAttribute("pageSize", new Integer(pageSize));
    	 
    	request.setAttribute("number", new Integer(number));
    	request.setAttribute("pageGroupSize", new Integer(pageGroupSize));
    	request.setAttribute("numPageGroup", new Integer(numPageGroup));
    	request.setAttribute("pageGroupCount", new Integer(pageGroupCount));
//    	request.setAttribute("articleList", articleList);
    	 
//==============================================================================================
    	
    	int row = (Integer.parseInt(pageNum)-1)* pageSize;

        List<Board> articleList = BoardDao.getInstance().selectAll(row, pageSize);

        request.setAttribute("articleList", articleList);

        return "list.jsp";
    }
    
}
