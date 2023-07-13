package servlet;

import Config.Config;
import DAO.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

import model.*;
import org.codehaus.jackson.map.ObjectMapper;

@WebServlet(name = "PayServlet", urlPatterns = {"/PayServlet"})
public class PayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("\n---PAY ORDER---");

        DateTimeFormatter CUSTOM_FORMATTER = DateTimeFormatter.ofPattern("uuuuMMddHHmmss");
        DateTimeFormatter formater = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        Date date = null;

        OrderDAO dao = new OrderDAO();
        FashionDAO d = new FashionDAO();
        HttpSession session = request.getSession();

        String address = String.valueOf(session.getAttribute("address"));
        System.out.println("address: " + address);

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
                if (orderReturn(request) == 1) {
                    total = (double) session.getAttribute("total");
                    // save bill of order
                    saveL = new BillOrder(IDOrder(bol), acc.getAccID(), total, null, address);
                    dao.saveOrder(saveL.getOID(), saveL.getAccID(), saveL.getTotalBill(), address);

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
                    }
                    for (Order o : ordertList) {
                        dao.saveDetailOrder(o.getOID(), o.getPid(), o.getOquantity(), o.getTotalMoney());
                    }
                    request.setAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef"));

                    // Create a new Locale
                    Locale vn = new Locale("vn", "VN");
                    // Create a formatter given the Locale
                    NumberFormat vndFormat = NumberFormat.getCurrencyInstance(vn);
                    request.setAttribute("vnp_Amount", vndFormat.format(Double.parseDouble(request.getParameter("vnp_Amount"))/100));

                    request.setAttribute("vnp_OrderInfo", request.getParameter("vnp_OrderInfo"));
                    request.setAttribute("vnp_TransactionNo", request.getParameter("vnp_TransactionNo"));
                    request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode"));

                    LocalDateTime expired = LocalDateTime.parse(request.getParameter("vnp_PayDate"), CUSTOM_FORMATTER);
                    request.setAttribute("vnp_PayDate", expired.format(formater));

                    request.setAttribute("vnp_TransactionStatus", request.getParameter("vnp_TransactionStatus"));
                    request.setAttribute("signValue", orderReturn(request));

                    request.getRequestDispatcher("order_return.jsp").forward(request, response);
                    System.out.println("Order Success");
                }
            } else {

                request.getRequestDispatcher("ShowCart").forward(request, response);
                request.setAttribute("msg", "Order First");
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        for (Order o : ordertList) {
            System.out.println(o.toString());
        }
    }

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

    private int orderReturn(HttpServletRequest request) {
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String name = null;
            String value = null;
            try {
                name = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                value = URLEncoder.encode(request.getParameter(name), StandardCharsets.US_ASCII.toString());
            } catch (UnsupportedEncodingException e) {
                System.out.println("Error payment result: " + e.getMessage());
            }
            if (name != null && value.length() > 0) {
                fields.put(name, value);
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }

            String signValue = Config.hashAllFields(fields);
            if (signValue.equals(vnp_SecureHash)) {
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }
        return -1;
    }
}
