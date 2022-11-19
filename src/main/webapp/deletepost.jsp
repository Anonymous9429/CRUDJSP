<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@page import="com.example.bean.BoardVO"%>
<%@page import ="com.example.util.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int id = Integer.parseInt(sid);
		BoardVO u = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		u.setSeq(id);
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>