<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ESEWeb.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>

    <!--Style-->
    <link href="~/css/Modules/header.css" rel="stylesheet" />
    <link href="~/css/Base/base.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>

    <!--Components-->
    <script src="./Scripts/components/headerComponent.js"></script>

    <!--Viewport-->
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"/> 
</head>
<body>
    <header-template></header-template>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome</h1>
            <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
