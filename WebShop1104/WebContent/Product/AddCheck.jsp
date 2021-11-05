<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String pid = null, pname = null, pdes = null, pprice = null, pphoto = null ;
		byte[] pfile = null;
		
	
		ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
		// 추출 된 값들을 FileItem 객체의 형태로 저장하기 위해서 준비 
		
		List items = sfu.parseRequest(request);
		// parseRequest() 함수를 이용하여 요청 메시지로부터 입력 값들을 추출한다.
		// 각각의 입력 값들은 FileItem 객체 형태로 저장된다.
		
		Iterator iter = items.iterator();
		// 순차적으로 접근하기 위한 Iterator 객체를 생성한다.
		
	 	while(iter.hasNext()) {  // 더이상 요소가 없어질때까지 
			FileItem item = (FileItem) iter.next();
	 		String name = item.getFieldName();
	 		
			if(item.isFormField()) {	// item이 이름-값 쌍으로 구성된 필드인지 확인 
				// 파라미터 
				String value = item.getString("utf-8");
				if(name.equals("id")) pid = value;
				else if (name.equals("name")) pname = value;
				else if (name.equals("description")) pdes = value;
				else if (name.equals("price")) pprice = value;
			
			} 
			else {
				if (item.getName() == "") {
					
				}
				else if (name.equals("filename")) {
					pphoto = item.getName();
					pfile = item.get();
					String root = application.getRealPath(java.io.File.separator);
					FileUtil.saveImage(root,pphoto,pfile);
				}
			}
		}
		
		ProductDAO dao = new ProductDAO();
		if(dao.insert(pid, pname, pdes, pprice, pphoto)) {
			response.sendRedirect("/Product/Products.jsp");
		} 
	%>
</body>
</html>