<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="ESEWeb.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>Customers</h1>
            <hr />
             <p>&nbsp;</p>
             <p>
                 <asp:LinkButton ID="btnNewCustomer" runat="server" OnClick="btnNewCustomer_Click">New Customer</asp:LinkButton>
             </p>
   
   
    
        
        <div class="row">
        
         <asp:TextBox ID="txtCustomerSearch" runat="server" type="text"  placeholder="Customer name" Width="361px"></asp:TextBox>
 <asp:Button  class="btn btn-outline-primary" ID="btnSearch" runat="server" Text="Search"  />
         
   
            <br />
            <br />
         
   
       </div> 
        
            <div class="row">
            <div class="col-lg-6">
    <asp:ListBox ID="lbCustomers" runat="server" DataSourceID="customerSearchData" DataTextField="custName" DataValueField="id" Height="187px" Width="366px" OnSelectedIndexChanged="lbCustomers_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            <asp:Label ID="txtTest" runat="server"></asp:Label>
            
            
            <asp:DetailsView ID="dvCustomerDetails" runat="server" DataSourceID="customerData" Height="68px" Width="361px" Visible="false">
                <FooterTemplate>
                    <asp:Button ID="btnCustomerDetails" runat="server" OnClick="btnCustomerDetails_Click" Text="Details" />
                    <asp:Button ID="btnCustomerEdit" runat="server" Text="Edit" />
                </FooterTemplate>
            </asp:DetailsView>
            
            </div>
</div>

<div class="row">
    </div>

    
        <br />

        <asp:ObjectDataSource ID="customerSearchData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.CustomerLookupDataSetTableAdapters.customerByNameTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCustomerSearch" DefaultValue="1" Name="custName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="customerData" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.CustomerLookupDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        


        </div>
    </form>
</body>
</html>
