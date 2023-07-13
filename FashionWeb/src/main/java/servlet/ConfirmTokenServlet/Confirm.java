/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.ConfirmTokenServlet;

import DAO.ConfirmTokenDAO;
import DAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.ConfirmToken;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "Confirm", urlPatterns = {"/Confirm"})
public class Confirm extends HttpServlet {

    private final ConfirmTokenDAO dao = new ConfirmTokenDAO();
    private final LoginDAO loginDAO = new LoginDAO();
    private final static DateTimeFormatter CUSTOM_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token_confirm");

        int result = confirmToken(token);
        
        switch (result) {
            case 0 -> {
                request.setAttribute("notice", "Confirm Success");
                request.setAttribute("alert", "You now can go back to login");
                request.setAttribute("link", "http://localhost:8080/FashionWeb/login.jsp");
                request.setAttribute("type", "Login Page");
            }
            case 1 -> {
                request.setAttribute("notice", "Oops");
                request.setAttribute("alert", "You Already Confirm, Please Login To Access Page");
                request.setAttribute("link", "http://localhost:8080/FashionWeb/login.jsp");
                request.setAttribute("type", "Login Page");
            }
            case 2 -> {
                request.setAttribute("notice", "Oops");
                request.setAttribute("alert", "Your Confirm Has Expired, Please Press Re-send The Link Confirm");
                request.setAttribute("link", "http://localhost:8080/FashionWeb/Re_Confirm?token=" + token);
                request.setAttribute("type", "Re-send Confirm");
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("Notice_Page.jsp");
        rd.forward(request, response);
    }

    private int confirmToken(String token) {
        ConfirmToken confirm = dao.findByToken(token);
        if (confirm.getConfirmAt() != null) {
            return 1; //Already confirm
        }
        LocalDateTime expired = LocalDateTime.parse(confirm.getExpireAt(), CUSTOM_FORMATTER);
        if (expired.isBefore(LocalDateTime.now())) {
            return 2; // Expired
        }

        dao.updateConfirmToken(token, LocalDateTime.now().format(CUSTOM_FORMATTER));
        setEnableAccount(loginDAO.getInfoAccByID(confirm.getAccID()));
        return 0;
    }

    private void setEnableAccount(Account acc) {
        loginDAO.updateAcc(acc.getAccID(), acc.getUsername(), acc.getPassword(), acc.getFullname(), acc.getEmail(), acc.getRoleID(), true);
    }

}
