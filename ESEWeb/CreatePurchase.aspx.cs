using ESELib;
using ESELib.ReceiptsDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Creator: Vinicius Pereira
/// Group: Smart Code
/// Contributors:
/// </summary>

namespace ESEWeb
{
    public partial class CreatePurchase : System.Web.UI.Page
    {
        //Disconnect Architecture 

        //DataSet and TableAdapters declaration;
        static ReceiptsDataSet dsEmmasPurchase = new ReceiptsDataSet();        
        static InvQntAdapter daInvQnt;

        //Constructor
        static CreatePurchase()
        {
            //DataSet filling with TableAdapters
            daInvQnt = new InvQntAdapter();

            try
            {
                daInvQnt.Fill(dsEmmasPurchase.InvQnt);
            }
            catch
            {

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack) return;

            //On Load, Page will insert receiptID on Insert Form
            TextBox receiptID = (TextBox)this.FormView1.FindControl("txtReceiptID");
            receiptID.Text = Request.QueryString.Get("ID");
        }

        //Return to previous page
        private void ReturnPage()
        {
            Response.Redirect($"ReceiptDetails.aspx?ID={Request.QueryString.Get("ID")}&CustomerName={Session["CustomerName"]}");
        }

        //Back Button redirect
        protected void btnReturnPage_Click(object sender, EventArgs e)
        {
            ReturnPage();
        }

        //Redirect after successfull insert
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ReturnPage();
        }

        //Display stock quantity and overall price on info label
        //Not Yet finished. Must put quantity first and then change the ddl
        protected void ddlInventory_OnChange(object sender, EventArgs e)
        {
            //Control fetching
            DropDownList ddl = (DropDownList)this.FormView1.FindControl("ddlInventoryInsert");
            Label lbl = (Label)this.FormView1.FindControl("lblInvQnt");
            TextBox txtPrice = (TextBox)this.FormView1.FindControl("txtOrderPrice");
            TextBox txtQnt = (TextBox)this.FormView1.FindControl("txtOrderQnt");

            //Info variables
            string id = ddl.SelectedItem.Value;
            string name = ddl.SelectedItem.Text;
            string quantityInStock;
            double price;

            //Data fetching
            DataRow[] data = dsEmmasPurchase.InvQnt.Select($"id = {id}");

            //get stock quantity and price 
            quantityInStock = data[0].ItemArray[1].ToString();
            price = Convert.ToDouble(data[0].ItemArray[2]);

            //Display stock quantity data on info label
            lbl.Text = $"There is {quantityInStock} of {name} in stock!";

            //If there is quantity displayed, sets price info.
            if (txtQnt.Text != "") txtPrice.Text = $"{Convert.ToDouble(txtQnt.Text) * price}";
        }
    }
}