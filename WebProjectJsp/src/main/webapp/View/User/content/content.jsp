<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="wrapper_content">
    <%
    String click = request.getParameter("quanly");
    if (click == null) {
        click = "";
    }
    if (click.equals("signin")) {
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
    } else if(click.equals("findStore")){
    	request.getRequestDispatcher("findStore.jsp").forward(request, response);
    }
    else if(click.equals("login")){
    	request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    else {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    %>
</div>