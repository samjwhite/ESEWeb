<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="ESEWeb.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" Width="242px">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:ListBox ID="lbCustomers" runat="server" AutoPostBack="True" Height="56px" Width="236px"></asp:ListBox>
            <br />
            <br />
            <br />
            <asp:FormView ID="fvCustomerDetails" runat="server">
            </asp:FormView>
            <br />
        </div>
    </form>
</body>
</html>
