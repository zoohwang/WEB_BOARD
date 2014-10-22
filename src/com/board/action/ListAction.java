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
	
	// �� ������ �� ������ �� ����
	private final static int pageSize = 4;
		
	// �������׷���� ������ ����
	//ex) [����] 1 2 3 4 5 [����] �� ��� ������ ������ 5
	private final static int pageGroupSize = 3;
	 
    @Override
    public String requestPro(HttpServletRequest request,
                             HttpServletResponse reaponse) throws Throwable {
//Paging  	
//==============================================================================================
    	//������ ��ȣ
    	String pageNum = request.getParameter("pageNum");
    	 
    	if (pageNum == null) {
    	    pageNum = "1";
    	}
    	 
    	int currentPage = Integer.parseInt(pageNum);
    	//�� �������� ���۱� ��ȣ
//    	int startRow = (currentPage - 1) * pageSize + 1;
    	//�� �������� ������ �۹�ȣ
//    	int endRow = currentPage * pageSize;
    	int totalArticlecount = 0;
    	int number = 0;
    	 
//    	ArrayList articleList = new ArrayList();
//    	BoardDAO dbPro = BoardDAO.getInstance();// DB����
    	totalArticlecount = BoardDao.getInstance().selectTotalCount();// ��ü ���� ��
    	 
//    	if (count > 0) {
//    	    if (endRow > count) {
//    	        endRow = count;
//    	    }
//    	     
//    	    // ���� �������� �ش��ϴ� �� ���
//    	    articleList = dbPro.select(startRow, endRow);
//    	 
//    	} else {
//    	    articleList = null;
//    	}
    	 
    	//�۸�Ͽ� ǥ���� �۹�ȣ
//    	number = count - (currentPage - 1) * pageSize;
    	 
    	// �������׷��� ����
    	// ex) pageGroupSize�� 3�� ���
    	//'[1][2][3]'�� pageGroupCount �� ��ŭ �ִ�.
    	int pageGroupCount =
    			totalArticlecount / (pageSize * pageGroupSize) +
    	    (totalArticlecount % (pageSize * pageGroupSize) == 0 ? 0 : 1);
    	// ������ �׷� ��ȣ
    	// ex) pageGroupSize�� 3�� ���
    	//'[1][2][3]'�� �������׷��ȣ�� 1 �̰� '[2][3][4]'��
    	// �������׷��ȣ�� 2 �̴�.
    	int numPageGroup = (int) Math
    	        .ceil((double) currentPage / pageGroupSize);
    	 
    	// �ش� �信�� ����� �Ӽ�
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
