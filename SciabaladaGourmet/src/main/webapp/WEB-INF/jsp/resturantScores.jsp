    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
	<head>
		<title>Sciabalada Mobile Gourmet - Classifica</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="../../images/sciabalada.ico">
		
		<script type="text/javascript">
			function formatScore(score) {
				document.write("<td align=\"center\"><H32W>"+Math.round(score*Math.pow(10,2))/Math.pow(10,2)+"</H32W></td>");
			}
			
			function formatTitle(scoreType) {

				var titleType = "";
				
				switch (scoreType) {
				  case "general":
				    	titleType = "Generale";
				    	break;
				  case "location":
					 	titleType = "Location";
					    break;
				  case "menu":
					    titleType = "Menu";
					    break;
				  case "service":
					    titleType = "Servizio";
					    break;
				  case "bill":
					    titleType = "Conto";
					    break;
				}
				
				document.write("<td align=\"center\"><H1O> Classifica " + titleType + " </H1O></td>");
			}
			
			function showScore(scoreType){
				
			}
		</script>

	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="../../images/chart.png"></td>
		  		<td align="left"><H32W>&nbsp&nbsp&nbspClassifica</H32W></td>
		  		<td align="right"><a href="../../index.jsp"><img src="../../images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>

		<table style="width:100%">
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<script type="text/javascript">
					/*<![CDATA[*/ 
						var jsType = '${scoreType}';
						formatTitle(jsType);
					/*]]>*/	
				</script>
			</tr>
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center">
					<H3O> ${resturant} </H3O>
				</td>
			</tr>
			<tr>
				<td align="center">
					<H3O> ${city} </H3O>
				</td>
			</tr>
			<tr>
				<td><H4O>&nbsp</H4O></td>
			</tr>
			<tr>
				<td align="center"><H32W>Totale Valutazioni: ${totalResturantScores}</H32W></td>
			</tr>
			<tr>
				<td><H5O>&nbsp</H5O></td>
			</tr>
		</table>		
		
		<br>
		<table style="width:100%" align=center>
			<script type="text/javascript">
				/*<![CDATA[*/ 
					var jsType = '${scoreType}';
				/*]]>*/	
				document.write("<tr bgcolor=\"#000000\">");
				document.write("<td align=\"center\"><H32O>Data</H32O></td>");
				switch (jsType) {
				  case "general":
						document.write("<td align=\"center\"><H32O>Location</H32O></td>");
						document.write("<td align=\"center\"><H32O>Servizio</H32O></td>");
						document.write("<td align=\"center\"><H32O>Menu</H32O></td>");
						document.write("<td align=\"center\"><H32O>Conto</H32O></td>");
				    	break;
				  case "location":
						document.write("<td align=\"center\"><H32O>Location</H32O></td>");
					    break;
				  case "menu":
						document.write("<td align=\"center\"><H32O>Menu</H32O></td>");
					    break;
				  case "service":
						document.write("<td align=\"center\"><H32O>Servizio</H32O></td>");
					    break;
				  case "bill":
						document.write("<td align=\"center\"><H32O>Conto</H32O></td>");
					    break;
				}
				document.write("</tr>");
			</script>
			<c:forEach var="resturantScore" items="${resturantScoresList}"> 
			
				<script type="text/javascript">
					/*<![CDATA[*/ 
						var jsType = '${scoreType}';
					/*]]>*/	
				
					document.write("<tr>");
					document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
					if (jsType == "general") {
						document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
						document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
						document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
						document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
					} else {
						document.write("<td align=\"center\"><H5W>&nbsp</H5W></td>");
					}	
					document.write("</tr>");
				</script>
		    	<tr>
					<td align="center"><a href="../participantScores/${resturantScore.resturant},${resturantScore.city},${resturantScore.dinnerDate},${scoreType}"><H32W>${resturantScore.dinnerDate}</H32W></a></td>
					<script type="text/javascript">
						/*<![CDATA[*/ 
							var jsType = '${scoreType}';
						/*]]>*/	
						
						switch (jsType) {
							  case "general":
									var jsScoreLocation = [[${resturantScore.location}]];
									formatScore(jsScoreLocation);
									var jsScoreService = [[${resturantScore.service}]];
									formatScore(jsScoreService);
									var jsScoreMenu = [[${resturantScore.menu}]];
									formatScore(jsScoreMenu);
									var jsScoreBill = [[${resturantScore.bill}]];
									formatScore(jsScoreBill);
							    	break;
							  case "location":
									var jsScoreLocation = [[${resturantScore.location}]];
									formatScore(jsScoreLocation);
								    break;
							  case "menu":
									var jsScoreMenu = [[${resturantScore.menu}]];
									formatScore(jsScoreMenu);
								    break;
							  case "service":
									var jsScoreService = [[${resturantScore.service}]];
									formatScore(jsScoreService);
								    break;
							  case "bill":
									var jsScoreBill = [[${resturantScore.bill}]];
									formatScore(jsScoreBill);
								    break;
						}
					</script>			
				</tr>
		    </c:forEach> 
		</table>  
	</body>
</html>
 
	