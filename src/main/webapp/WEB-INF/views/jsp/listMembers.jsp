<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
	<title>All Members Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<spring:url value="/css/main.css" var="mainCss" />
	<spring:url value="/js/jquery.min.js" var="jqueryJs" />
	<spring:url value="/js/library.js" var="libraryJs" />
	
	<link href="${mainCss}" rel="stylesheet" />
	<script src="${jqueryJs}"></script>
	<script src="${libraryJs}"></script>
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