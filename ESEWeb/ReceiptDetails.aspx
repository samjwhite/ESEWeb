<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptDetails.aspx.cs" Inherits="ESEWeb.ReceiptDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt #<%= Request.QueryString.Get("ID") %></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1><%= Request.QueryString.Get("CustomerName") %></h1>            
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    ordNumber:
                    <asp:TextBox ID="ordNumberTextBox" runat="server" Text='<%# Bind("ordNumber") %>' />
                    <br />
                    ordDate:
                    <asp:TextBox ID="ordDateTextBox" runat="server" Text='<%# Bind("ordDate") %>' />
                    <br />
                    ordPaid:
                    <asp:CheckBox ID="ordPaidCheckBox" runat="server" Checked='<%# Bind("ordPaid") %>' />
                    <br />
                    paymentID:
                    <asp:DropDownList ID="ddlReceiptPay" runat="server" DataSourceID="ObjectDataSource2" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                    </asp:DropDownList>
                    <br />
                    custID:
                    <asp:DropDownList ID="ddlReceiptCust" runat="server" DataSourceID="ObjectDataSource3" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                    </asp:DropDownList>
                    <br />
                    empID:
                    <asp:DropDownList ID="ddlReceiptEmp" runat="server" DataSourceID="ObjectDataSource4" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    ordNumber:
                    <asp:TextBox ID="ordNumberTextBox" runat="server" Text='<%# Bind("ordNumber") %>' />
                    <br />
                    ordDate:
                    <asp:TextBox ID="ordDateTextBox" runat="server" Text='<%# Bind("ordDate") %>' />
                    <br />
                    ordPaid:
                    <asp:CheckBox ID="ordPaidCheckBox" runat="server" Checked='<%# Bind("ordPaid") %>' />
                    <br />
                    paymentID:
                    <asp:TextBox ID="paymentIDTextBox" runat="server" Text='<%# Bind("paymentID") %>' />
                    <br />
                    custID:
                    <asp:TextBox ID="custIDTextBox" runat="server" Text='<%# Bind("custID") %>' />
                    <br />
                    empID:
                    <asp:TextBox ID="empIDTextBox" runat="server" Text='<%# Bind("empID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    ordNumber:
                    <asp:Label ID="ordNumberLabel" runat="server" Text='<%# Bind("ordNumber") %>' />
                    <br />
                    ordDate:
                    <asp:Label ID="ordDateLabel" runat="server" Text='<%# Bind("ordDate") %>' />
                    <br />
                    ordPaid:
                    <asp:CheckBox ID="ordPaidCheckBox" runat="server" Checked='<%# Bind("ordPaid") %>' Enabled="false" />
                    <br />
                    paymentID:
                    <asp:DropDownList ID="ddlReceiptPayView" runat="server" DataSourceID="ObjectDataSource2" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>' Enabled="False">
                    </asp:DropDownList>
                    <br />
                    custID:
                    <asp:DropDownList ID="ddlReceiptCustView" runat="server" DataSourceID="ObjectDataSource3" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("custID") %>' Enabled="False">
                    </asp:DropDownList>
                    <br />
                    empID:
                    <asp:DropDownList ID="ddlReceiptEmpView" runat="server" DataSourceID="ObjectDataSource4" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>' Enabled="False">
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;
                </ItemTemplate>
            </asp:FormView>
            <h1>Service Order(s)</h1>
            <asp:Button ID="btnServiceCreate" runat="server" Text="Create" OnClick="btnServiceCreate_Click" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ServiceOrder" OnRowDeleted="RowDeleted" OnRowUpdated="RowUpdate">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="serordDateIn" HeaderText="serordDateIn" SortExpression="serordDateIn" />
                        <asp:BoundField DataField="serordDateOut" HeaderText="serordDateOut" SortExpression="serordDateOut" />
                        <asp:BoundField DataField="serordIssue" HeaderText="serordIssue" SortExpression="serordIssue" />
                        <asp:CheckBoxField DataField="serordWarranty" HeaderText="serordWarranty" SortExpression="serordWarranty" />
                        <asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" />
                        <asp:TemplateField HeaderText="serviceID" SortExpression="serviceID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlServiceNameEdit" runat="server" DataSourceID="ServiceOrderServiceName" DataTextField="serPrice" DataValueField="id" SelectedValue='<%# Bind("serviceID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlServNameView" runat="server" DataSourceID="ServiceOrderServiceName" DataTextField="serPrice" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("serviceID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="equipID" SortExpression="equipID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlServiceEquipEdit" runat="server" DataSourceID="ServiceOrderEquipName" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equipID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlServiceEquipView" runat="server" DataSourceID="ServiceOrderEquipName" DataTextField="eqtType" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("equipID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="empID" SortExpression="empID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlServiceEmpEdit" runat="server" DataSourceID="EmployeeLookUp" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlServiceEmpView" runat="server" DataSourceID="EmployeeLookUp" DataTextField="FullName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("empID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
            </asp:GridView>
            <h1>Purchase(s)<asp:Button ID="btnPurchaseCreate" runat="server" OnClick="btnPurchaseCreate_Click" Text="Create" />
            </h1>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="OrderLine" OnRowDeleted="RowDeleted" OnRowUpdated="RowUpdate">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="orlPrice" HeaderText="orlPrice" SortExpression="orlPrice" />
                    <asp:BoundField DataField="orlQuantity" HeaderText="orlQuantity" SortExpression="orlQuantity" />
                    <asp:CheckBoxField DataField="orlOrderReq" HeaderText="orlOrderReq" SortExpression="orlOrderReq" />
                    <asp:BoundField DataField="orlNote" HeaderText="orlNote" SortExpression="orlNote" />
                    <asp:TemplateField HeaderText="inventoryID" SortExpression="inventoryID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlProducNameEdit" runat="server" DataSourceID="ProductName" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlProductView" runat="server" DataSourceID="ProductName" DataTextField="prodName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("inventoryID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" />
                </Columns>
            </asp:GridView>
            <h1>Total: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ReceiptCRUDTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
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
                <asp:QueryStringParameter Name="param1" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.PaymentTypeTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="payType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="payType" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.customerLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.employeeLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ServiceOrder" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.service_orderTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="serordDateIn" Type="DateTime" />
                <asp:Parameter Name="serordDateOut" Type="DateTime" />
                <asp:Parameter Name="serordIssue" Type="String" />
                <asp:Parameter Name="serordWarranty" Type="Boolean" />
                <asp:Parameter Name="receiptID" Type="Int32" />
                <asp:Parameter Name="serviceID" Type="Int32" />
                <asp:Parameter Name="equipID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="param1" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="serordDateIn" Type="DateTime" />
                <asp:Parameter Name="serordDateOut" Type="DateTime" />
                <asp:Parameter Name="serordIssue" Type="String" />
                <asp:Parameter Name="serordWarranty" Type="Boolean" />
                <asp:Parameter Name="receiptID" Type="Int32" />
                <asp:Parameter Name="serviceID" Type="Int32" />
                <asp:Parameter Name="equipID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ServiceOrderServiceName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ServOrdSerNameTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ServiceOrderEquipName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ServOrdEquipLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="EmployeeLookUp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.employeeLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="OrderLine" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.order_lineTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="orlPrice" Type="Decimal" />
                <asp:Parameter Name="orlQuantity" Type="Int32" />
                <asp:Parameter Name="orlOrderReq" Type="Boolean" />
                <asp:Parameter Name="orlNote" Type="String" />
                <asp:Parameter Name="inventoryID" Type="Int32" />
                <asp:Parameter Name="receiptID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="param1" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="orlPrice" Type="Decimal" />
                <asp:Parameter Name="orlQuantity" Type="Int32" />
                <asp:Parameter Name="orlOrderReq" Type="Boolean" />
                <asp:Parameter Name="orlNote" Type="String" />
                <asp:Parameter Name="inventoryID" Type="Int32" />
                <asp:Parameter Name="receiptID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ProductName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ProductNameTableAdapter"></asp:ObjectDataSource>
    </form>
    
</body>
</html>
