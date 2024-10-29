<%-- 
    Document   : product
    Created on : 15-Aug-2024, 5:44:08 pm
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
        <title>Product</title>
        <link rel="stylesheet" href="./home.css">
        <link rel="stylesheet" href="./product.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

        <style>
            #prodetails .single-pro-image {
                width: 40%;
                margin-right: 50px;
            }

            .small-img-group {
                display: flex;
                justify-content: space-between;
            }

            .small-img-col {
                flex-basis: 24%;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <section id="header">
            <!-- <a href="#"><img src="logo.png" alt="logo"></a> -->
            <h3 class="logo">Vmart</h3>

            <div class="">
                <ul id="navbar">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a class="active" href="product.jsp">Products</a></li>
                    <li><a href="orderDetail.jsp">Orders</a></li>
                    <li><a href="cart.jsp"><i class="far fa-shopping-bag"></i></a></li>
                </ul>
            </div>
        </section>
        

        <section id="Myheader">
            <h2>#stayhome</h2>
            <p>Save more with coupons & up to 70% off!!!</p>
         </section>
        

        <section id="product1" class="section-p1">
            <!-- <h1>Products</h1> -->
             
            <h2>New Arrivals</h2>
            <p>Summer Collection New Morden Design</p>

            <!-- <div class="mainContainer"> -->
                <div class="pro-container">
            
            <% 
            
            try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");
            
            String sql = "select * from product;";
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
        <!-- </div> -->
        </section>

    </body>
</html>
