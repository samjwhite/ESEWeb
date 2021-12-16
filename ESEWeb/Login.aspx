<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ESEWeb.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Login</title>
    <!--Viewport-->
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"/> 
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            font-size: xx-large;
            margin: auto;
        }
    </style>
    <link rel="stylesheet" href="~/css/auth.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="flex-container">
        <div class="flex-title">
            <h1 class="auto-style2">Sign In</h1>
        </div>                       
            <asp:TextBox ID="txtUser" CssClass="text-box" placeholder="Username" runat="server"></asp:TextBox>                
            <asp:TextBox ID="txtPass" CssClass="text-box" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>                        
        <p>Forgot <a href="PassReset.aspx">Username/Password?</a></p>
        <asp:Button ID="Button1" class="btn" runat="server" Text="Login" OnClick="btnLogin_Click" BorderStyle="Solid" />
                
        <br />
        <br />
        <div class="flex-error-box">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
        <br />
        </div>
        <p>Don't have an account?</p>
        <a href="Registration.aspx">Sign Up Now</a><br />      
    </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>