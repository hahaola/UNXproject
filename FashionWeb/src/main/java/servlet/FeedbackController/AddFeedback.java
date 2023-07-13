/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.FeedbackController;

import DAO.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Feedback;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "AddFeedback", urlPatterns = {"/AddFeedback"})
public class AddFeedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Feedback feedback = new Feedback(
                request.getParameter("accID"),
                request.getParameter("product_id"),
                request.getParameter("comment"),
                Integer.parseInt(request.getParameter("rating"))
        );
        
        FeedbackDAO dao = new FeedbackDAO();
        dao.addFeedback(feedback);
        

    }

}
