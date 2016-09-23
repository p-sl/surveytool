
<%@page import="ilu.surveytool.constants.Attribute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ilu.surveytool.language.Language"%>
    
    								<%
    								Language lang = (Language) request.getSession().getAttribute(Attribute.s_SURVEY_LANGUAGE);
    								%>
										<div class="form-question" id="form-question">
											<fieldset>
												<legend>
													{{question.index}}. {{getJsonArrayElement(question.contents, "contentType", "title").text}}													
												</legend>
												
												<p>{{getJsonArrayElement(question.contents, "contentType", "description").text}}</p>
	
												<jsp:include page="fqComponents/fqResources.jsp" />
												
												<div class="form-question-content">
													<label for="{{question.questionId}}" class="visuallyhidden"><%= lang.getContent("accesibility.question.longtextAnswer") %></label>
							  						<textarea class="form-control" id="{{question.questionId}}" name="{{question.questionId}}" rows='{{getLines(getJsonArrayElement(question.parameters, "name", "textLines"), getJsonArrayElement(question.parameters, "name", "textLength"))}}' placeholder='<%= lang.getContent("placeholder.type_here")%>' maxlength='{{getMaxLength(getJsonArrayElement(question.parameters, "name", "textLength"))}}'></textarea>
												</div>	
												
											</fieldset>																						
										</div>
<%
lang.close();
%>