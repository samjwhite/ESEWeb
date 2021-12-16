<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="ESEWeb.CustomerDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Details</title>
    
    
    
    
    <style type="text/css">
        .auto-style2 {
            width: 84px;
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 84px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">

       <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div>

            <div class="row mb-3">
                <div class="col-md-4">
                   
            <h2> <asp:label id="txtCustomerName" runat="server"></asp:label></h2>
        
            <hr />
            
        
        
    <asp:FormView ID="fvCustomerDetails" runat="server" DataKeyNames="id" DataSourceID="customerData" Width="337px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            custFirst:
            <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
            <br />
            custLast:
            <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
            <br />
            custPhone:
            <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
            <br />
            custAddress:
            <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
            <br />
            custCity:
            <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
            <br />
            custPostal:
            <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
            <br />
            custEmail:
            <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="UpdateButton_Click" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            custFirst:
            <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
            <br />
            custLast:
            <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
            <br />
            custPhone:
            <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
            <br />
            custAddress:
            <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
            <br />
            custCity:
            <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
            <br />
            custPostal:
            <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
            <br />
            custEmail:
            <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="col-md-8 table-primary table-striped">
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td class="auto-style3">
                        <asp:Label ID="custFirstLabel" runat="server" Text='<%# Bind("custFirst") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Last Name</td>
                    <td>
                        <asp:Label ID="custLastLabel" runat="server" Text='<%# Bind("custLast") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style4">Phone</td>
                    <td>
                        <asp:Label ID="custPhoneLabel" runat="server" Text='<%# Bind("custPhone") %>' />
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style4">Address</td>
                    <td>
                        <asp:Label ID="custAddressLabel" runat="server" Text='<%# Bind("custAddress") %>' />
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style4">City</td>
                    <td>
                        <asp:Label ID="custCityLabel" runat="server" Text='<%# Bind("custCity") %>' />
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style4">Postal Code</td>
                    <td>
                        <asp:Label ID="custPostalLabel" runat="server" Text='<%# Bind("custPostal") %>' />
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style4">Email</td>
                    <td>
                        <asp:Label ID="custEmailLabel" runat="server" Text='<%# Bind("custEmail") %>' />
                     </td>
                </tr>
               
            </table>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClick="DeleteButton_Click" OnClientClick="return confirm('Are you sure you want to delete this customer? After confirmation you will be redirected to Customers page.')"/>
            &nbsp;
        </ItemTemplate>
        </asp:FormView>


                </div>
                <div class="col-md-8">
                    <hr />
            <h2>Orders</h2>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="receiptData" AllowSorting="True" >
                <Columns>
                    <asp:CommandField SelectText="Details &amp; Edit" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" ReadOnly="True" />
                    <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                    <asp:BoundField DataField="payType" HeaderText="Payment" SortExpression="payType" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" ReadOnly="True" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="custName" HeaderText="Customer" ReadOnly="True" SortExpression="custName" />
                </Columns>
            </asp:GridView>
                    <br />
            <asp:ObjectDataSource ID="receiptData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.CustomerLookupDataSetTableAdapters.receiptTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="custID" QueryStringField="customerID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

                    <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Back</asp:LinkButton>

                </div>




            </div>
             
          


            
            
            
        </div>
    </form>
</body>
</html>
