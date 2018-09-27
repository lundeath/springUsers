package com.global.controller.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext context = filterConfig.getServletContext();
        context.log("AuthenticationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        String role = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userrole")) role = cookie.getValue();
            }

            if (role != null && role.equals("user"))
            {   //checking user roots
                System.out.println("Unauthorized access request to Edit feature");
                res.sendRedirect(req.getContextPath() + "/users");
            } else {
                // pass the request along the filter chain
                filterChain.doFilter(servletRequest, servletResponse);
            }

        }
    }

    @Override
    public void destroy() {

    }
}
