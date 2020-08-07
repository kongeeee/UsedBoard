<%@ page contentType="text/html; charset=utf8" %>
<%  String prevURI1 = (String)session.getAttribute("prevURI");
    
    /*
    String requestURI  = request.getRequestURI();
    String queryString = request.getQueryString();
    if (queryString == null) queryString = "";
    else queryString = "?" + queryString;
    request.setAttribute("prevPage", prevPage);
    request.setAttribute("prevURI", requestURI);
    */

    String requestURI  = request.getRequestURI();
    String queryString = request.getQueryString();

    session.setAttribute("prevPage1", (String)session.getAttribute(prevPage2));
    session.setAttribute("prevPage2", requestURI + queryString);
    session.setAttribute("prevURI", requestURI);

%>
${sessionScope.prevPage}