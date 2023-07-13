/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.FeedbackController;

import DAO.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "GetFeedback", urlPatterns = {"/GetFeedback"})
public class GetFeedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("product_id");
        String offset = request.getParameter("offset");
        
        System.out.println(id + " - " + offset);

        FeedbackDAO dao = new FeedbackDAO();
        LoginDAO accDAO = new LoginDAO();

        List<Feedback> list = dao.getFeedbackPagination(id, Integer.parseInt(offset));
        List<detailFeedback> details = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            details.add(new detailFeedback(
                    list.get(i),
                    accDAO.getInfoAccByID(list.get(i).getAccID())
            ));
        }

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }

        String json = new Gson().toJson(details);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(json);
        out.flush();
    }
}

class detailFeedback {

    private Feedback feedback;
    private Account acc;

    public detailFeedback(Feedback feedback, Account acc) {
        this.feedback = feedback;
        this.acc = acc;
    }

}
