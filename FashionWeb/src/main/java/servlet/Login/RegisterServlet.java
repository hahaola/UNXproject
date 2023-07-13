/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Login;

import DAO.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.text.AbstractDocument.Content;
import model.*;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private ConfirmTokenDAO dao = new ConfirmTokenDAO();
    private LoginDAO loginDAO = new LoginDAO();
    private final static DateTimeFormatter CUSTOM_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "";

        LoginDAO dao = new LoginDAO();
        ArrayList<Account> accl = dao.getAllAcc();

        String id = autoIncreaseID(accl);
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String passCheck = request.getParameter("pass1");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        if (checkDuplicateUserName(username, accl)) {
            request.setAttribute("show", "show");
            request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> Username's exist");
            url = "login.jsp";
        } else {
            if (password.equals(passCheck)) {
                Account acc = new Account(id, username, password, name, email, "R02", false);

                String link = "http://localhost:8080/FashionWeb/Confirm?token_confirm=";

                try {
                    //Send link confirm
                    dao.NewAcc(id, username, password, name, email, "R02", false);

                    sendLinkConfirm(acc, "Thank you for registering. Please click on the below link to activate your account: ", link);

                } catch (MessagingException ex) {
                    System.out.println("Error in sending link " + ex.getMessage());
                }

                url = "login.jsp";
            } else {
                request.setAttribute("show", "show");
                request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> RE-Enter Password is not match!");
                url = "login.jsp";

            }
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    public void sendLinkConfirm(Account acc, String msg, String link) throws MessagingException {
        ConfirmToken token = createTokenConfirm(acc);
        dao.saveConfirmToken(token);
        send(acc.getEmail(), buildEmail(acc.getFullname(), link + token.getToken(), msg));
    }

    private ConfirmToken createTokenConfirm(Account acc) {

        return new ConfirmToken(
                UUID.randomUUID().toString(),
                LocalDateTime.now().format(CUSTOM_FORMATTER),
                LocalDateTime.now().plusMinutes(10).format(CUSTOM_FORMATTER),
                null,
                acc.getAccID()
        );
    }

    public void send(String emailTo, String content) throws MessagingException, MessagingException, AddressException {
        final String username = "nhattantran267@gmail.com";
        final String password = "szyubybwjgcsnxwj";
        Properties prop = new Properties();
//        prop.put("mail.smtp.ssl.trust", "*");
//        prop.put("mail.smtp.user", username);
//        prop.put("mail.smtp.password", password);
//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.startttls.enable", "true");
        SmtpAuthenticator auth = new SmtpAuthenticator();
        prop.put("mail.smtp.ssl.trust", "*");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

//        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthencation() {
//                return new PasswordAuthentication(username, password);
//            }
//        });
        try {
            Message msg = new MimeMessage(Session.getDefaultInstance(prop, auth));

            msg.setFrom(new InternetAddress(username));
            msg.setRecipient(Message.RecipientType.TO, InternetAddress.parse(emailTo)[0]);
            msg.setSubject("Confirm Your Email");
            msg.setContent(content, "text/html; charset=utf-8");
            Transport.send(msg);
            System.out.println("DONE CONFIRM");
        } catch (Exception e) {
            System.out.println("Error in send email " + e.getMessage());
        }

    }

    //-------------------------------------------------------------------------------------------
    String autoIncreaseID(ArrayList<Account> ls) {
        String id = "";
        int noId = 1;

        for (int i = 0; i < ls.size(); i++) {
            String[] str = ls.get(i).getAccID().split("A");
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        if (noId <= 9) {
            id = "A" + "0" + noId;
        } else {
            id = "A" + noId;
        }
        return id;
    }

    boolean checkDuplicateUserName(String name, ArrayList<Account> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getUsername().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    //-------------------------------------------------------------------------------------------
    private String buildEmail(String name, String link, String MSG) {
        return "<div style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;margin:0;color:#0b0c0c\">\n"
                + "\n"
                + "<span style=\"display:none;font-size:1px;color:#fff;max-height:0\"></span>\n"
                + "\n"
                + "  <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;min-width:100%;width:100%!important\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                + "    <tbody><tr>\n"
                + "      <td width=\"100%\" height=\"53\" bgcolor=\"#0b0c0c\">\n"
                + "        \n"
                + "        <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;max-width:580px\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">\n"
                + "          <tbody><tr>\n"
                + "            <td width=\"70\" bgcolor=\"#0b0c0c\" valign=\"middle\">\n"
                + "                <table role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n"
                + "                  <tbody><tr>\n"
                + "                    <td style=\"padding-left:10px\">\n"
                + "                  \n"
                + "                    </td>\n"
                + "                    <td style=\"font-size:28px;line-height:1.315789474;Margin-top:4px;padding-left:10px\">\n"
                + "                      <span style=\"font-family:Helvetica,Arial,sans-serif;font-weight:700;color:#ffffff;text-decoration:none;vertical-align:top;display:inline-block\">Confirm your email</span>\n"
                + "                    </td>\n"
                + "                  </tr>\n"
                + "                </tbody></table>\n"
                + "              </a>\n"
                + "            </td>\n"
                + "          </tr>\n"
                + "        </tbody></table>\n"
                + "        \n"
                + "      </td>\n"
                + "    </tr>\n"
                + "  </tbody></table>\n"
                + "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n"
                + "    <tbody><tr>\n"
                + "      <td width=\"10\" height=\"10\" valign=\"middle\"></td>\n"
                + "      <td>\n"
                + "        \n"
                + "                <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n"
                + "                  <tbody><tr>\n"
                + "                    <td bgcolor=\"#1D70B8\" width=\"100%\" height=\"10\"></td>\n"
                + "                  </tr>\n"
                + "                </tbody></table>\n"
                + "        \n"
                + "      </td>\n"
                + "      <td width=\"10\" valign=\"middle\" height=\"10\"></td>\n"
                + "    </tr>\n"
                + "  </tbody></table>\n"
                + "\n"
                + "\n"
                + "\n"
                + "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n"
                + "    <tbody><tr>\n"
                + "      <td height=\"30\"><br></td>\n"
                + "    </tr>\n"
                + "    <tr>\n"
                + "      <td width=\"10\" valign=\"middle\"><br></td>\n"
                + "      <td style=\"font-family:Helvetica,Arial,sans-serif;font-size:19px;line-height:1.315789474;max-width:560px\">\n"
                + "        \n"
                + "            <p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\">Hi " + name + ",</p><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\">" + MSG + "</p><blockquote style=\"Margin:0 0 20px 0;border-left:10px solid #b1b4b6;padding:15px 0 0.1px 15px;font-size:19px;line-height:25px\"><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> <a href=\"" + link + "\">Activate Now</a> </p></blockquote>\n Link will expire in 10 minutes. <p>See you soon</p>"
                + "        \n"
                + "      </td>\n"
                + "      <td width=\"10\" valign=\"middle\"><br></td>\n"
                + "    </tr>\n"
                + "    <tr>\n"
                + "      <td height=\"30\"><br></td>\n"
                + "    </tr>\n"
                + "  </tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n"
                + "\n"
                + "</div></div>";
    }
}
