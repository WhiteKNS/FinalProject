package com.springapp.mvc;


import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaResponse;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import sun.plugin2.message.Message;
import sun.plugin2.message.transport.Transport;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



import javax.servlet.ServletRequest;
import java.util.Map;
import java.util.Properties;


@Controller
@RequestMapping("/")
public class HelloController {

    @Autowired
    private ReCaptcha reCaptchaService = null;


    User user = new User();

    UserService userService;


    @RequestMapping("/index")
    public String listContacts(Map<String, Object> map) {

        map.put("user", new User());
        map.put("userList", userService.listUser());

        return "main";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                             BindingResult result) {

        userService.addUser(user);

        return "redirect:/index";
    }

    @RequestMapping("/delete/{userId}")
    public String userContact(@PathVariable("userId") Integer userId) {

        userService.removeUser(userId);

        return "redirect:/index";
    }

    @RequestMapping(value = "/in", method = RequestMethod.GET)
    public String in(@PathVariable("userId") Integer userId) {


        return "redirect:/login";
    }

    @RequestMapping(method = RequestMethod.GET )
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hello! My name is Natalia!");
        return "hello";
    }

    @RequestMapping(method = RequestMethod.GET, value = "404" )
    public String printError(ModelMap model) {
        model.addAttribute("message", "404 page");
        return "404";
    }

    @RequestMapping(method = RequestMethod.GET, value="contacts" )
    public String printContacts(ModelMap model) {
        model.addAttribute("message", "Contacts page");
        return "contacts";
    }



     @Autowired
     private FormValidator validator;


     @InitBinder
     protected void initBinder(WebDataBinder binder) {
         binder.setValidator(validator);
     }

    @RequestMapping(method = RequestMethod.GET, value = "main")
    public String editMain(ModelMap model){
        model.addAttribute("me", new User());
        user.setBirthdate("13.02.1990");
        user.setEmail("academic13forte@gmail.com");
        user.setFirstname("Natalia");
        user.setLastname("K");
        user.setLogin("academic13forte");
        user.setPassword("13021990");
        user.setPhone("1234567");
        model.addAttribute("user", new User());
        return "main";
    }

    @RequestMapping(method = RequestMethod.POST, value = "main")
    public String returnInfo(@Validated  User user,BindingResult result,
                             ServletRequest request, Model model){
        String challenge = request.getParameter("recaptcha_challenge_field");
        String response = request.getParameter("recaptcha_response_field");
        String remoteAddr = request.getRemoteAddr();
        model.addAttribute("me", new User());
        ReCaptchaResponse reCaptchaResponse = reCaptchaService.checkAnswer(remoteAddr, challenge, response);


        if (result.hasErrors()){
            return "main";
        }
        else

        if(reCaptchaResponse.isValid()) {
            model.addAttribute("message", "reCaptcha Hello World!");
           String to = user.getEmail();
            String from = "sender@abc.com";       // receiver email
            String host = "127.0.0.1";            // mail server host

            Properties properties = System.getProperties();
            properties.setProperty("mail.smtp.host", host);

            Session session = Session.getDefaultInstance(properties); // default session
            try {
                MimeMessage message = new MimeMessage(session); // email message

                message.setFrom(new InternetAddress(from)); // setting header fields

                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                message.setSubject("Your registration data"); // subject line

                // actual mail body
                message.setText("Hello, User");

                // Send message
                Transport.send(message); System.out.println("Email Sent successfully....");
            } catch (MessagingException mex){ mex.printStackTrace(); }

            return "result";
        } else {
            model.addAttribute("message", "Try again and prove it.");
            return "main";
        }

    }





}
