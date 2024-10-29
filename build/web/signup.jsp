<%-- 
    Document   : signup
    Created on : 31-Aug-2024, 5:38:55 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Information Form</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="signup.css">
</head>
<body>
    <div class="covers">
    <div class="container">
        <h2>Customer Information</h2>
        <form action="Signin" method="post">
            <label for="name">User Name</label>
            <input type="text" id="name" name="uname" required>

            <label for="pass">Password</label>
            <input type="password" id="password" name="pass" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="address">Shipping Address</label>
            <textarea id="address" name="add" rows="5" required></textarea>

            <label for="city">City</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State/Province</label>
            <input type="text" id="state" name="state" required>

            <label for="zip">Zip/Postal Code</label>
            <input type="text" id="zip" name="zip" required>

            <label for="country">Country</label>
            <input type="text" id="country" name="country" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
