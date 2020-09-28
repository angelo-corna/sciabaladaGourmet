    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile Gourmet - Cena salvata</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="../images/plus.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspNuova Cena</H3W></td>
		  		<td align="right"><a href="../index.jsp"><img src="../images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:100%">
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<H1O>Cena salvata</H1O>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<H3W>Data ${dinnerDate}</H3W>
				</td>
			</tr>	
		
			<tr>
				<td align="center" colspan="2"><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<H3W>Ristorante: ${resturant}</H3W>
				</td>
			</tr>	
			<tr>
				<td align="center">
					<H3W>Località: ${city}</H3W>
				</td>
			</tr>	
			<tr>
				<td align="center" colspan="2"><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<H3O>Partecipanti</H3O>
				</td>
			</tr>	
			<c:forEach var="participant" items="${participants}"> 
				<tr>
					<td align="center"><H3W>${participant}</H3W></td>
				</tr>
			</c:forEach>
		</table>		  
	</body>
</html>
 
	