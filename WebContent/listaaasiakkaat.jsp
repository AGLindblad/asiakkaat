<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

.form{
	margin: 0 auto;
	width: 280px;
}
.oikealle{
	text-align: right;
	background: rgba(0,0,128,0.7);
}
.ylarivi {
background: rgba(0,0,128, 0.7);
}
	
.otsikko {
	text-align: center;
	font-family: Palatino, serif;
	font-style: italic;
	font-weight: bold;
	font-size: 20px;
	background: rgba(0,0,128,0.4);
}

</style>
</head>
<body>

<div class = "form">
<table id="listaus" border="2">
	<thead>	
		<tr>
			<th class="oikealle">Hakusana:</th>
			<th class= "ylarivi" colspan="2"><input type="text" id="hakusana"></th>
			<th class= "ylarivi"> <input type="button" value="hae" id="hakunappi"></th>
		</tr>			
		<tr>
			<th class="otsikko">Etunimi</th>
			<th class="otsikko">Sukunimi</th>
			<th class="otsikko">Puhelin</th>
			<th class="otsikko">Sposti</th>							
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	haeAsiakkaat();
	$("#hakunappi").click(function(){		
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		  if(event.which==13){
			  haeAsiakkaat();
		  }
	});
	$("#hakusana").focus();
});	

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){		
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>";  
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
}

</script>
</div>
</body>
</html>