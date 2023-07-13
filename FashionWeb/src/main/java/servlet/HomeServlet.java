
package servlet;

import DAO.FashionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.category;

public class HomeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            FashionDAO dao = new FashionDAO();
            List<Product> listP = dao.getNewProduct();
            List<category> listC = dao.getAllCategory();

            List<Product> rateP = dao.sortProductDescByRate(0);

            List<Product> ratePAF = dao.sortProductCategoryByRate("C1", 0);
            List<Product> ratePIF = dao.sortProductCategoryByRate("C2", 0);
            List<Product> ratePINF = dao.sortProductCategoryByRate("C3", 0);

            // check product is sale or not but split to two array 1 is sale and the other is not
            List<Product> allP = dao.getAllProduct();
            List<String> arrP = new ArrayList<>();
            for (int i = 0; i < allP.size(); i++) {
                for (int j = 0; j < listP.size(); j++) {
                    if (allP.get(i).getPID().equals(listP.get(j).getPID())) {
                        arrP.add(allP.get(i).getPID());
                    }
                }
            }

            // remove product sale, only not sale
            for (int i = 0; i < allP.size(); i++) {
                for (int j = 0; j < arrP.size(); j++) {
                    if (allP.get(i).getPID().equals(arrP.get(j))) {
                        allP.remove(i);
                    }
                }
            }

            request.setAttribute("oldProduct", allP);
            request.setAttribute("listP", listP);
            request.setAttribute("listC", listC);
            request.setAttribute("rateP", rateP);

            if (ratePAF.size() > 3) {
                request.setAttribute("ratePAF1", ratePAF.subList(0, 3));
                request.setAttribute("ratePAF2", ratePAF.subList(3, ratePAF.size()));
            } else {
                request.setAttribute("ratePAF1", ratePAF);
            }

            if (ratePIF.size() > 3) {
                request.setAttribute("ratePIF1", ratePIF.subList(0, 3));
                request.setAttribute("ratePIF2", ratePIF.subList(3, ratePIF.size()));
            } else {
                request.setAttribute("ratePIF1", ratePIF);
            }

            if (ratePINF.size() > 3) {
                request.setAttribute("ratePINF1", ratePINF.subList(0, 3));
                request.setAttribute("ratePINF2", ratePINF.subList(3, ratePINF.size()));
            }
            else {
                request.setAttribute("ratePINF1", ratePINF);
            }

            request.getRequestDispatcher("index.jsp").include(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
