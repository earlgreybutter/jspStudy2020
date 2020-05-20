package ch19;

import java.io.IOException;

import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.jasper.el.JspELException;

public class WelcomeTag extends SimpleTagSupport{

	@Override
	public void doTag() throws JspELException, IOException{
		getJspContext().getOut().println("Welcome to My Custom Tag");
	}
}
