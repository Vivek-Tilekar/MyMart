<%-- 
    Document   : cart
    Created on : 20-Aug-2024, 6:20:09 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="home.css">
        <link rel="stylesheet" href="./cart.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    </head>
    <body>
        <section id="header">
            <!-- <a href="#"><img src="logo.png" alt="logo"></a> -->
            <h3 class="logo">Vmart</h3>

            <div class="">
                <ul id="navbar">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="product.jsp">Products</a></li>
                    <li><a href="#">Orders</a></li>
                    <li><a href="home.html" class="active"><i class="far fa-shopping-bag"></i></a></li>
                </ul>
            </div>
        </section>
        

        <section id="Myheader">
            <h2>#Your Cart</h2>
            <p>This are the products that you want to buy!!!</p>
         </section>

         <section id="cart" class="section-p1">
            <table width="100%">
                <thead>
                    <tr>
                        <td>Remove</td>
                        <td>Image</td>
                        <td>Product</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Subtotal</td>
                    </tr>
                </thead>
                <tbody>
                    
                    <% 
//                        int userId = (Integer) session.getAttribute("userId");
                        int carttotal = 0;
                        
                        try {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");

                        String sql = "SELECT c.cart_id,p.pname,p.productid, p.price,c.quantity, (p.price * c.quantity) AS total_price,c.added_at FROM cart c JOIN product p ON c.product_id = p.productid WHERE c.user_id = ?;";
                        
                        PreparedStatement ps = con.prepareStatement(sql);
                        
                        ps.setInt(1, userId);

                        ResultSet rs = ps.executeQuery();
                        
                        while(rs.next()) {
                        
                            String name = rs.getString("pname");
                            int cid = rs.getInt("cart_id");

                            int price = rs.getInt("price");
                            int pid = rs.getInt("productid");
                            int totalprc = rs.getInt("total_price");
                            int qt = rs.getInt("quantity");
                            
                            carttotal += totalprc;
                        
                        
                    %>
                    <tr>
                        <td><a href="CartRemove?id=<%=cid%>"><i class="far fa-times-circle"></i></a></td>
                        <td><img src="ImageGet?id=<%=pid%>" alt=""></td>
                        <td><%=name%></td>
                        <td>₹ <%=price%></td>
                        <td><input type="number" name="qt" value="<%=qt%>"></td>
                        <td>₹<%=totalprc%></td>
                    </tr>
                    
                    <%
                        }
                        }catch(Exception e) {
                            e.printStackTrace();
                        }
                    %>

<!--                    <tr>
                        <td><a href="#"><i class="far fa-times-circle"></i></a></td>
                        <td><img src="f8.jpg" alt=""></td>
                        <td>Cartoon Astronaut T-shirts</td>
                        <td>₹ 1245</td>
                        <td><input type="number" name="qt" value="1"></td>
                        <td>₹145</td>
                    </tr>-->

                    
                </tbody>
            </table>
         </section>

         <section id="cart-add" class="section-p1">
            <div id="coupon">
                <h3>Apply Coupon</h3>
                <div>
                    <input type="text" placeholder="Enter Your Coupon">
                    <button class="normal">Apply</button>
                </div>
            </div>

            <div id="subtotal">
                <h3>Cart Subtotal</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>₹ <%=carttotal%></td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>₹ <%=carttotal%></strong></td>
                    </tr>
                </table>
                    <a href="checkout.jsp" style="background: #088178;
                    color: #fff;
                    text-decoration: none;
                    font-size: 16px;
                    font-weight: 600;
                    transition: 0.3s ease;
                    padding: 15px 30px;
                    border: none;
                    border-radius: 4px;
                    margin-top: 20px;">Proceed to checkout</a>
            </div>
         </section>
    </body>
</html>

<!-- https://youtu.be/yVjh7zDhF9s?si=WtBFgShLNVXeJQVQ&t=683 -->
