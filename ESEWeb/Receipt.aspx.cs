using ESELib;
using ESELib.ReceiptsDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESEWeb
{
    public partial class Receipt : System.Web.UI.Page
    {
        //Disconected Architecture to make filtering easier

        //DataSet declaration.
        private static ReceiptsDataSet dsEmmas;

        //Constructor
        static Receipt()
        {
            //DataSet filling with TableAdapters
            dsEmmas = new ReceiptsDataSet();            
            ReceiptViewTableAdapter daReceiptView = new ReceiptViewTableAdapter();
            customerLookUpTableAdapter daCustomerLookUp = new customerLookUpTableAdapter();
            employeeLookUpTableAdapter daEmployeeLookUp = new employeeLookUpTableAdapter();

            try
            {
                daReceiptView.Fill(dsEmmas.ReceiptView);
                daCustomerLookUp.Fill(dsEmmas.customerLookUp);
                daEmployeeLookUp.Fill(dsEmmas.employeeLookUp);
            }
            catch
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack) return;

            //Page will display all the receipts available in memory on load
            DisplayReceipts(dsEmmas.ReceiptView.Select());
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            //If there are Receipts, filter button will filter it according to the criteria on user's stdin
            if (dsEmmas.ReceiptView.Count > 0)
            {
                string criteria = GetReceiptCriteria();
                DataRow[] rows = (criteria.Length > 0) ? dsEmmas.ReceiptView.Select(criteria) : dsEmmas.ReceiptView.Select();
                DisplayReceipts(rows);
            }
        }

        //As a user selects a receipt from the receipts gridview, they will be redirected to that receipt details page.
        protected void gvReceiptsIndexChanged(object sender, EventArgs e)
        {
            string id = gvReceipts.SelectedRow.Cells[1].Text;
            string customer = gvReceipts.SelectedRow.Cells[6].Text;

            Response.Redirect($"ReceiptDetails.aspx?ID={id}&CustomerName={customer}");
        }

        //GridView Data Manipulation
        private void DisplayReceipts(DataRow[] rows)
        {
            //Receipts table created
            DataTable receipts = new DataTable();
            receipts.Columns.Add("#");
            receipts.Columns.Add("Order");
            receipts.Columns.Add("Date");
            receipts.Columns.Add("Paid?");
            receipts.Columns.Add("Employee");
            receipts.Columns.Add("Customer");

            //Add receipts info on the receipts table
            foreach (DataRow r in rows)
            {
                DataRow nr = receipts.NewRow();
                nr[0] = r[0].ToString();
                nr[1] = r[1].ToString();
                nr[2] = r[2].ToString();
                nr[3] = r[3].ToString() == "True" ? "Paid" : "Not Paid";
                nr[4] = r[4] != null ? dsEmmas.employeeLookUp.FindByid(Convert.ToInt32(r[4]))[1].ToString() : "None";
                nr[5] = r[5] != null ? dsEmmas.customerLookUp.FindByid(Convert.ToInt32(r[5]))[1].ToString() : "None";

                receipts.Rows.Add(nr);
            }

            //GridView DataSource attributed to receipts table
            gvReceipts.DataSource = receipts;

            //Generate select buttons
            gvReceipts.AutoGenerateSelectButton = true;

            //Save changes
            gvReceipts.DataBind();
        }

        private string GetReceiptCriteria()
        {
            //Get filter criteria according to user's stdin
            string criteria = "";
            criteria = (Convert.ToInt32(this.ddlEmployees.SelectedValue) > 0) ? "empID = " + this.ddlEmployees.SelectedValue.ToString() : "";
            criteria += (Convert.ToInt32(this.ddlCustomers.SelectedValue) > 0 && criteria.Length > 0) ? "And custID = " + this.ddlCustomers.SelectedValue.ToString()
                : (Convert.ToInt32(this.ddlCustomers.SelectedValue) > 0) ? "custID = " + this.ddlCustomers.SelectedValue.ToString() : "";
            return criteria;
        }
    }
}