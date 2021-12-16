<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateService.aspx.cs" Inherits="ESEWeb.CreateService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Service</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    serordDateIn:
                    <asp:TextBox ID="serordDateInTextBox" runat="server" Text='<%# Bind("serordDateIn") %>' />
                    <br />
                    serordDateOut:
                    <asp:TextBox ID="serordDateOutTextBox" runat="server" Text='<%# Bind("serordDateOut") %>' />
                    <br />
                    serordIssue:
                    <asp:TextBox ID="serordIssueTextBox" runat="server" Text='<%# Bind("serordIssue") %>' />
                    <br />
                    serordWarranty:
                    <asp:CheckBox ID="serordWarrantyCheckBox" runat="server" Checked='<%# Bind("serordWarranty") %>' />
                    <br />
                    receiptID:
                    <asp:TextBox ID="receiptIDTextBox" runat="server" Text='<%# Bind("receiptID") %>' />
                    <br />
                    serviceID:
                    <br />
                    equipID:
                    <asp:TextBox ID="equipIDTextBox" runat="server" Text='<%# Bind("equipID") %>' />
                    <br />
                    empID:
                    <asp:TextBox ID="empIDTextBox" runat="server" Text='<%# Bind("empID") %>' />
                    <br />
                    &nbsp;
                </EditItemTemplate>
                <InsertItemTemplate>
                    serordDateIn:
                    <asp:TextBox ID="serordDateInTextBox" runat="server" Text='<%# Bind("serordDateIn") %>' />
                    <br />
                    serordDateOut:
                    <asp:TextBox ID="serordDateOutTextBox" runat="server" Text='<%# Bind("serordDateOut") %>' />
                    <br />
                    serordIssue:
                    <asp:TextBox ID="serordIssueTextBox" runat="server" Text='<%# Bind("serordIssue") %>' />
                    <br />
                    serordWarranty:
                    <asp:CheckBox ID="serordWarrantyCheckBox" runat="server" Checked='<%# Bind("serordWarranty") %>' />
                    <br />
                    receiptID:
                    <asp:TextBox ID="txtReceiptID" runat="server" Enabled="False" Text='<%# Bind("receiptID") %>' />
                    <br />
                    serviceID:
                    <asp:DropDownList ID="ddlServiceIDInsert" runat="server" DataSourceID="ServiceName" DataTextField="serName" DataValueField="id" SelectedValue='<%# Bind("serviceID") %>' OnSelectedIndexChanged="ddlService_OnChange" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Label ID="lblServiceInfo" runat="server"></asp:Label>
                    <br />
                    equipID:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EquipType" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equipID") %>'>
                    </asp:DropDownList>
                    <br />
                    empID:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="EmployeeName" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="btnBack" runat="server" OnClick="InsertCancelButton_Click" Text="Back" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    serordDateIn:
                    <asp:Label ID="serordDateInLabel" runat="server" Text='<%# Bind("serordDateIn") %>' />
                    <br />
                    serordDateOut:
                    <asp:Label ID="serordDateOutLabel" runat="server" Text='<%# Bind("serordDateOut") %>' />
                    <br />
                    serordIssue:
                    <asp:Label ID="serordIssueLabel" runat="server" Text='<%# Bind("serordIssue") %>' />
                    <br />
                    serordWarranty:
                    <asp:CheckBox ID="serordWarrantyCheckBox" runat="server" Checked='<%# Bind("serordWarranty") %>' Enabled="false" />
                    <br />
                    receiptID:
                    <asp:Label ID="receiptIDLabel" runat="server" Text='<%# Bind("receiptID") %>' />
                    <br />
                    serviceID:
                    <asp:Label ID="serviceIDLabel" runat="server" Text='<%# Bind("serviceID") %>' />
                    <br />
                    equipID:
                    <asp:Label ID="equipIDLabel" runat="server" Text='<%# Bind("equipID") %>' />
                    <br />
                    empID:
                    <asp:Label ID="empIDLabel" runat="server" Text='<%# Bind("empID") %>' />
                    <br />
                    &nbsp;&nbsp;
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.service_orderCRUDTableAdapter" UpdateMethod="Update">
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
        <asp:ObjectDataSource ID="ServiceName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ServiceLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="EquipType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ServOrdEquipLookUpTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="EmployeeName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.employeeLookUpTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>
