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
    public partial class CreateService : System.Web.UI.Page
    {
        //Disconnect Architecture 

        //DataSet and TableAdapters declaration;
        static ReceiptsDataSet dsEmmasService = new ReceiptsDataSet();
        static ServiceAverageTimeTableAdapter daAvgTime;

        //Contructor
        static CreateService()
        {
            //DataSet filling with TableAdapters
            daAvgTime = new ServiceAverageTimeTableAdapter();

            try
            {
                daAvgTime.Fill(dsEmmasService.ServiceAverageTime);
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

        //Back Button redirect
        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            ReturnPage();
        }

        //Redirect after successfull insert
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ReturnPage();
        }

        //Return to previous page
        private void ReturnPage()
        {
            Response.Redirect($"ReceiptDetails.aspx?ID={Request.QueryString.Get("ID")}&CustomerName={Session["CustomerName"]}");
        }

        //Display service average time on info label
        protected void ddlService_OnChange(object sender, EventArgs e)
        {
            //Control fetching
            DropDownList ddl = (DropDownList)this.FormView1.FindControl("ddlServiceIDInsert");
            Label lbl = (Label)this.FormView1.FindControl("lblServiceInfo");

            //Info variables
            string id = ddl.SelectedItem.Value;
            string name = ddl.SelectedItem.Text;
            string avgTime;

            //Data fetching
            DataRow[] data = dsEmmasService.ServiceAverageTime.Select($"serviceID = {id}");

            //Data can be null as not every service has been yet made
            if (data == null)
            {
                lbl.Text = "No Data Available.";
                return;
            }

            //Data can retrieve empty instead of null
            if (data.Length == 0)
            {
                lbl.Text = "No Data Available.";
                return;
            }

            //Get average time
            avgTime = data[0].ItemArray[1].ToString();

            //Display average time information on info label
            lbl.Text = $"The Average time for a {name} service is {avgTime} day(s)";
        }
    }
}