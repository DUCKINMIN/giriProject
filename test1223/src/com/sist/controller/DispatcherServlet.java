package com.sist.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WebApplicationContext wc;
	private List<String> list = new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("contextConfigLocation");
		wc=new WebApplicationContext(path);
		list = wc.getList();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			cmd = cmd.substring(request.getContextPath().length()+1);
			
			for (String s : list) {
				Class clsName = Class.forName(s);
				if (clsName.isAnnotationPresent(Controller.class) == false) {
					continue;
				}
				Object obj = clsName.newInstance();
				Method[] method = clsName.getDeclaredMethods();
				for (Method m : method) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if (rm.value().equals(cmd)) {
						String jsp = (String)m.invoke(obj, request,response);
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return;
					}
				}
			}
		} catch (Exception e) {
			System.out.println("service : "+e.getMessage());
		}
	}

}
