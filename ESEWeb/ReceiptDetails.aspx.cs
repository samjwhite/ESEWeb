using System;
using System.Collections.Generic;
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
    public partial class ReceiptDetails : System.Web.UI.Page
    {
        //static int id = Request.QueryString.Get("ID");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Loads data to Total label display the receipt price
            GetTotal();
        }

        private void GetTotal()
        {
            //initialize a total amount of 0
            double total = 0;

            //Loop going over each row of the Service GridView
            foreach (GridViewRow r in GridView1.Rows)
            {
                //Get Data Control and add its value to the total amount
                DropDownList a = (DropDownList)r.FindControl("ddlServNameView") ?? (DropDownList)r.FindControl("ddlServiceNameEdit");
                string b = a.SelectedItem.Text;
                total += Convert.ToDouble(b);
            }

            //Loop going over each row of the Service GridView
            foreach (GridViewRow r in GridView2.Rows)
            {
                //Add value of order line to the total amount
                total += Convert.ToDouble(r.Cells[2].Text);
            }

            //Display total amount formated as currency on Label1 Label
            this.Label1.Text = total.ToString("C");
        }

        //Row Deleted will refresh the page. I tried just using GetData() but I don't know why it was not working. This is not optimal, but it works
        protected void RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            string id = Request.QueryString.Get("ID");
            string customer = Request.QueryString.Get("CustomerName");

            Response.Redirect($"ReceiptDetails.aspx?ID={id}&CustomerName={customer}");
        }

        //As each row on the GridView are updated, the page will refresh the total label (Label1)
        protected void RowUpdate(object sender, GridViewUpdatedEventArgs e)
        {
            GetTotal();
        }

        //Redirects to Create Service page.
        protected void btnServiceCreate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("ID");
            Session["CustomerName"] = Request.QueryString.Get("CustomerName");
            Response.Redirect($"CreateService.aspx?ID={id}");
        }

        //Redirects to Create Purchase page.
        protected void btnPurchaseCreate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("ID");
            Session["CustomerName"] = Request.QueryString.Get("CustomerName");
            Response.Redirect($"CreatePurchase.aspx?ID={id}");
        }
    }
}