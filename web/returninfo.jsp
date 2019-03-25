<%-- 
    Document   : returninfo
    Created on : 2010-5-26, 13:37:59
    Author     : zhengjy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>退货</title>
    </head>
    <body>
       <%request.setCharacterEncoding("UTF-8");%>
        <jsp:useBean id="goodsManage" class="manager.GoodsManage" scope="page"/>       
        <%
        String s, item;
        int c;
        s = request.getParameter("select");
        item = request.getParameter("item");
        c = Integer.parseInt(request.getParameter("count"));
        goodsManage.connectDB();
        if (s.equals("name")) {
            if (goodsManage.nameReturn(item, c)) {//按名字退货
                response.setHeader("refresh", "0;URL=return.jsp?info=success");
            } else {
                response.setHeader("refresh", "0;URL=return.jsp?info=fail");
            }
        }
        if (s.equals("id")) {
            if (goodsManage.idReturn(item, c)) {//按ID退货
                response.setHeader("refresh", "0;URL=return.jsp?info=success");
            } else {
                response.setHeader("refresh", "0;URL=return.jsp?info=fail");
            }
        }
        goodsManage.closeDB();
        %>
    </body>
</html>
