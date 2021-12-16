<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCustomer.aspx.cs" Inherits="ESEWeb.CreateCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Customer</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Create New Customer</h1>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            <br />
            <hr />
            <br />
            
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="CustomerDataSource">
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
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td>First Name:</td>
                            <td>
                                <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="custFirstTextBox" Display="Dynamic" ErrorMessage="First Name Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td>
                                <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="custLastTextBox" Display="Dynamic" ErrorMessage="Last Name Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>
                                <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="custPhoneTextBox" Display="Dynamic" ErrorMessage="Phone  Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>
                                <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="custAddressTextBox" Display="Dynamic" ErrorMessage="Address Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>City: </td>
                            <td>
                                <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="custCityTextBox" Display="Dynamic" ErrorMessage="City Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Postal Code:</td>
                            <td>
                                <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="custPostalTextBox" Display="Dynamic" ErrorMessage="Postal Code Requiered" Font-Bold="True" ForeColor="Red">!</asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td>
                                <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                            </td>
                            
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClick="InsertButton_Click" OnClientClick="return alert('New Customer: ' + ${custFirstTextBox.Text} + ' was created');"/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  OnClientClick="return confirm('Are you sure you want to clear data and return to the previous page?');" OnClick="InsertCancelButton_Click"/>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <br />
            <br />
            <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CausesValidation="False">Back to Search Customers</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_Click" Visible="False">Create New Customer</asp:LinkButton>
            <br />
            <br />
            <br />
            <asp:ObjectDataSource ID="CustomerDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ESELib.CustomerLookupDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update" >
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
