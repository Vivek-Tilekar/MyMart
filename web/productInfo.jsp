<%-- 
    Document   : productInfo
    Created on : 16-Aug-2024, 11:34:10 am
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
        <title>Product Detail</title>
        <link rel="stylesheet" href="./product.css">
        <link rel="stylesheet" href="./home.css">
    </head>
    <body>

        <section id="header">
            <!-- <a href="#"><img src="logo.png" alt="logo"></a> -->
            <h3 class="logo">Vmart</h3>

            <div class="">
                <ul id="navbar">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a class="active" href="product.jsp">Products</a></li>
                    <li><a href="">Orders</a></li>
                    <li><a href="cart.jsp"><i class="far fa-shopping-bag"></i></a></li>
                </ul>
            </div>
        </section>

        <% 
            String id = request.getParameter("id");
            
//            int userId = (Integer) session.getAttribute("userId");
            
            int pid = Integer.parseInt(id);
            int temp = pid;
            session.setAttribute("pid", pid);
            
            
            
             try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/vmart", "root", "vivek17");
            
            String sql = "select * from product where productid=" + pid;
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                
                String name = rs.getString("pname");
                String info = rs.getString("pinfo");
                
                int price = rs.getInt("price");
            
        %>
        <section id="prodetails" class="section-p1">
            <div class="single-pro-image">
                <img src="ImageGet?id=<%=pid%>" width="100%" alt="" id="MainImg">

                <div class="small-img-group">
                    
                        <%
                            for(int i = 1; i<=4; i++) {
                        %>
                        <div class="small-img-col">
                            <img src="ImageGet?id=<%=temp +i%>" alt="" width="100%" class="small-img">
                        </div>
                        <%
                            };
                        %>
                    
                </div>
            </div>

            <div class="single-pro-details">
                <h5>Home / T-shirts</h5>

                <h4><%=name%></h4>
                <h2>₹ <%=price%></h2>
                <form action="Cartinfo">
                    <select name="size" required="true">
                    <option value="">Select Size</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
                    <option value="Small">Small</option>
                    <option value="Large">Large</option>
                </select>

                <input type="number" name="quantity" value="1">
                <button class="normal" type="submit">Add TO Cart</button>
                </form>
                <h4>Product Details</h4>
                <span>
                    <!-- The Gilden Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring a taped neck and shoulder, and a seamless double-needle coller, and available in a range of colors, it offers it all in the ultimate hand-turning package. -->
                    <b>Product Dimensions: </b> 27.5 x 22.5 x 2 cm; 300 g <br>
                    <b>Date First Available:</b>  17 April 2024 <br>
                    <b>Manufacturer: </b> ABFRL <br>
                    <b>ASIN:</b> B0D1XQCGWZ <br>
                    <b>Item model number: </b> PCSFTSLPS08698 <br>
                    <b>Country of Origin:</b> India <br>
                    <b>Department:</b> Men <br>
                    <b>Manufacturer:</b> ABFRL, Aditya Birla Fashion & Retail Ltd, 7th Flr, Skyline Ikon Business Park, AK Road, Andheri East, Mumbai-400059 <br>
                    <b>Packer:</b> Aditya Birla Fashion & Retail Ltd, 7th Flr, Skyline Ikon Business Park, AK Road, Andheri East, Mumbai-400059 <br>
                    <b>Item Weight:</b> 300 g
                    
                    
                    <h1></h1>
                </span>
            </div>
        </section>
        
        <% 
            }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </body>

    <!-- https://youtu.be/99muDSuP55s?si=msCpJJ6wd_yKbymh&t=1076 -->
</html>
