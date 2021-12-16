<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePurchase.aspx.cs" Inherits="ESEWeb.CreatePurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Purchase</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="OrderLine" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    orlPrice:
                    <asp:TextBox ID="orlPriceTextBox" runat="server" Text='<%# Bind("orlPrice") %>' />
                    <br />
                    orlQuantity:
                    <asp:TextBox ID="orlQuantityTextBox" runat="server" Text='<%# Bind("orlQuantity") %>' />
                    <br />
                    orlOrderReq:
                    <asp:CheckBox ID="orlOrderReqCheckBox" runat="server" Checked='<%# Bind("orlOrderReq") %>' />
                    <br />
                    orlNote:
                    <asp:TextBox ID="orlNoteTextBox" runat="server" Text='<%# Bind("orlNote") %>' />
                    <br />
                    inventoryID:
                    <asp:TextBox ID="inventoryIDTextBox" runat="server" Text='<%# Bind("inventoryID") %>' />
                    <br />
                    receiptID:
                    <asp:TextBox ID="receiptIDTextBox" runat="server" Text='<%# Bind("receiptID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    orlPrice:
                    <asp:TextBox ID="txtOrderPrice" runat="server" Text='<%# Bind("orlPrice") %>' Enabled="False" />
                    <br />
                    orlQuantity:
                    <asp:TextBox ID="txtOrderQnt" runat="server" Text='<%# Bind("orlQuantity") %>' />
                    <br />
                    orlOrderReq:
                    <asp:CheckBox ID="orlOrderReqCheckBox" runat="server" Checked='<%# Bind("orlOrderReq") %>' />
                    <br />
                    orlNote:
                    <asp:TextBox ID="orlNoteTextBox" runat="server" Text='<%# Bind("orlNote") %>' />
                    <br />
                    inventoryID:
                    <asp:DropDownList ID="ddlInventoryInsert" runat="server" DataSourceID="Inventory" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' AutoPostBack="True" OnSelectedIndexChanged="ddlInventory_OnChange">
                    </asp:DropDownList>
                    <asp:Label ID="lblInvQnt" runat="server"></asp:Label>
                    <br />
                    receiptID:
                    <asp:TextBox ID="txtReceiptID" runat="server" Enabled="False" Text='<%# Bind("receiptID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="btnReturnPage" runat="server" OnClick="btnReturnPage_Click" Text="Back" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    orlPrice:
                    <asp:Label ID="orlPriceLabel" runat="server" Text='<%# Bind("orlPrice") %>' />
                    <br />
                    orlQuantity:
                    <asp:Label ID="orlQuantityLabel" runat="server" Text='<%# Bind("orlQuantity") %>' />
                    <br />
                    orlOrderReq:
                    <asp:CheckBox ID="orlOrderReqCheckBox" runat="server" Checked='<%# Bind("orlOrderReq") %>' Enabled="false" />
                    <br />
                    orlNote:
                    <asp:Label ID="orlNoteLabel" runat="server" Text='<%# Bind("orlNote") %>' />
                    <br />
                    inventoryID:
                    <asp:Label ID="inventoryIDLabel" runat="server" Text='<%# Bind("inventoryID") %>' />
                    <br />
                    receiptID:
                    <asp:Label ID="receiptIDLabel" runat="server" Text='<%# Bind("receiptID") %>' />
                    <br />
                    &nbsp;&nbsp;
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:ObjectDataSource ID="OrderLine" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.order_lineCRUDTableAdapter" UpdateMethod="Update">
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
        <asp:ObjectDataSource ID="Inventory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.ReceiptsDataSetTableAdapters.ProductNameTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>
