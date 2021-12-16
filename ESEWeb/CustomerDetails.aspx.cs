using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ESELib;
using ESELib.CustomerLookupDataSetTableAdapters;
using ESELib.EmployeeLookupDataSetTableAdapters;

namespace ESEWeb
/// <summary>
/// Author: Serge Riazanov
/// Team: Smart Code
/// Last Modified: 12/16/2021
/// </summary>
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        private static CustomerLookupDataSet dsCustomer;
        
         
        string customerName;

        protected void Page_Load(object sender, EventArgs e)
        {
            dsCustomer = new CustomerLookupDataSet();
            receiptTableAdapter daReceipt = new receiptTableAdapter();

            string queryString = Request.QueryString["customerID"].ToString();
            int customerId = Convert.ToInt32(queryString) - 1;

            fvCustomerDetails.PageIndex = customerId;
            FormViewRow row = fvCustomerDetails.Row;
            DataRowView rowView = (DataRowView)fvCustomerDetails.DataItem;

            if (txtCustomerName.Text == "")
            {
                customerName = rowView["custFirst"].ToString() + " " + rowView["custLast"].ToString();
                txtCustomerName.Text = customerName;
            }

        }




        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            FormViewRow row = fvCustomerDetails.Row;
            DataRowView rowView = (DataRowView)fvCustomerDetails.DataItem;

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            txtCustomerName.Text = "Customer "+ customerName +" was successfully deleted.";
            fvCustomerDetails.Visible = false;

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }
    }
}