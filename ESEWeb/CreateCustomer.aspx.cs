using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ESELib;
namespace ESEWeb
/// <summary>
/// Author: Serge Riazanov
/// Team: Smart Code
/// Last Modified: 12/16/2021
/// </summary>
{
    public partial class CreateCustomer : System.Web.UI.Page
    {
        private static CustomerLookupDataSet dsCustomer;
        protected void Page_Load(object sender, EventArgs e)
        {
            dsCustomer = new CustomerLookupDataSet();
            FormView1.ChangeMode(FormViewMode.Insert);
            btnAdd.Visible = false;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Text = "New Customer was created";
                btnAdd.Visible = true;
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateCustomer.aspx");
        }
    }
}