package ilu.surveytool.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import ilu.surveymanager.data.Option;
import ilu.surveymanager.handler.OptionHandler;
import ilu.surveymanager.handler.QuestionHandler;
import ilu.surveymanager.handler.ResourceHandler;
import ilu.surveymanager.handler.SurveysHandler;
import ilu.surveytool.constants.Parameter;
import ilu.surveytool.databasemanager.DataObject.Content;

@Path("/QuestionService")
public class QuestionService {
   
	@PUT
	@Path("/updateContent")
	@Consumes(MediaType.TEXT_PLAIN)
	@Produces(MediaType.TEXT_PLAIN)
    public String updateContent(String req) {
    	System.out.println("Opci�n: " + req);
    	JSONObject json = null;
    	String response = "";
    	try {
			json = new JSONObject(req);
			int questionId = Integer.parseInt(json.getString(Parameter.s_QID));
			Content content = new Content(0, 
					json.getString(Parameter.s_LANGUAGE_LAN), 
					json.getString(Parameter.s_CONTENT_TYPE), 
					json.getString(Parameter.s_TEXT));
			System.out.println("content: " + content.toString());
			
			QuestionHandler questionHandler = new QuestionHandler();
			response = String.valueOf(questionHandler.updateContent(questionId, content));
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return response;
    }
	
	@PUT
	@Path("/updateMandatory")
	@Consumes(MediaType.TEXT_PLAIN)
	@Produces(MediaType.TEXT_PLAIN)
    public String updateMandatory(String req) {
    	System.out.println("Opci�n: " + req);
    	JSONObject json = null;
    	String response = "";
    	try {
			json = new JSONObject(req);
			int questionId = Integer.parseInt(json.getString(Parameter.s_QID));
			int pageId = Integer.parseInt(json.getString(Parameter.s_PID));
			
			QuestionHandler questionHandler = new QuestionHandler();
			response = String.valueOf(questionHandler.updateMandatory(questionId, pageId));
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return response;
    }

	@PUT
	@Path("/updateIndex")
	@Consumes(MediaType.TEXT_PLAIN)
	@Produces(MediaType.TEXT_PLAIN)
    public String updateIndex(String req) {
    	System.out.println("Opci�n: " + req);
    	JSONObject json = null;
    	String response = "";
    	try {
			json = new JSONObject(req);
			int questionId = Integer.parseInt(json.getString(Parameter.s_QID));
			int pageId = Integer.parseInt(json.getString(Parameter.s_PID));
			int prevQuestionId = Integer.parseInt(json.getString(Parameter.s_PREV_ID));
			
			QuestionHandler questionHandler = new QuestionHandler();
			response = String.valueOf(questionHandler.updateIndex(questionId, prevQuestionId, pageId));
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return response;
    }
	
	@DELETE
	@Path("/{qid}/{pid}")
	@Consumes(MediaType.TEXT_PLAIN)
	@Produces(MediaType.TEXT_PLAIN)
    public String remove(@PathParam("qid") String qid, @PathParam("pid") String pid) {
    	System.out.println("Opci�n qid: " + qid + " - pid: " + pid);
    	JSONObject json = null;
    	String response = "";
    	//try {
			//json = new JSONObject(req);
			int questionId = Integer.parseInt(qid);
			int pageId = Integer.parseInt(pid);
			
			QuestionHandler questionHandler = new QuestionHandler();
			response = String.valueOf(questionHandler.removeQuestionByPage(questionId, pageId));
			
		/*} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
    	return response;
    }

}
