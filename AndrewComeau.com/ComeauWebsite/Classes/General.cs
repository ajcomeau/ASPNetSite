using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using ComeauWebsite.Classes.AppDataTableAdapters;
using ComeauWebsite.Classes;

namespace ComeauWebsite.Classes
{
    public class General
    {
        public HtmlMeta OGTitleTag(string TitleText)
        {
            //Generate a new OpenGraph title tag.

            HtmlMeta resultTag = new HtmlMeta();
            resultTag.Attributes.Add("property", "og:title");
            resultTag.Content = TitleText;
            return resultTag;
        }

        public HtmlMeta OGURLTag(string URL)
        {
            //Generate a new OpenGraph title tag.

            HtmlMeta resultTag = new HtmlMeta();
            resultTag.Attributes.Add("property", "og:url");
            resultTag.Content = URL;
            return resultTag;
        }

        public HtmlMeta OGSiteNameTag()
        {
            //Generate a new OpenGraph title tag.

            HtmlMeta resultTag = new HtmlMeta();
            resultTag.Attributes.Add("property", "og:site_name");
            resultTag.Content = "ComeauSoftware.com";
            return resultTag;
        }

        public HtmlMeta OGDescriptionTag(string Description)
        {
            //Generate a new OpenGraph title tag.

            HtmlMeta resultTag = new HtmlMeta();
            resultTag.Attributes.Add("property", "og:description");
            resultTag.Content = Description;
            return resultTag;
        }

        public static void ErrorHandler(Exception ex, String message)
        {
            try
            {
                // Open error log file and append error details.


                using (StreamWriter errorLog = new StreamWriter(HttpContext.Current.Server.MapPath("/Data/ErrorLog.txt"), true))
                {
                    errorLog.WriteLine(DateTime.Now.ToString());
                    errorLog.WriteLine("FilePath: " + HttpContext.Current.Request.FilePath);
                    errorLog.WriteLine("URL: " + HttpContext.Current.Request.RawUrl);
                    //errorLog.WriteLine("IP: " + Session["UserIP"]);  HttpContext.Current.Request.UserHostAddress
                    errorLog.WriteLine("TargetSite: " + ex.TargetSite);
                    errorLog.WriteLine("Messages: " + message);
                    errorLog.WriteLine(ex.Message);

                    if (ex.InnerException != null)
                        errorLog.WriteLine("Inner exception: " + ex.InnerException.Message);

                    errorLog.WriteLine(ex.StackTrace);
                    errorLog.WriteLine(" ");
                    errorLog.Flush();
                    errorLog.Close();
                }
            }
            catch
            {
                // If even the error handler fails, might as well go to the error page.
                HttpContext.Current.Response.Redirect("~/errorPage.aspx");
            }
        }

        public static bool UserAuthenticate(String UserName, String Password)
        {
            bool result;
            // Currently the admin login is hard-coded.  Just match the values.

            if (UserName == "admin117" && Password == "sharien117")
                result = true;
            else
                result = false;

            return result;
        }

        public static AppData.SiteAdsRow GetRandomAd(String PageName)
        {
            SiteAdsTableAdapter tbaAds = new SiteAdsTableAdapter();
            AppData.SiteAdsDataTable dtAds = new AppData.SiteAdsDataTable();
            AppData.SiteAdsRow result;
            Random numberGen = new Random();
            int rowCount;

            // If no ads specific to the page were found, get all active.
            if (dtAds.Rows.Count == 0)
                dtAds = tbaAds.GetActiveAds();

            // Return a random row.
            if (dtAds.Rows.Count > 1)
            {
                rowCount = dtAds.Rows.Count;
                result = (AppData.SiteAdsRow)dtAds.Rows[numberGen.Next(rowCount)];
            }
            else
                result = (AppData.SiteAdsRow)dtAds.Rows[0];

            return result;

        }
    }
}