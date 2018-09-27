package com.global.JSTL;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class MyCustomTagHandler extends TagSupport {
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        Calendar calendar = GregorianCalendar.getInstance();

        try {
            out.print("<style>\n" +
                    "@keyframes example {\n" +
                    "    from {background-color: white;}\n" +
                    "    to {background-color: lightgreen;}\n" +
                    "}\n " + "p {\n" +
                    "    width: 140px;\n" +
                    "    height: 19px;\n" +
                    "    background-color: lightblue;\n" +
                    "    animation-name: example;\n" +
                    "    animation-duration: 2s;\n" +
                    "    animation-iteration-count: infinite;\n" +
                    "} </style> \n" +
                    "<p>\n " + "Current time " + calendar.get(Calendar.HOUR_OF_DAY) +
                    ":" + calendar.get(Calendar.MINUTE)  + "</p>");

        } catch (Exception e) {
            System.out.println(e);
        }
        return SKIP_BODY;
    }
}
