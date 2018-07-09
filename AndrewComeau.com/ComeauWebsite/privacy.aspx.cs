using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComeauWebsite.Classes;

namespace ComeauWebsite
{
    public partial class privacy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["signon"] != null)
            {
                if (Request.QueryString["signon"] == "admin")
                    loginPanel.Visible = true;
                else
                    loginPanel.Visible = false;
            }

        }

        protected void cmdLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (textPass.Text.Length > 0 && textLogin.Text.Length > 0)
                    AppSessionData.AdminLogin =
                        General.UserAuthenticate(textLogin.Text, textPass.Text);

                if (AppSessionData.AdminLogin)
                    Response.Redirect("adminpanel.aspx");
                else
                    lblStatus.Text = "Incorrect login.";
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Error thrown by Privacy.aspx.cmdLogin_Click");
            }
        }


    }
}