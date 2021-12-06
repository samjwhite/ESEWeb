using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESEWeb
{
    public partial class PassReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Data context setup
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

            //Finding user
            IdentityUser lostUser = manager.FindByName(txtUser.Text);

            if (lostUser == null) lblMessage.Text = "User name not found.";
            else
            {
                IdentityResult s1 = manager.RemovePassword(lostUser.Id);

                IdentityResult s2 = manager.AddPassword(lostUser.Id, txtPass.Text);

                if (s1.Succeeded && s2.Succeeded) Response.Redirect("~/Login.aspx");
                else lblMessage.Text = "There was an error updating your password. Try Again.";
            }

        }
    }
}