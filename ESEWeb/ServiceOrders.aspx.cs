using ESELib;
using ESELib.ServiceOrderDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESEWeb
{
    public partial class ServiceOrders : System.Web.UI.Page
    {
        //Disconected Architecture to make filtering easier

        //DataSet declaration.
        private static ServiceOrderDataSet dsServiceOrder;

        //Constructor
        static ServiceOrders()
        {
            //DataSet filling with TableAdapters
            dsServiceOrder = new ServiceOrderDataSet();
            ServiceOrderViewTableAdapter daServiceOrderView = new ServiceOrderViewTableAdapter();
            receiptLookUpTableAdapter daReceiptLookUp = new receiptLookUpTableAdapter();
            serviceLookUpTableAdapter daServiceLookUp = new serviceLookUpTableAdapter();
            equipmentLookUpTableAdapter daEquipmentLookUp = new equipmentLookUpTableAdapter();
            employeeLookUpTableAdapter daEmployeeLookUp = new employeeLookUpTableAdapter();

            try
            {
                daServiceOrderView.Fill(dsServiceOrder.ServiceOrderView);
                daReceiptLookUp.Fill(dsServiceOrder.receiptLookUp);
                daServiceLookUp.Fill(dsServiceOrder.serviceLookUp);
                daEquipmentLookUp.Fill(dsServiceOrder.equipmentLookUp);
                daEmployeeLookUp.Fill(dsServiceOrder.employeeLookUp);
            }
            catch
            {

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack) return;

            //Page will display all the receipts available in memory on load
            DisplayServiceOrders(dsServiceOrder.ServiceOrderView.Select());
        }

        private void DisplayServiceOrders(DataRow[] rows)
        {
            //Receipts table created
            DataTable receipts = new DataTable();
            receipts.Columns.Add("#");
            receipts.Columns.Add("Date In");
            receipts.Columns.Add("Date Out");
            receipts.Columns.Add("Issue");
            receipts.Columns.Add("Warranty?");
            receipts.Columns.Add("Receipt");
            receipts.Columns.Add("Service");
            receipts.Columns.Add("Equipment");
            receipts.Columns.Add("Employee");            

            //Add receipts info on the receipts table
            foreach (DataRow r in rows)
            {
                DataRow nr = receipts.NewRow();
                nr[0] = r[0].ToString();
                nr[1] = DateTime.Parse(r[1].ToString()).ToString("dddd, MMMM d, yyyy");
                nr[2] = DateTime.Parse(r[2].ToString()).ToString("dddd, MMMM d, yyyy");
                nr[3] = r[3].ToString();
                nr[4] = r[4].ToString() == "True" ? "Paid" : "Not Paid";
                nr[5] = r[5] != null ? dsServiceOrder.receiptLookUp.FindByid(Convert.ToInt32(r[5]))[1].ToString() : "None";
                nr[6] = r[6] != null ? dsServiceOrder.serviceLookUp.FindByid(Convert.ToInt32(r[6]))[1].ToString() : "None";
                nr[7] = r[7] != null ? dsServiceOrder.equipmentLookUp.FindByid(Convert.ToInt32(r[7]))[1].ToString() : "None";
                nr[8] = r[8] != null ? dsServiceOrder.employeeLookUp.FindByid(Convert.ToInt32(r[8]))[1].ToString() : "None";

                receipts.Rows.Add(nr);
            }

            //GridView DataSource attributed to receipts table
            gvServiceOrders.DataSource = receipts;

            //Generate select buttons
            gvServiceOrders.AutoGenerateSelectButton = true;

            //Save changes
            gvServiceOrders.DataBind();
        }

        private string GetReceiptCriteria()
        {
            //Get filter criteria according to user's stdin
            string criteria = "";
            //criteria = (Convert.ToInt32(this.ddlEmployees.SelectedValue) > 0) ? "empID = " + this.ddlEmployees.SelectedValue.ToString() : "";
            //criteria += (Convert.ToInt32(this.ddlCustomers.SelectedValue) > 0 && criteria.Length > 0) ? "And custID = " + this.ddlCustomers.SelectedValue.ToString()
            //    : (Convert.ToInt32(this.ddlCustomers.SelectedValue) > 0) ? "custID = " + this.ddlCustomers.SelectedValue.ToString() : "";
            return criteria;
        }
    }
}