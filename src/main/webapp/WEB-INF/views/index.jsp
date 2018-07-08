
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
	<div class="form-group form">
		<form action='add' method="post">
			<label>Note Title:</label>
			<input type="text" id="noteTitle" name="noteTitle" placeholder="note title" class="form-control"/>
			<br/>
			<label>Note Content:</label>
			<input type="text" id="noteContent" name="noteContent" placeholder="note content" class="form-control"/>
			<br/>
			<label>Note Status:</label>
			<select name="noteStatus">
	            <option value="active">active</option>
	            <option value="inactive">inactive</option>
	        </select>
			<br/>
			<button type="submit" class="form-control">Submit</button>
		</form>
	</div>
	<c:if test="${!errorMessage.isEmpty()}">
		<p style= "color:red;">${errorMessage}</p>
	</c:if>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
	<table>
	<c:forEach items="${noteList}" var="note">
	    <tr>
	        <td>Note Id :</td>
	        <td>${note.noteId}</td>
	    </tr>
	    <tr>
	        <td>Note Title :</td>
	        <td>${note.noteTitle}</td>
	    </tr>
	    <tr>
	        <td>Note Content :</td>
	        <td>${note.noteContent}</td>
	    </tr>
	    <tr>
	        <td>Note Status :</td>
	        <td>${note.noteStatus}</td>
	    </tr>
	    <tr>
	        <td>Note created at :</td>
	        <td>${note.createdAt}</td>
	    </tr>
	     <tr>
	        <td>
	        	<div class="form-group form">
					<form action='delete' method="post">
						<input type="hidden" id="noteId" name="noteId" value="${note.noteId}" class="form-control"/>
						<button type="submit" class="form-control">Delete</button>
					</form>
				</div>
	        </td>
	    </tr>
</c:forEach>
    
</table>
</body>
</html>