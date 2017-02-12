<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>All Books Page</title>
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

.datatable {
	margin-bottom: 5px;
	border: 1px solid #eee;
	border-collapse: collapse;
	width: 400px;
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
</head>
<body>
	<div id="header">
		<H2>Library Management System</H2>
	</div>

	<div id="content">
		<c:choose>
		  <c:when test="${not empty bookList}">
		  	
		  	<div>
			  	<span id="link"><a href="members">Show Members</a></span>
		  	</div>
		  	<div>
		  	<table class="datatable">
		  		<tr>
			     	<td colspan="5"><b>List of Books:</b></td>
			  	</tr>
			     <tr>
			     	<th>S.No</th>
			  		<th>Title</th>
			  		<th>Author</th>
			  		<th>ISBN</th>  
			  	</tr>
				<c:forEach var="book" items="${bookList}" varStatus="status">
					<tr>
						<td align="center"><c:out value="${status.count}" /></td>
				  		<td>${book.title}</td> 
				  		<td>${book.author}</td>
				  		<td>${book.ISBN}</td>
				  	</tr>
				</c:forEach>
			</table>
			</div>
		  </c:when>    
		  <c:otherwise>
		     <span id="message">No Books currently available.</span>
		  </c:otherwise>
		</c:choose>
		
	</div>  
</body>  