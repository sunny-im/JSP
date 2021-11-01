
<%@page import="dao.FeedDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="util.FileUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String uid = null, ucon = null, ufname = null;
	byte[] ufile = null;
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	
	while(iter.hasNext()) { // 객체의 요소가 남아 있는 경우 true
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		if(item.isFormField()) { // 현재 item이 이름-값 쌍으로 구성된 경우 값을 추출 
			String value = item.getString("utf-8");
			if(name.equals("id")) uid = value;
			else if (name.equals("content")) ucon = value;
		}
		else {
			if (item.getName() == "") {
			} else if (name.equals("image")) {
					ufname = item.getName();
					/* ufname = ufname.substring(ufname.lastIndexOf("\\"));  
					왜인지는 모르겠으나...윈도우에서는 파일명만 가져오지않고 경로를 가져와서 에러가 발생했다. 때문에 마지막 슬러쉬 부분을 잘라내어
					파일명만 가져오기 위해서 인덱스로 잘라내었다. */
					ufile = item.get();
					String root = application.getRealPath(java.io.File.separator);
					FileUtil.saveImage(root, ufname, ufile);
					/* out.print(ufname + "<br>");
					out.print(ufile + "<br>");
					out.print(root + "<br>"); */
				} 
			}
		}
	

	// 사진 업로드 후 DB에 저장 
	FeedDAO dao = new FeedDAO();
	ucon = ucon.replace("\r\n","<br>"); // 줄바꿈
	if(dao.insert(uid, ucon, ufname)) {
		response.sendRedirect("Main.jsp");
	} else {
		out.print("오류발생");
	}
%>