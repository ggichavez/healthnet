package org.openmrs.module.eref;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openmrs.api.context.Context;
import org.openmrs.module.eref.db.Ereferral;

public class ViewDeomPage extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException 
	{
		resp.sendRedirect("/guestbook.jsp");
	
}
}
