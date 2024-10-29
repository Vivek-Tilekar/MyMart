/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author user
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            int userId = (Integer) session.getAttribute("userId");
            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String expDate = request.getParameter("expDate");
            String cvv = request.getParameter("cvv");
            String paymentStatus = "Paid";  // Assuming payment is successful
            Date orderDate;  // Current date as order date
            orderDate = new Date();

            int orderId = 0;
            int totalAmount = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");

                // Calculate total amount from the cart
                String totalSql = "SELECT SUM(p.price * c.quantity) AS total FROM cart c JOIN product p ON c.product_id = p.productid WHERE c.user_id = ?";
                PreparedStatement psTotal = con.prepareStatement(totalSql);
                psTotal.setInt(1, userId);
                ResultSet rsTotal = psTotal.executeQuery();
                if (rsTotal.next()) {
                    totalAmount = rsTotal.getInt("total");
                }

                // Insert into order_detail table
                String insertSql = "INSERT INTO order_detail (user_id, product_id, quantity, total_price, order_date, status) "
                        + "SELECT c.user_id, c.product_id, c.quantity, (p.price * c.quantity), ?, ? "
                        + "FROM cart c JOIN product p ON c.product_id = p.productid WHERE c.user_id = ?";
                PreparedStatement psInsert = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
                psInsert.setDate(1, new java.sql.Date(orderDate.getTime()));
                psInsert.setString(2, paymentStatus);
                psInsert.setInt(3, userId);
                psInsert.executeUpdate();

                // Clear the user's cart after order is placed
//                String deleteCartSql = "DELETE FROM cart WHERE user_id = ?";
//                PreparedStatement psDeleteCart = con.prepareStatement(deleteCartSql);
//                psDeleteCart.setInt(1, userId);
//                psDeleteCart.executeUpdate();

                response.sendRedirect("home.jsp");  // Redirect to a confirmation page

            } catch (Exception e) {
                e.printStackTrace();
            }
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
