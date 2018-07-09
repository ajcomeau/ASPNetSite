using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ComeauWebsite.Classes
{
    static public class AppSessionData
    {
        static public string UserIP
        {
            get { return HttpContext.Current.Session["UserIP"].ToString(); }
            set { HttpContext.Current.Session["UserIP"] = value; }
        }

        static public DateTime SessionStartTime
        {
            get { return (DateTime)HttpContext.Current.Session["UserIP"]; }
        }

        static public bool AdminLogin
        {
            get { return (bool)HttpContext.Current.Session["AdminLogin"]; }
            set { HttpContext.Current.Session["AdminLogin"] = value; }
        }
    }
}