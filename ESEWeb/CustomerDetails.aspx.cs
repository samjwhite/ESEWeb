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
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        private static CustomerLookupDataSet dsCustomer;
        
         
        string customerName;

        protected void Page_Load(object sender, EventArgs e)
        {
            dsCustomer = new CustomerLookupDataSet();
            receiptTableAdapter daReceipt = new receiptTableAdapter();

           // daReceipt.Fill(dsCustomer.receipt);


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

          // DataRow[] dsRows = dsCustomer.receipt.Select("custID == 1");



        }




        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            FormViewRow row = fvCustomerDetails.Row;
            DataRowView rowView = (DataRowView)fvCustomerDetails.DataItem;

            
              //  txtCustomerName.Text = rowView["custFirst"].ToString() + " " + rowView["custLast"].ToString();
            
        }
    }
}