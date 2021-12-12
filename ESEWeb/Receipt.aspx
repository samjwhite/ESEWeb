<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="ESEWeb.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipts</title>

    <!--Style-->
    <link href="~/css/Base/base.css" rel="stylesheet" type="text/css" media="screen" runat="server"/>
    <link href="~/css/Modules/header.css" rel="stylesheet" type="text/css" media="screen" runat="server" />
    <link href="~/css/layout.css" rel="stylesheet" type="text/css" media="screen" runat="server" />


    <!--Components-->
    <script src="./Scripts/components/headerComponent.js"></script>

    <!--Viewport-->
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"/> 
</head>
<body>
    <header-template></header-template>
    <main>
        <form id="form1" runat="server">
            <div>
                <div>
                <asp:Label ID="Label2" runat="server" Text="Employee:"></asp:Label>                
                <asp:DropDownList ID="ddlEmployees" class="ddl" runat="server" DataSourceID="ObjectDataSource1" DataTextField="FullName" DataValueField="id" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="0">Select Employee</asp:ListItem>
                </asp:DropDownList>                 
                <br />
                <asp:Label ID="Label1" runat="server" Text="Customer:"></asp:Label>
                <asp:DropDownList ID="ddlCustomers" class="ddl" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="FullName" DataValueField="id">
                    <asp:ListItem Value="0">Filter By Customer</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnFilter" class="button" runat="server" OnClick="btnFilter_Click" Text="Filter" />
                
                <asp:GridView ID="gvReceipts" runat="server" OnSelectedIndexChanged="gvReceiptsIndexChanged" HeaderStyle-CssClass="headerStyle" RowStyle-CssClass="rowStyle" BorderStyle="None" CellPadding="10">
                </asp:GridView>
                </div>
            </div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.employeeLookUpTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.customerLookUpTableAdapter"></asp:ObjectDataSource>
        </form>
    </main>
</body>
</html>
