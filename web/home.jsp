<%-- 
    Document   : home
    Created on : 31-Aug-2024, 6:37:19 pm
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
        <title>Vmart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./home.css">
    </head>
    <body>
        <section id="header">
            <!-- <a href="#"><img src="logo.png" alt="logo"></a> -->
             <h3 class="logo">Vmart</h3>

            <div class="">
                <ul id="navbar">
                    <li><a class="active" href="home.jsp">Home</a></li>
                    <li><a href="product.jsp">Products</a></li>
                    <li><a href="">Orders</a></li>
                    <li><a href="cart.jsp"><i class="far fa-shopping-bag"></i></a></li>
                </ul>
            </div>
        </section>

        <section id="hero">
            <h4>Trade-in-offer</h4>
            <h2>Super value deals</h2>
            <h1>On all products</h1>
            <p>Save more with coupons & up to 70% off! </p>
            <button>Shop Now</button>
        </section>

        <section id="feature" class="section-p1">
            <div class="fe-box">
                <img src="features/f1.png" alt="">
                <h6>Free Shipping</h6>
            </div>

            <div class="fe-box">
                <img src="features/f2.png" alt="">
                <h6>Online Order</h6>
            </div>

            <div class="fe-box">
                <img src="features/f3.png" alt="">
                <h6>Save Money</h6>
            </div>

            <div class="fe-box">
                <img src="features/f4.png" alt="">
                <h6>Promotions</h6>
            </div>

            <div class="fe-box">
                <img src="features/f5.png" alt="">
                <h6>Happy Sell</h6>
            </div>

            <div class="fe-box">
                <img src="features/f6.png" alt="">
                <h6>F24/7 Support</h6>
            </div>
        </section>

        <section id="product1" class="section-p1">

            <h2>Featured Products</h2>
            <p>Summer Collection New Morden Design</p>
            <div class="pro-container">
                <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");
            
            String sql = "select * from product where arrivals = 'summer';";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                
                String name = rs.getString("pname");
                String info = rs.getString("pinfo");
                
                int price = rs.getInt("price");
                int pid = rs.getInt("productid");
        %>
        
            
                <div class="pro">
                    <a href="productInfo.jsp?id=<%=pid%>" class="pdetaila">
                    <img src="ImageGet?id=<%=pid%>" alt="">
                    <div class="des">
                        <span><%=name%></span>
                        <h5><%=info%></h5>
                        
                        <div class="star">
                            <%
                                int star = rs.getInt("rating");
                                for(int i = 1; i<=star; i++) {
                            %>
                                <i class="fas fa-star"></i>
                            <%}; %>
                        </div>
                        
                        <h4>₹ <%=price%></h4>
                    </div>
                    </a>
                    <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
                </div>

                
            
        
        <% }}
            catch(Exception e) {
                e.printStackTrace();
            }
            
            
        %>

                
            </div>
        </section>

        <section id="banner" class="section-m1">
            <h4>Repair Services</h4>
            <h2>Up to <span>70% Off</span> - All t-shirts & Accessories</h2>
            <button class="normal">Explore More</button>
        </section>

        <section id="product1" class="section-p1">

            <h2>New Arrivals</h2>
            <p>Summer Collection New Morden Design</p>
            <div class="pro-container">
                <% 
                    try {
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");

                    String sql = "select * from product where arrivals = 'new';";
                    PreparedStatement ps = con.prepareStatement(sql);

                    ResultSet rs = ps.executeQuery();

                    while(rs.next()) {

                        String name = rs.getString("pname");
                        String info = rs.getString("pinfo");

                        int price = rs.getInt("price");
                        int pid = rs.getInt("productid");
                %>


                        <div class="pro">
                            <a href="productInfo.jsp?id=<%=pid%>" class="pdetaila">
                            <img src="ImageGet?id=<%=pid%>" alt="">
                            <div class="des">
                                <span><%=name%></span>
                                <h5><%=info%></h5>

                                <div class="star">
                                    <%
                                        int star = rs.getInt("rating");
                                        for(int i = 1; i<=star; i++) {
                                    %>
                                        <i class="fas fa-star"></i>
                                    <%}; %>
                                </div>

                                <h4>₹ <%=price%></h4>
                            </div>
                            </a>
                            <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
                        </div>




                <% }}
                    catch(Exception e) {
                        e.printStackTrace();
                    }


                %>

                
            </div>
        </section>
    </body>
</html>
