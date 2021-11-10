<%@page import="DAO.BoardDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
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
		
		// 파일이 있기 때문에 request.getParameter()로 값을 받을 수 없으므로 변수로 이용한다.
		String btilte = null, bcontent = null, bauthor=null, bimage = null, bdate=null;
		byte[] bfile = null;
		
	
		ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
		// 추출 된 값들을 FileItem 객체의 형태로 저장하기 위해서 준비 
		
		List items = sfu.parseRequest(request);
		// parseRequest() 함수를 이용하여 요청 메시지로부터 입력 값들을 추출한다.
		// 각각의 입력 값들은 FileItem 객체 형태로 저장된다.
		
		Iterator iter = items.iterator();
		// 순차적으로 접근하기 위한 Iterator 객체를 생성한다.
		
	 	while(iter.hasNext()) {  // 요소가 있는지 반복문으로 계속 확인 ! 더 이상 요소가 없어질때까지 ! 
			FileItem item = (FileItem) iter.next();
	 		String name = item.getFieldName();
	 		
			if(item.isFormField()) {	// item이 이름-값 쌍으로 구성된 필드(FormField 딕셔너리형태)인지 확인 
				// 파라미터 
				String value = item.getString("utf-8");
				if (name.equals("title")) btilte = value;
				else if (name.equals("name")) bauthor = value;
				else if (name.equals("content")) bcontent = value;
			
			} 
			else {    // 사진은 여기서 별도초 추출 
				if (item.getName() == "") {
					
				}
				else if (name.equals("filename")) {
					bimage = item.getName();  // 사진 파일의 이름을 추출 
					bfile = item.get();		// 진짜 사진만 추출 
					String root = application.getRealPath(java.io.File.separator);
					FileUtil.saveImage(root,bimage,bfile);
					
					/* FileUtil.jsp를 만들지 않고 바로 사진을 특정 위치에 저장 할 수 있다. */ 
					/* File file = new File("/photos/" + bfile);
					item.write(file); */
				}
			}
		}
		
	 	BoardDAO dao = new BoardDAO();
		bcontent = bcontent.replace("\r\n","<br>");  // description은 textarea로 되어있어 여러줄로 들어오므로 줄바꿈을 <br>로 표기되게 처리했다. 
		
		if(dao.insert(btilte, bauthor, bcontent, bimage)) {
			response.sendRedirect("/Board/BoardList.jsp");
		}else {
			out.print("<script>alert('Failed to upload :( Try again '); location.href='/Board/AddBoard.jsp';</script>");
		}
	%>
</body>
</html>