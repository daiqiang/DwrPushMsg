package com.huatech.messageremind.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.directwebremoting.Browser;
import org.directwebremoting.Container;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.extend.ScriptSessionManager;
import org.directwebremoting.servlet.DwrServlet;

public class DwrScriptSessionManagerUtil extends DwrServlet{
	
	private static final long serialVersionUID = -7504612622407420071L;  
	//public static final Map<String, ScriptSession> scriptSessionMap = new HashMap<String, ScriptSession>();
	  
	
	public void init() throws ServletException {
		
		Container container = ServerContextFactory.get().getContainer();
		ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);
		
		//维护一个Map key为session的Id， value为ScriptSession对象
	    
		
		ScriptSessionListener listener = new ScriptSessionListener() {
			
			
			public void sessionCreated(ScriptSessionEvent ev) {
				HttpSession session = WebContextFactory.get().getSession();

				String userId =  (String) session.getAttribute("userId");
				System.out.println("a ScriptSession is created!");
				
				ev.getSession().setAttribute("userId", userId);
				
				//scriptSessionMap.put(session.getId(), scriptSession); 
			}

			public void sessionDestroyed(ScriptSessionEvent ev) {
				//不知道进入这个函数的时候srciptSession是不是已经被消除掉了
				//Collection<ScriptSession> sessions = Browser.getTargetSessions();
				//sessions.remove(ev.getSession());
				System.out.println("a ScriptSession is distroyed");
			}
		};
		manager.addScriptSessionListener(listener);
	}
}
