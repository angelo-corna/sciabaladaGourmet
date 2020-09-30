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
		  		<td align="right"><img src="../images/list.png"></td>
		  		<td align="left"><H32W>&nbsp&nbsp&nbspValutazioni</H32W></td>
		  		<td align="right"><a href="../index.jsp"><img src="../images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:100%">
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center">
					<H1O>Valutazione di ${currentUser} </H1O>
				</td>
			</tr>
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center">
					<H3O>Ristorante: ${resturant} </H3O>
				</td>
			</tr>
			<tr>
				<td align="center">
					<H3O> Data: ${dinnerDate} </H3O>
				</td>
			</tr>
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<a href="locationEvaluation/${id}"><H3W>Location: ${location} </H3W></a>
				</td>
			</tr>
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<a href="menuEvaluation/${id}"><H3W>Menu: ${menu} </H3W></a>
				</td>
			</tr>
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<a href="serviceEvaluation/${id}"><H3W>Servizio: ${service} </H3W></a>
				</td>
			</tr>
			<tr>
				<td><H1O>&nbsp</H1O></td>
			</tr>
			<tr>
				<td align="center">
					<a href="billEvaluation/${id}"><H3W>Conto: ${bill} </H3W></a>
				</td>
			</tr>
		</table>  
	</body>
</html>
 
	