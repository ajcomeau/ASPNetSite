using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;
using System.IO;
using ComeauWebsite.Classes;
using ComeauWebsite.Classes.AppDataTableAdapters;


namespace SiteMaster
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get new quote and Amazon.com ad.

            try
            {
                //GetQuote();
                //GetAd();
            }
            catch (Exception ex)
            {   
                General.ErrorHandler(ex, "Error thrown by Site.master Load event.");
            }
        }

        //public void GetAd()
        //{
        //    try
        //    {
        //            // Get row with ad data.
        //            SiteAdsTableAdapter tbaAds = new SiteAdsTableAdapter();

        //            AppData.SiteAdsRow rwAdData;
                    
        //            // If an ad has been specified in the query string, pull it. Otherwise pick a random ad.
        //            if(Request.QueryString["ad"] != null)
        //                rwAdData = (AppData.SiteAdsRow)tbaAds.GetDataByID(int.Parse(Request.QueryString["ad"])).Rows[0];
        //            else
        //                rwAdData = (AppData.SiteAdsRow)tbaAds.GetRandomAd().Rows[0];

        //            // Fill in the controls.
        //            litImage.Text = rwAdData.ImageLink;
                    
        //            if (!rwAdData.IsTextLinkNull())
        //                litText.Text = rwAdData.TextLink;   
                    
        //            if (!rwAdData.IsAuthorNull())
        //                lblAuthor.Text = rwAdData.Author;                
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //}

        public void GetQuote()
        {
            // Reads a random quote from the site_quotes file and displays it
            // as part of the page header section.

            QuotesTableAdapter tbaQuotes;
            AppData.QuotesRow drQuote;

            try
            {
                tbaQuotes = new QuotesTableAdapter();
                drQuote = (AppData.QuotesRow)tbaQuotes.GetRandomQuote().Rows[0];
                QuoteBox.Text = QuoteBoxText(drQuote.QuoteText, drQuote.Author);
            }
            catch
            {
                QuoteBox.Text = QuoteBoxText("The law of unintended consequences " +
                    "governs all technological revolutions.", "Arnold J. Toynbee");
                throw;
            }
        }


        protected string QuoteBoxText(string QuoteText, string Author)
        {
            // Assemble HTML code to be inserted into a literal field.
            // This code will simulate an ASP label control but will allow for the line break before the author's name.

            string result;

            result = "<span id=\"";
            result += "ctl00_QuoteBox\"";
            result += " style=\"";
            result += "display:block;color:Black;border-width:0px;font-size:12px;height:48px;min-width:525px;width:50%;left: 460px; position: absolute; top: 10px";
            result += "\">";
            result += QuoteText + "<br /> - " + Author;
            result += "</span>";

            return result;
        }
        
        //public void GetQuote()
        // OLD VERSION
        //{
        //    // Reads a random quote from the site_quotes file and displays it
        //    // as part of the page header section.

        //    try
        //    {
        //        QuotesTableAdapter tbaQuotes = new QuotesTableAdapter();
        //        AppData.QuotesDataTable dtQuotes = tbaQuotes.GetData();
        //        int QuoteCount = dtQuotes.Rows.Count;
        //        Random numberGen = new Random();
        //        int QuoteSelect = numberGen.Next(QuoteCount);
        //        AppData.QuotesRow QuoteRow = (AppData.QuotesRow)dtQuotes.Rows[QuoteSelect];
        //        QuoteBox.Text = QuoteBoxText(QuoteRow.QuoteText, QuoteRow.Author);
        //    }
        //    catch
        //    {
        //        QuoteBox.Text = QuoteBoxText("The law of unintended consequences " +
        //            "governs all technological revolutions.", "Arnold J. Toynbee");
        //        throw;
        //    }
        //}


        //public void GetAmazonAd()
        //{
        //    try
        //    {
        //        if (lblIntro != null)
        //        {
        //            // Get row with ad data.
        //            SiteAdsTableAdapter tbaAds = new SiteAdsTableAdapter();
        //            AppData.SiteAdsRow rwAdData = (AppData.SiteAdsRow)tbaAds.GetRandomAd().Rows[0];
        //            //AppData.SiteAdsRow rwAdData = General.GetRandomAd("Site.Master");
                    
        //            // Fill in the controls.
        //            lblIntro.Text = rwAdData.IntroText;
        //            litImage.Text = rwAdData.ImageLink;
        //            litText.Text = rwAdData.TextLink;
        //            lblAuthor.Text = rwAdData.Author;

        //            // If there's a Kindle link, show that too.
        //            if (!rwAdData.IsAltLinkNull())
        //            {
        //                litAlt.Visible = true;
        //                litAlt.Text = rwAdData.AltLink;
        //            }
        //            else
        //                litAlt.Visible = false;
        //        }
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //}


    }
}