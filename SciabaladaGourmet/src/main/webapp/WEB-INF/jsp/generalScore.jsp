    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile Gourmet - Classifica</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/chart.png"></td>
		  		<td align="left"><H32W>&nbsp&nbsp&nbspClassifica</H32W></td>
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
					<H1O> Classifica Generale </H1O>
				</td>
			</tr>
			<tr>
				<td align="center"><H32O>Totale ristoranti valutati: ${totalScores}</H32O></td>
			</tr>
			<tr>
				<td><H5O>&nbsp</H5O></td>
			</tr>
		</table>		
		
		<br>
		<table style="width:100%" align=center>
			<tr bgcolor="#000000">
				<td align="center"><H32O>Ristorante</H32O></td>
				<td align="left"><H32O>&nbsp&nbspLocalità</H32O></td>
				<td align="center"><H32O>Totale</H32O></td>
			<c:forEach var="score" items="${scoreList}"> 
		    	<tr>
					<td align="center"><H5W>&nbsp</H5W></td>
					<td align="left"><H5W>&nbsp</H5W></td>
					<td align="center"><H5W>&nbsp</H5W></td>
				</tr>
		    	<tr>
					<td align="left"><a href="resturantScores/${score.resturant},${score.city}"><H32W>${score.resturant}</H32W></<a></td>
					<td align="left"><a href="resturantScores/${score.resturant},${score.city}"><H32W>${score.city}</H32W></<a></td>
					<td align="center"><a href="resturantScores/${score.resturant},${score.city}"><H32W>${score.score}</H32W></<a></td>
				</tr>
		    </c:forEach> 
		</table>  
	</body>
</html>
 
	