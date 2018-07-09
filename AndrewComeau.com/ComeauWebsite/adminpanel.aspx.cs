using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComeauWebsite.Classes;
using ComeauWebsite.Classes.AppDataTableAdapters;

namespace ComeauWebsite
{
    public partial class adminpanel : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only let the site admin access this page.
            if (!AppSessionData.AdminLogin)
                Response.Redirect("Default.aspx", false);

            String itemID = Request.QueryString["itemID"];
            String catID = Request.QueryString["catID"];

            try
            {
                // Load the correct data depending on the query string.
                if (!Page.IsPostBack)
                {
                    // Show the correct panel
                    PanelSelect();

                    if (itemID != null)
                    {
                        if (catID == "articles")
                            LoadArticle(int.Parse(itemID));
                        else if (catID == "ads")
                            LoadAd(int.Parse(itemID));
                    }
                }
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Exception thrown by adminpanel.aspx.Page_Load.");
            }
        }

        protected void gvArticles_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            // Get the selected article ID and reload the page with it as part of the query string.
            GridViewRow selRow = gvArticles.SelectedRow;
            int rowID = int.Parse(selRow.Cells[selRow.Cells.Count - 1].Text);

            Response.Redirect("adminpanel.aspx?catID=articles&itemID=" + rowID.ToString(), false);
        }

        protected void LoadArticle(int ArticleID)
        {
            // Load the specified article and fill in the page fields.
            
            ArticlesTableAdapter tbaArticles = new ArticlesTableAdapter();

            try
            {
                AppData.ArticlesRow rwArticle =
                    (AppData.ArticlesRow)tbaArticles.GetDataByID(ArticleID).Rows[0];

                textTitle.Text = rwArticle.DisplayTitle;
                textPath.Text = rwArticle.FilePath;
                textDescription.Text = rwArticle.ShortDescription;
                textSummary.Text = rwArticle.LongSummary;
                checkActive.Checked = rwArticle.Active;
                checkRandom.Checked = rwArticle.RandomSelect;
                checkSearch.Checked = rwArticle.SearchSelect;
            }
            catch
            {
                throw;
            }
        }

        protected void cmdNew_Click(object sender, EventArgs e)
        {
            // Reload the page, specifying a new article.
            Response.Redirect("adminpanel.aspx?catID=articles", false);
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            ArticlesTableAdapter tbaArticles = new ArticlesTableAdapter();
            String articleID = Request.QueryString["itemID"];
            int newID;
            
            //If there is no article ID specified, save a new article record.  Otherwise, update the specified article.
            try
            {
                if (articleID != null)
                {
                    newID = int.Parse(articleID.ToString());
                    tbaArticles.Update(textTitle.Text, textPath.Text, textDescription.Text, textSummary.Text,
                        checkActive.Checked, DateTime.Now, checkSearch.Checked, checkRandom.Checked, newID);
                }
                else
                {
                    tbaArticles.Insert(textTitle.Text, textPath.Text, textDescription.Text, textSummary.Text, checkActive.Checked, checkRandom.Checked, checkSearch.Checked, out newID);
                }

                Response.Redirect("adminpanel.aspx?catID=articles&itemID=" + newID.ToString(), false);
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Error thrown by adminpanel.aspx.cmdSave_Click()");
            }
        }

        protected void PanelSelect()
        {
            // Hide all panels and then show the one selected in the query string.
            pnlAds.Visible = false;
            pnlArticles.Visible = false;
            pnlQuotes.Visible = false;

            String catID = Request.QueryString["catID"];

            if (catID == "articles" || catID == null)
                pnlArticles.Visible = true;
            else if (catID == "ads")
                pnlAds.Visible = true;
            else if (catID == "quotes")
                pnlQuotes.Visible = true;

        }

        protected void cmdSaveQuote_Click(object sender, EventArgs e)
        {
            QuotesTableAdapter tbaQuotes = new QuotesTableAdapter();
            string quoteID = Request.QueryString["itemID"];
            int newID;

            //If there is no article ID specified, save a new quote record.  Otherwise, update the specified quote.
            try
            {
                if (quoteID != null)
                {
                    tbaQuotes.Update(textQuote.Text, textAuthor.Text, int.Parse(quoteID));
                }
                else
                {
                    tbaQuotes.Insert(textQuote.Text, textAuthor.Text, out newID);
                    Response.Redirect("adminpanel.aspx?catID=quotes&itemID=" + newID.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Error thrown by adminpanel.aspx.cmdSaveQuote_Click()");
            }
        }

        protected void cmdNewQuote_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpanel.aspx?catID=quotes", false);
        }

        protected void LoadAd(int adID)
        {
            SiteAdsTableAdapter tbaAds = new SiteAdsTableAdapter();
            // Load the ad record and fill in the appropriate fields.
            try
            {
                AppData.SiteAdsRow rwAd =
                    (AppData.SiteAdsRow)tbaAds.GetDataByID(adID).Rows[0];

                if (!rwAd.IsDescriptionNull())
                    textProdDesc.Text = rwAd.Description;

                textManuf.Text = rwAd.Author;
                textTextLink.Text = rwAd.TextLink.ToString();
                textImageLink.Text = rwAd.ImageLink.ToString();

                if (!rwAd.IsAltLinkNull())
                    textAltLink.Text = rwAd.AltLink.ToString();

                if (!rwAd.IsIntroTextNull())
                    textIntroText.Text = rwAd.IntroText;

                chkProdActive.Checked = rwAd.Active;
            }
            catch
            {
                throw;
            }
        }

        protected void cmdSaveAd_Click(object sender, EventArgs e)
        {
            SiteAdsTableAdapter tbaAds = new SiteAdsTableAdapter();
            string adID = Request.QueryString["itemID"];
            int newID;

            //If there is an ad ID specified, save a new ad record.  Otherwise, update the specified ad.

            try
            {
                if (adID != null)
                {
                    tbaAds.Update("AndrewComeau.com", textIntroText.Text, textTextLink.Text, textImageLink.Text, textAltLink.Text,
                        textProdDesc.Text, textManuf.Text, chkProdActive.Checked, DateTime.Today, int.Parse(adID));
                }
                else
                {
                    tbaAds.Insert("AndrewComeau.com", textIntroText.Text, textTextLink.Text, textImageLink.Text, textAltLink.Text,
                        textProdDesc.Text, textManuf.Text, chkProdActive.Checked, out newID);
                    Response.Redirect("adminpanel.aspx?catID=ads&itemID=" + newID.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Error thrown by adminpanel.aspx.cmdSaveAd_Click()");
            }
        }

        protected void cmdNewAd_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpanel.aspx?catID=ads", false);
        }

        protected void cmdArticleSel_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpanel.aspx?catID=articles", false);
        }

        protected void cmdQuotesSel_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpanel.aspx?catID=quotes", false);
        }

        protected void cmdAdsSel_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpanel.aspx?catID=ads", false);
        }

        protected void gvAds_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow selRow = gvAds.SelectedRow;
            int rowID = int.Parse(selRow.Cells[selRow.Cells.Count - 1].Text);

            Response.Redirect("adminpanel.aspx?catID=ads&itemID=" + rowID.ToString(), false);
        }

        protected void cmdPreviewAd_Click(object sender, EventArgs e)
        {
            // Fill in the preview controls with the entries.
            lblIntro.Text = textIntroText.Text;
            litImage.Text = textImageLink.Text;
            litText.Text = textTextLink.Text;
            lblAuthor.Text = textManuf.Text;

            // If there's a Kindle link, show that too.
            if (textAltLink.Text.Length > 0)
            {
                litAlt.Visible = true;
                litAlt.Text = textAltLink.Text;
            }
            else
                litAlt.Visible = false;
        }


    }
}