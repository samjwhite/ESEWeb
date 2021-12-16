<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceOrders.aspx.cs" Inherits="ESEWeb.ServiceOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Orders</title>

    <!--Style-->
    <link href="~/css/Modules/header.css" rel="stylesheet" type="text/css" media="screen" runat="server" />

    <!--Components-->
    <script src="./Scripts/components/headerComponent.js"></script>

    <!--Viewport-->
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"/>
</head>
<body>
    <header-template></header-template>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvServiceOrders" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
