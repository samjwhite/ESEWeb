using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ESELib;
using ESELib.CustomerLookupDataSetTableAdapters;

namespace ESEWeb
{
    public partial class Customers : System.Web.UI.Page
    {
        private static CustomerLookupDataSet dsCustomer;

        private static DataRow[] rows;
        private string message = "";
        private static int id = 1;


        static Customers()
        {
            //load data for the first session
            dsCustomer = new CustomerLookupDataSet();
        

            try
            {
               // daCustomerById.Fill(dsCustomer.customerByID,-1);
            }
            catch (Exception ex)
            {

                
            }
          

        }

        protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = ddlEmployeeName.SelectedIndex;
           // DataRow customer = dsCustomer.customerByID.FindByid(id);
            if (!(ddlEmployeeName.SelectedIndex == -1))
                
            {
                foreach(DataRow row in rows)
                {
                    lbCustomers.Items.Add(row.ItemArray[1].ToString());
                }
                
            }
        }







        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}