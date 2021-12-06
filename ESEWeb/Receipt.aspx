<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="ESEWeb.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Employee:
            <asp:DropDownList ID="ddlEmployees" runat="server" DataSourceID="ObjectDataSource1" DataTextField="FullName" DataValueField="id" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="0">Select Employee</asp:ListItem>
            </asp:DropDownList> 
            <asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click" Text="Filter" />
            <br />
            Customer:<asp:DropDownList ID="ddlCustomers" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="FullName" DataValueField="id">
                <asp:ListItem Value="0">Filter By Customer</asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="gvReceipts" runat="server" OnSelectedIndexChanged="gvReceiptsIndexChanged">
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.employeeLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.customerLookUpTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>
