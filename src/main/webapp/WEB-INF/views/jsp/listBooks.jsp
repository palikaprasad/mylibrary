<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
	<title>All Books Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<spring:url value="/css/main.css" var="mainCss" />
	<link href="${mainCss}" rel="stylesheet" />
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