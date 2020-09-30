    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile Gourmet - Valutazioni</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
		
		<script type="text/javascript">
			function createNumberCell(number) {
				var numRandom = Math.floor(Math.random() * (11 - 0) + 0);
				var colors = ["#4D5656","#424949", "#5F6A6A", "#515A5A", "#717D7E", "#616A6B", "#839192", "#707B7C", "#95A5A6", "#7F8C8D", "#99A3A4"];
				document.write("<td align=\"center\" width=\"22.75%\" bgcolor=\""+colors[numRandom]+"\"><a href=\"../saveMenuEvaluation/${id},"+number+"\"><H0W>"+number+"</H0W></a></td>");
			}
		</script>
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="../../images/list.png"></td>
		  		<td align="left"><H32W>&nbsp&nbsp&nbspValutazioni</H32W></td>
		  		<td align="right"><a href="../../index.jsp"><img src="../../images/home.png"></a></td>
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
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center"><H1W>Menu</H1W></td>
			</tr>
		</table>  
		<table style="width:80%" align="center">
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<script>createNumberCell("0");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("1");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("2");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("3");</script>
			</tr>
			<tr>
				<td><H5O>&nbsp</H5O></td>
			</tr>
			<tr>
				<script>createNumberCell("4");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("5");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("6");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("7");</script>
			</tr>
			<tr>
				<td><H5O>&nbsp</H5O></td>
			</tr>
			<tr>
		</table>  
		<table style="width:80%" align="center">
			<tr>
				<td align="center" width="12.875%"><H0W></H0W></td>
				<script>createNumberCell("8");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("9");</script>
				<td align="center" width="3%"><H0W></H0W></td>
				<script>createNumberCell("10");</script>
				<td align="center" width="12.875%"><H0W></H0W></td>
			</tr>
		</table>)
	</body>
</html>

 
	