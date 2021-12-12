<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ESEWeb.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Registration</title>
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
        <h1 class="auto-style2">New User</h1>
    </div>
        <br />        
                
        <asp:TextBox ID="txtUser" CssClass="text-box" placeholder="Username" runat="server"></asp:TextBox>                
        <asp:TextBox ID="txtPass" CssClass="text-box" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>                
        <asp:TextBox ID="txtConfirm" CssClass="text-box" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
        <asp:DropDownList CssClass="text-box" ID="ddlRoles" runat="server">
            <asp:ListItem Selected="True" Value="0">--ROLE--</asp:ListItem>
            <asp:ListItem Value="1">Admin</asp:ListItem>
            <asp:ListItem Value="2">Employee</asp:ListItem>
        </asp:DropDownList>                
        <br />
        <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Register" OnClick="btnRegister_Click" />
        <br />
        <br />
        <div class="flex-error-box">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirm" ErrorMessage="Password does not match" SetFocusOnError="True"></asp:CompareValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Must confirm password" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlRoles" InitialValue="0" ErrorMessage="Must select a role" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        </div>
        <p>Back to <a href="Login.aspx">Sign In</a></p><br />
    
    </div>
    </form>
</body>
</html>