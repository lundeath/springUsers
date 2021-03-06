package com.global.controller;

import com.global.model.Role;
import com.global.model.User;
import com.global.service.UserService;
import com.global.utils.Scrambler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(@ModelAttribute("user") User user, HttpServletRequest request,
                         HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
            }
        }
        HttpSession session = request.getSession(false);
        session.invalidate();

        return "redirect:/login";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());

        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, HttpServletRequest request) {
        if (user.getId() == 0) {
            user.setRole(new Role(Integer.parseInt(request.getParameter("role_id"))));
            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }

        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);

        return "redirect:/users";
    }

    @RequestMapping(value = "edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {

        model.addAttribute("user", this.userService.getUserById(id));

        return "edit";
    }

    @RequestMapping(value = "/submitChanges/{id}", method = RequestMethod.POST)
    public String submitChanges(@PathVariable("id") int id, @ModelAttribute("user") User user,
                                HttpServletRequest request) {
        user.setRole(new Role(Integer.parseInt(request.getParameter("role_id"))));
        this.userService.updateUser(user);

        return "redirect:/users";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "userdata";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(@ModelAttribute("user") User user, Model model) {
        model.addAttribute("user", new User());

        return "register";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage(@ModelAttribute("user") User user, Model model) {
        model.addAttribute("user", new User());

        return "login";
    }

    @RequestMapping(value = "/users/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("user") User user, Model model,
                        HttpServletRequest request,
                        HttpServletResponse response) {

        boolean wrong = false;

        for (User u : this.userService.listUsers()
        ) {
            if (u.getFirstName().equals(user.getFirstName()) &&
                    u.getLastName().equals(user.getLastName())) {

                model.addAttribute("user", new User());
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                //generate a new session
                HttpSession newSession = request.getSession(true);

                //setting session to expiry in 20 mins
                newSession.setMaxInactiveInterval(20 * 60);

                Cookie username = new Cookie("username", request.getParameter("firstName"));
                Cookie userrole = new Cookie("userrole", u.getRole().getName());
                //encrypting last name
                String lastNameCrypted = Scrambler.base64encode(request.getParameter("lastName"));
                Cookie userlastname = new Cookie("userlastname", lastNameCrypted);
                username.setDomain("localhost");
                userrole.setDomain("localhost");
                userlastname.setDomain("localhost");
                username.setPath("/");
                userrole.setPath("/");
                userlastname.setPath("/");
                response.addCookie(username);
                response.addCookie(userrole);


                response.addCookie(userlastname);

                return "redirect:/users";
            }
        }
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }
        wrong = true;
        model.addAttribute("wrong", wrong);
        return "login";

    }
}