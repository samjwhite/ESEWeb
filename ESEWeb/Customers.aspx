<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="ESEWeb.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
          <div class="container">
        <%--search bar --%>
    <div class="row my-3">
        


        <asp:TextBox ID="txtCustomerSearch" runat="server" Width="290px"></asp:TextBox>
        <asp:Button ID="btnCustomerSearch" runat="server" Text="Search" />
        


    </div>

    <%--search results --%>    <%--onclick open Send Customer ID to gvCustomerDetail--%>
    <div class="row">
        
        <%--listbox--%>
        <div class="col-md-4">         

        <asp:ListBox ID="lbCustomers" runat="server" Height="128px" Width="292px" AutoPostBack="True" DataSourceID="customerLookup" DataTextField="custName" DataValueField="id"></asp:ListBox>
        
            <br />
            <br />
            <br />
        
            <asp:GridView ID="gvCustomerOrderDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="receiptData">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                    <asp:BoundField DataField="paymentID" HeaderText="paymentID" SortExpression="paymentID" />
                    <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                    <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                </Columns>
            </asp:GridView>
        
            <br />
            <br />
        
            </div>  
        <%--Order details--%>
        <div class="col-md-4"> 
            <%--Update leads to the CustomerUpdate Page. Remove promts confirmation. --%>

            <br />
            <asp:ObjectDataSource ID="customerLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.CustomerLookupDataSetTableAdapters.customerByNameTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCustomerSearch" DefaultValue="1" Name="custName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="receiptData" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.EmployeeLookupDataSetTableAdapters.receiptByCustIDTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_ordNumber" Type="String" />
                    <asp:Parameter Name="Original_ordDate" Type="DateTime" />
                    <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
                    <asp:Parameter Name="Original_paymentID" Type="Int32" />
                    <asp:Parameter Name="Original_custID" Type="Int32" />
                    <asp:Parameter Name="Original_empID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbCustomers" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_ordNumber" Type="String" />
                    <asp:Parameter Name="Original_ordDate" Type="DateTime" />
                    <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
                    <asp:Parameter Name="Original_paymentID" Type="Int32" />
                    <asp:Parameter Name="Original_custID" Type="Int32" />
                    <asp:Parameter Name="Original_empID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            </div>

    </div>

            </div>
</asp:Content>
