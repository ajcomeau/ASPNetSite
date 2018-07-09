using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using ComeauWebsite.Classes;

namespace ComeauWebsite
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Get user's IP address.
            string ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (ip != null)
                ip = ip.Split(new Char[] { ',' })[0];
            else
                ip = Request.ServerVariables["REMOTE_ADDR"];

            // Assign values to session variables.
            Session["UserIP"] = ip;
            Session["EntryTime"] = System.DateTime.Now.ToString();
            Session["AdminLogin"] = false;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                Exception ex = Server.GetLastError();
                General.ErrorHandler(ex, "Application error thrown.");
                Server.ClearError();
                //if (!Response.IsRequestBeingRedirected)
                    Response.Redirect("~/errorPage.aspx");
            }
            catch
            {
                //if (!Response.IsRequestBeingRedirected)
                    Response.Redirect("~/errorPage.aspx");
            }

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}