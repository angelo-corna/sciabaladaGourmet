<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>
	<head>
		<title>Sciabalada Gourmet - Nuova Cena</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="images/sciabalada.ico">
	</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="images/plus.png"></td>
		  		<td align="left"><h3w>&nbsp&nbsp&nbspNuova Cena</h3w></td>
		  		<td align="right"><a href="index.jsp"><img src="images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		
		<form:form method="post" action="saveDinner" accept-charset="utf-8" > 
		
		<br><br><br>
		
		<table style="width:80%" align=center>
			<tr>
				<td align="center"><H3O>Data</H3O></td>
			</tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr>					
				<td align="center"><form:input type="date" path="dinnerDate" id="date" min="2008-01-01" max="2100-12-31"/></td>
			</tr>
			<tr><td><H5O>&nbsp</H5O></td></tr>
			<tr><td><hr></td></tr>
			
			
			<tr>
				<td align="center">
					<br>
					<H3O>Ristorante</H3O>
					<table align=center>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						<tr>
							<td colspan="2"><form:radiobutton path="kind" value="N" label=" Nuovo ristorante" id="newResturant" checked="checked"/></td>
						</tr>
						
						<tr>
							<td><h4W>Nome&nbsp&nbsp&nbsp</H4W></td>
							<td><form:input path="resturant" type="input" id="resturant" min="1" max="50" value=""/></td>
						</tr>
						<tr>
							<td>&nbsp</td>
						</tr>
						<tr>
							<td><H4W>Località&nbsp</H4W></td>
							<td><form:input path="city" type="input" id="city" min="1" max="50" value=""/></td>
						</tr>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						
						<tr>
							<td colspan="2"><form:radiobutton path="kind" value="O" label=" Ristorante già Valutato" id="oldResturant"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<form:select path="resturantAndCity" id="resturantAndCity" items="${resturantList}" disabled="true" cssStyle="height:100px;width:100%;font-size:50px"/>
							</td>
						</tr>
					
					</table>
					<tr><td><H5O>&nbsp</H5O></td></tr>
					<tr><td><hr></td></tr>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<br>
					<H3O>Partecipanti</H3O>
					<table>
						<tr><td><H5O>&nbsp</H5O></td></tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Angelo" label=" Angelo" id="angelo"/> </td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Co" label=" Co" id="co"/>  </td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Karmen" label=" Karmen" id="karmen"/>   </td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Katia" label=" Katia" id="katia"/>   </td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Marco" label=" Marco" id="marco"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Mario" label=" Mario" id="mario"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Mauro" label=" Mauro" id="mauro"/></td>
						</tr>
						<tr>
							<td align="left"><form:checkbox path="participants" value="Renzo" label=" Renzo" id="renzo"/></td> 
						</tr>
					</table>
					<tr><td><H5O>&nbsp</H5O></td></tr>
					<tr><td><hr></td></tr>
				</td>
			</tr>
			
			<tr><td><H1O>&nbsp</H1O></td></tr>
			<tr>
				<td align="center">
					<input type="submit" class="button" value="Salva la Cena" id="saveButton" disabled="true">
				</td>
			</tr>
			<tr><td><H1O>&nbsp</H1O></td></tr>

		</table>
	</form:form> 
</body>


<script type="text/javascript">

	var date = new Date();
	
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;
	
	var today = year + "-" + month + "-" + day;       
	document.getElementById("date").value = today;

	var newResturant = document.getElementById('newResturant');
	var resturant = document.getElementById('resturant');
	var city = document.getElementById('city');
	
	var oldResturant = document.getElementById('oldResturant');
	var resturantAlreadyEvaluated = document.getElementById('resturantAlreadyEvaluated');
	
	var angelo = document.getElementById('angelo');
	var co = document.getElementById('co');
	var karmen = document.getElementById('karmen');
	var katia = document.getElementById('katia');
	var mario = document.getElementById('marco');
	var mario = document.getElementById('mario');
	var mauro = document.getElementById('mauro');
	var renzo = document.getElementById('renzo');
	var saveButton = document.getElementById('saveButton');

	newResturant.onchange = function(){
		if(this.checked){
			resturant.disabled = false;
			city.disabled = false;
			resturantAndCity.disabled = true;
			resturantAndCity.value = "NONE";
		} else {
			resturant.disabled = true;
			city.disabled = true;
			resturantAndCity.disabled = false;
		}
		manageSaveButton();
	}
	
	resturant.onchange = function(){
		manageSaveButton();
	}
	
	city.onchange = function(){
		manageSaveButton();
	}
	
	oldResturant.onchange = function(){
		if(this.checked){
			resturant.disabled = true;
			city.disabled = true;
			resturantAndCity.disabled = false;
			resturant.value = "";
			city.value = "";
		} else {
			resturant.disabled = false;
			city.disabled = false;
			resturantAndCity.disabled = true;
		}
		manageSaveButton();
	}

	resturantAndCity.onchange = function(){
		manageSaveButton();
	}

	angelo.onchange = function(){
		manageSaveButton();
	}

	co.onchange = function(){
		manageSaveButton();
	}

	katia.onchange = function(){
		manageSaveButton();
	}

	mario.onchange = function(){
		manageSaveButton();
	}
	
	mauro.onchange = function(){
		manageSaveButton();
	}
	renzo.onchange = function(){
		manageSaveButton();
	}
	
	
	function manageSaveButton() {
		
		var numParticipants = 0;
		if(angelo.checked){numParticipants++;}
		if(co.checked){numParticipants++;}
		if(karmen.checked){numParticipants++;}
		if(katia.checked){numParticipants++;}
		if(marco.checked){numParticipants++;}
		if(mario.checked){numParticipants++;}
		if(mauro.checked){numParticipants++;}
		if(renzo.checked){numParticipants++;}

		if(numParticipants > 1){
			if(newResturant.checked){
				if( resturant.value != "" && city.value != "" ){
					saveButton.disabled = false;
				}else{
					saveButton.disabled = true;	
				}
			}else{
				if(resturantAndCity.value != "0"){
					saveButton.disabled = false;	
				}else{
					saveButton.disabled = true;	
				}
			}
		}else{
			saveButton.disabled = true;
		}
		
	}

</script>

 