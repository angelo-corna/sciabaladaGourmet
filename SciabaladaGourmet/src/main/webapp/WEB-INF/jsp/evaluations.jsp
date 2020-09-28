    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile Gourmet - Valutazioni</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/list.png"></td>
		  		<td align="left"><H32W>&nbsp&nbsp&nbspValutazioni</H32W></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:100%">
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center">
					<H1O> Valutazioni di ${currentUser} </H1O>
				</td>
			</tr>
			<tr>
				<td align="center"><H32O>Totale cene: ${totalDinners}</H32O></td>
			</tr>
			<tr>
				<td><H5O>&nbsp</H5O></td>
			</tr>
		</table>		
		
		<br>
		<table style="width:100%" align=center>
			<tr bgcolor="#000000">
				<td align="center"><H32O>Data</H32O></td>
				<td align="left" width="50%"><H32O>&nbsp&nbspRistorante</H32O></td>
				<td align="center"><H32O>Valutata</H32O></td>
			<c:forEach var="dinner" items="${userDinners}"> 
		    	<tr>
					<td align="center"><H5W>&nbsp</H5W></td>
					<td align="left" width="50%"><H5W>&nbsp</H5W></td>
					<td align="center"><H5W>&nbsp</H5W></td>
				</tr>
		    	<tr>
					<td align="center"><a href="dinnerEvaluatiion/${dinner.id}"><H32W>${dinner.dinnerDate}</H32W></<a></td>
					<td align="left" width="50%"><a href="dinnerEvaluatiion/${dinner.id}"><H32W>&nbsp&nbsp${dinner.resturant}</H32W></<a></td>
					<td align="center"><H32W><img src="images/select.png"></H32W></td>
				</tr>
		    </c:forEach> 
		</table>  
	</body>
</html>
 
	