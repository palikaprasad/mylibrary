<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>All Members Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<style>
body, input {
	font-family: Calibri, Arial;
	margin: 0px;
	padding: 0px;
}

#header h2 {
	color: white;
	background-color: #3275A8;
	height: 50px;
	padding: 5px 0 0 5px;
	font-size: 20px;
	text-align: center
}

#message {
	text-align: center;
	font-size: 16px;
	display: flex;
	float: left;
}
#link {
	float: right;
}

#booksLentTable {
	border: 1px solid #143;
	border-collapse: collapse;
	width: 400px;
	max-width: 100%;
	font-family: Calibri;
}
.datatable {
	margin-bottom: 5px;
	border: 1px solid #eee;
	border-collapse: collapse;
	width: 500px;
	max-width: 100%;
	font-family: Calibri
}

.datatable th {
	padding: 3px;
	border: 1px solid #888;
	height: 30px;
	background-color: #B2D487;
	text-align: center;
	vertical-align: middle;
	color: #444444
}

.datatable tr {
	border: 1px solid #888
}

.datatable tr.odd {
	background-color: #eee
}

.datatable td {
	padding: 2px;
	border: 1px solid #888
}

#content {padding 5px;
	margin: 5px;
	text-align: center
}

fieldset {
	width: 300px;
	padding: 5px;
	margin-bottom: 0px;
}

legend {
	font-weight: bold;
}
</style>

<script>
function doAjaxPost(memberId)
{

    $.ajax(
    {
        type: "GET",
        url: "listBooks",
        data: {"memberId": memberId},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
        success: function(data) {
        			var tableHeaderElement=tableHeaderCreate();
        			var tableBodyElement=tableBodyCreate(data.booksLent);
        			$("#booksLentTable").empty();
        			$("#booksLentTable").append(tableHeaderElement);
        			$("#booksLentTable").append(tableBodyElement);
                 },
        error:function(data,status,er) {
            alert("error: "+data+" status: "+status+" er:"+er);
        }

    });
}


function tableHeaderCreate(data)
{
 var tbl  = document.createElement("thead");
 var tr = tbl.insertRow();
 
 var th1 = document.createElement("th");
 th1.appendChild(document.createTextNode("S.No"));
 tr.appendChild(th1);
 var th2 = document.createElement("th");
 th2.appendChild(document.createTextNode("Title"));
 tr.appendChild(th2);
 var th3 = document.createElement("th");
 th3.appendChild(document.createTextNode("Author"));
 tr.appendChild(th3);
 var th4 = document.createElement("th");
 th4.appendChild(document.createTextNode("ISBN"));
 tr.appendChild(th4);
 
 
 /* var td1 = tr.insertCell();
 td1.appendChild(document.createTextNode("S.No"));
 var td2 = tr.insertCell();
 td2.appendChild(document.createTextNode("Title"));
 var td3 = tr.insertCell();
 td3.appendChild(document.createTextNode("Author"));
 var td4 = tr.insertCell();
 td4.appendChild(document.createTextNode("ISBN")); */
 return tbl;
}

// Function to create a table as a child of el.
//data must be an array of arrays (outer array is rows).
function tableBodyCreate(data)
{
 var tbl  = document.createElement("tbody");
 var j=0;
 for (var i = 0; i < data.length; ++i)
 {
     var tr = tbl.insertRow();
     
     var td1 = tr.insertCell();
     td1.appendChild(document.createTextNode(++j));
     
     var td2 = tr.insertCell();
     td2.appendChild(document.createTextNode(data[i].title));
     var td3 = tr.insertCell();
     td3.appendChild(document.createTextNode(data[i].author));
     var td4 = tr.insertCell();
     td4.appendChild(document.createTextNode(data[i].isbn));
     
 }
 return tbl;
}
</script>


</head>
<body>
	<div id="header">
		<H2>Library Management System</H2>
	</div>

	<div id="content">
		<c:choose>
		  <c:when test="${not empty membersList}">
		  	<div>
			  	<span id="link"><a href="books">Show Books</a></span>
		  	</div>
		  	<div>
			  	<table>
			  		<tr>
			  			<td>
			  				<table class="datatable">
						  		<tr>
							     	<td colspan="5"><b>List of Members:</b></td>
							  	</tr>
							    <tr>
							     	<th>S.No</th>
							  		<th>Name</th>
							  		<th>Phone</th>
							  		<th>Email</th>
							  		<th>Books Lent</th>
							  	</tr>
								<c:forEach var="member" items="${membersList}" varStatus="status">
									<tr>
										<td align="center"><c:out value="${status.count}" /></td>
								  		<td>${member.name}</td> 
								  		<td>${member.phone}</td>
								  		<td>${member.email}</td>
								  		<td><a href="#" onclick="doAjaxPost('${member.id}'); return true;">View Books</a></td>
								  	</tr>
								</c:forEach>
							</table>
			  			</td>
			  			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  			<td><table id="booksLentTable" class="datatable"></table></td>
			  		</tr>
			  	</table>
			</div>
		  </c:when>    
		  <c:otherwise>
		     <span id="message">No Members currently available.</span>
		  </c:otherwise>
		</c:choose>
		
	</div>  
</body>  