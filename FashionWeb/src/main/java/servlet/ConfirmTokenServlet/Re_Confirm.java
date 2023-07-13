/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.ConfirmTokenServlet;

import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import servlet.Login.RegisterServlet;


@WebServlet(name = "Re_Confirm", urlPatterns = {"/Re_Confirm"})
public class Re_Confirm extends HttpServlet {

    private ConfirmTokenDAO dao = new ConfirmTokenDAO();
    private LoginDAO loginDAO = new LoginDAO();
    private RegisterServlet register = new RegisterServlet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        Account acc = loginDAO.getInfoAccByID(dao.findByToken(token).getAccID());
        if (acc != null) {
            String link = "http://localhost:8080/FashionWeb/Confirm?token=";
            try {
                register.sendLinkConfirm(acc, "Thank you for registering. Please click on the below link to activate your account:", link);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            } catch (MessagingException ex) {
                System.out.println("Error in re send confirm " + ex.getMessage());
            }

        }
    }

}
