package my.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

public class ControllerAction extends HttpServlet {
	
	private Map commandMap = new HashMap();

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String path = config.getServletContext().getRealPath("/");
		String props = config.getInitParameter("propertyConfig");
		
		Properties pr = new Properties();
		
		FileInputStream f = null;
		
		try {
			f = new FileInputStream(path+props);
			pr.load(f);
		}
		catch (IOException e) {
			// TODO: handle exception
			throw new ServletException(e);
		}
		finally {
			if(f!=null) {
				try {
					f.close();
				}
				catch (IOException ex) {
					// TODO: handle exception
				}
			}
		}
		
		Iterator keyIter = pr.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			}
			catch (ClassNotFoundException e) {
				// TODO: handle exception
				throw new ServletException(e);
			}
			catch (InstantiationException e) {
				// TODO: handle exception
				throw new ServletException(e);
			}
			catch (IllegalAccessException e) {
				throw new ServletException(e);				
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(req, resp);
	}
	
	private void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String view = null;
		CommandAction com = null;
		
		try {
			String command = req.getRequestURI();
			System.out.println(command);
			
			com = (CommandAction)commandMap.get(command);
			view = com.requestPro(req, resp);
			System.out.println(view);
			
		} catch (Throwable e) {
			// TODO: handle exception
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	
}
