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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Role Creation
            RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>();
            RoleManager<IdentityRole> roleMgr = new RoleManager<IdentityRole>(roleStore);

            string roleSelected = this.ddlRoles.SelectedItem.Text;

            if (!roleMgr.RoleExists(roleSelected))
            {
                IdentityResult roleResult = roleMgr.Create(new IdentityRole(roleSelected));
            }

            //User Creation
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

            IdentityUser user = new IdentityUser(txtUser.Text);
            IdentityResult idResult = manager.Create(user, txtPass.Text);
            IdentityResult userResult;

            if (idResult.Succeeded)
            {
                userResult = manager.AddToRole(user.Id, roleSelected);

                if (userResult.Succeeded)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(userIdentity);

                    Response.Redirect("~/Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = userResult.Errors.FirstOrDefault();
                }


            }
            else
            {
                lblMessage.Text = idResult.Errors.FirstOrDefault();
            }
        }
    }
}