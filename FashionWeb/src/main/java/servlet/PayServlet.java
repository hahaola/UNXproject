package servlet;

import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

import model.*;

@WebServlet(name = "PayServlet", urlPatterns = {"/PayServlet"})
public class PayServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        System.out.println("\nPAY ORDER");

        OrderDAO dao = new OrderDAO();
        FashionDAO d = new FashionDAO();
        HttpSession session = request.getSession();

        List<Product> pl = (List<Product>) session.getAttribute("listP");
        double total = 0;

        Account acc = null;
        List<Order> ol = dao.getAllDetailOrder();
        List<Order> ordertList = new ArrayList<>();

        String url = "";

        List<Product> saleList = d.getNewProduct();
        List<Product> allP = d.getAllProduct();
        List<String> arrP = new ArrayList<>();
        // Split list into two part - one is for new product and another is old
        for (int i = 0; i < allP.size(); i++) {
            for (int j = 0; j < saleList.size(); j++) {
                if (allP.get(i).getPID().equals(saleList.get(j).getPID())) {
                    arrP.add(allP.get(i).getPID());
                }
            }
        }
        for (int i = 0; i < allP.size(); i++) {
            for (int j = 0; j < arrP.size(); j++) {
                if (allP.get(i).getPID().equals(arrP.get(j))) {
                    allP.remove(i);
                }
            }
        }

        List<BillOrder> bol = dao.getAllOrder();
        BillOrder saveL = null;

        if (((acc = (Account) session.getAttribute("NAME")) != null)) {
            if (!pl.isEmpty()) {
                total = (double) session.getAttribute("total");
                // save bill of order
                saveL = new BillOrder(IDOrder(bol), acc.getAccID(), total, null);
                dao.saveOrder(saveL.getOID(), saveL.getAccID(), saveL.getTotalBill());

                // Order detail of bill
                for (int j = 0; j < pl.size(); j++) {
                    //NOT SALE PRODUCT
                    for (int i = 0; i < allP.size(); i++) {
                        if (allP.get(i).getPID().equals(pl.get(j).getPID())) {
                            pl.get(j).setPrice((pl.get(j).getPrice() * pl.get(j).getQuantity()));
                            System.out.println("Not sale - " + pl.get(j).getNameP() + " - " + (pl.get(j).getPrice()));
                        }
                    }
                    // SALE PRODUCT
                    for (int i = 0; i < saleList.size(); i++) {
                        if (saleList.get(i).getPID().equals(pl.get(j).getPID())) {
                            pl.get(j).setPrice((pl.get(j).getPrice() / 2) * pl.get(j).getQuantity());
                            System.out.println("sale - " + pl.get(j).getNameP() + " - " + pl.get(j).getPrice());
                        }
                    }

                    if (ol.isEmpty()) {
                        System.out.println(IDetailDOrder1(ordertList) + " - " + pl.get(j).getNameP() + " - " + pl.get(j).getPrice() + " - " + pl.get(j).getQuantity());
                        ordertList.add(new Order(IDetailDOrder1(ordertList), pl.get(j).getPID(), pl.get(j).getQuantity(), pl.get(j).getPrice()));
                    } else {
                        System.out.println(IDetailDOrder(ol) + " - " + pl.get(j).getNameP() + " - " + pl.get(j).getPrice() + " - " + pl.get(j).getQuantity());
                        ordertList.add(new Order(IDetailDOrder(ol), pl.get(j).getPID(), pl.get(j).getQuantity(), pl.get(j).getPrice()));
                    }
                    System.out.println("ordertList size: " + ordertList.size());
                }
                for (Order o : ordertList) {
                    dao.saveDetailOrder(o.getOID(), o.getPid(), o.getOquantity(), o.getTotalMoney());
                }
                url = "OrderServlet";
            } else {
                System.out.println("Order food first");
                url = "HomeStoreServlet?page=1&sort=all";
                request.setAttribute("color", "#f44336");
                request.setAttribute("message", "<div class=\"alert\">\n"
                        + "  <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span> \n"
                        + "  PLEASE ORDER SOME CLOTHES FIRST\n"
                        + "</div>");
            }
        } else {
            System.out.println("login first");
            url = "login.jsp";
            request.setAttribute("show", "show");
            request.setAttribute("alert", "danger");
            request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> LOGIN FIRST");
        }

        System.out.println("\nOrder Bill: " + saveL);
        System.out.println("\nOrder detail: ");
        for (Order o : ordertList) {
            System.out.println(o.toString());
        }

        request.getRequestDispatcher(url).forward(request, response);
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

    String IDOrder(List<BillOrder> ol) {
        String id = "O";
        int no = 1;
        if (!ol.isEmpty()) {
            for (int o = 0; o < ol.size(); o++) {
                String OID[] = ol.get(o).getOID().split("O");
                for (int i = 1; i < OID.length; i++) {
                    int n = Integer.parseInt(OID[i]);
                    while (no <= n) {
                        no++;
                    }
                }

            }
        }
        return id + no;
    }

    String IDetailDOrder(List<Order> ol) {
        String id = "O";
        int no = 1;
        for (int o = 0; o < ol.size(); o++) {
            String OID[] = ol.get(o).getOID().split("O");
            for (int i = 1; i < OID.length; i++) {
                int n = Integer.parseInt(OID[i]);
                while (no <= n) {
                    no++;
                }
            }
        }
        return id + no;
    }

    String IDetailDOrder1(List<Order> ol) {
        String id = "O";
        int no = 1;
        for (int o = 0; o < ol.size(); o++) {
            String OID[] = ol.get(o).getOID().split("O");
            for (int i = 1; i < OID.length; i++) {
                int n = Integer.parseInt(OID[i]);
                while (no < n) {
                    no++;
                }
            }
        }
        return id + no;
    }
}
