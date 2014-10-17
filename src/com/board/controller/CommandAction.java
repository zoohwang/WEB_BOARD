package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 14. 10. 17.
 * 요청 파라미터로 명령어를 전달하는 방식의 슈퍼 인터페이스
 */
public interface CommandAction {

    public String requestPro(HttpServletRequest request, HttpServletResponse reaponse)
    throws Throwable;
}
