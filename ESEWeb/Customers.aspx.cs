using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ESELib;
using ESELib.CustomerLookupDataSetTableAdapters;
/// <summary>
/// Author: Serge Riazanov
/// Team: Smart Code
/// Last Modified: 12/16/2021
/// </summary>
namespace ESEWeb
{
    public partial class WebForm7 : System.Web.UI.Page
    {


            int currentCustomerId = -1;


            protected void Page_Load(object sender, EventArgs e)
            {
                customerTableAdapter daCustomer = new customerTableAdapter();

            }

            protected void lbCustomers_SelectedIndexChanged(object sender, EventArgs e)
            {
                currentCustomerId = Convert.ToInt32(lbCustomers.SelectedValue) - 1;
                dvCustomerDetails.PageIndex = currentCustomerId;
                dvCustomerDetails.Visible = true;
            }

            protected void btnCustomerDetails_Click(object sender, EventArgs e)
            {
                int customerId = Convert.ToInt32(lbCustomers.SelectedValue) ;
                // txtTest.Text = ("current customer id is:" + currentCustomerId);
                //redirect to customerDetails page and pass custId;
                Response.Redirect("CustomerDetails.aspx?customerID=" + customerId);
            }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateCustomer.aspx");
            
        }
    }
}