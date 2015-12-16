<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ilu.surveytool.databasemanager.DataObject.LoginResponse"%>
<%@page import="ilu.surveytool.constants.Attribute"%>
<%@page import="ilu.surveytool.constants.FormParameter"%>
				<%
				LoginResponse loginResponse = (LoginResponse) request.getAttribute(Attribute.s_LOGIN_RESPONSE);
				%>
				<div class="container-fluid">
	  				<div class="title-content">
	  					<h2>Inicio</h2>	  					
	  				</div>
	  				<div class="login-content">
  						<div class="login-frame">
	  						<form method="post" action="LoginServlet">
	  							<h3>Login</h3>
	  							<%
	  							if(loginResponse != null && !loginResponse.isValid())
	  							{
	  							%>
	  							<div class="error-msg"><p><%= loginResponse.getErrorMsg() %></p></div>
	  							<%
	  							}
	  							%>
	  							<div class="form-group">
	  								<label for="username"> Username
		  								<input type="text" id="username" name="<%= FormParameter.s_USERNAME %>" class="form-control"/>
		  							</label>
		  						</div>
		  						<div class="form-group">
		  							<label for="password"> Password
		  								<input type="password" id="username" name="<%= FormParameter.s_PASSWORD %>" class="form-control"/>
		  							</label>
	  							</div>	
	  							<div class="right">
	  								<input type="submit" class="btn btn-primary btn-survey" value="Send" />
	  							</div>  							
	  						</form>
	  					</div>
  					</div>	  				
	  			</div>
	  			