<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="ilu.surveytool.language.Language"%>
<%@ page import="ilu.surveytool.constants.Attribute"%>

	<%
	Language lang = (Language) request.getSession().getAttribute(Attribute.s_SURVEY_LANGUAGE);
	%>

<<<<<<< HEAD
										<div class="form-question" id="form-question-{{question.questionId}}">
											<fieldset>
												<legend>
=======
	<div class="form-question" id="form-question">
		<fieldset>
			<legend>
				<span class="number">{{question.index}}</span> <span class="text">{{getJsonArrayElement(question.contents, "contentType", "title").text}}</span> <span class="mandatory">*<span class="sr-only"><%= lang.getContent("question.mandatory") %></span></span>
			</legend>
			
			<p>{{getJsonArrayElement(question.contents, "contentType", "description").text}}</p>
			
			<jsp:include page="fqComponents/fqResources.jsp" />
>>>>>>> 61698b53774a157bcdef3f87170c7143d9bedc74

			<div class="form-question-content">
	        	<table>
	            	<thead>
	                	<tr >
	                    	<td></td>
	                    	<th ng-repeat="option in question.optionsGroups[0].options">{{getJsonArrayElement(option.contents, "contentType", "title").text}}</th>                    		
	                	</tr>
	            	</thead>
	            	<tbody>
	            		
                    	<tr ng-repeat="optionsGroup in question.optionsGroups">
                    		<th class="matrix-title">{{getJsonArrayElement(optionsGroup.contents, "contentType", "title").text}}</th>
                    		
                    		<td ng-repeat="option in optionsGroup.options">
                    			<input type='{{getMatrixOptionType(getJsonArrayElement(question.parameters, "name", "matrixType"))}}' name="{{question.questionId}}-{{optionsGroup.optionGroupId}}-{{option.optionId}}" id="options-{{optionsGroup.optionGroupId}}-{{option.optionId}}" value="{{option.optionId}}" ng-if="optionsGroup.optionType == 'radio'" ng-model="optionsGroup.response">
                    			<input type='{{getMatrixOptionType(getJsonArrayElement(question.parameters, "name", "matrixType"))}}' name="{{question.questionId}}-{{optionsGroup.optionGroupId}}-{{option.optionId}}" id="options-{{optionsGroup.optionGroupId}}-{{option.optionId}}" ng-if="optionsGroup.optionType != 'radio'" ng-model="option.response">
                    			<label for="options-{{optionsGroup.optionGroupId}}-{{option.optionId}}"><span class="sr-only">{{getJsonArrayElement(optionsGroup.contents, "contentType", "title").text}} - {{getJsonArrayElement(option.contents, "contentType", "title").text}}</span></label>
                    		</td>
                    	</tr>
	                    
	            	</tbody>
	        	</table>
	    	</div>
		</fieldset>																						
	</div>
