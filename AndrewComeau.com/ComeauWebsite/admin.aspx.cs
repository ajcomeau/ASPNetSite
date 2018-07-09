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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only let the site admin access this page.
            //if (!AppSessionData.AdminLogin)
            //    Response.Redirect("Default.aspx", false);

            if (!IsPostBack)
            {
                String articleID = Request.QueryString["articleid"];

                if (articleID != null)
                    LoadArticle(int.Parse(articleID.ToString()));
            }
        }

        protected void gvArticles_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow selRow = gvArticles.SelectedRow;
            int rowID = int.Parse(selRow.Cells[selRow.Cells.Count - 1].Text);

            Response.Redirect("admin.aspx?articleID=" + rowID.ToString(), false);

        }

        protected void LoadArticle(int ArticleID)
        {
            ArticlesTableAdapter tbaArticles = new ArticlesTableAdapter();

            AppData.ArticlesRow rwArticle =
                (AppData.ArticlesRow)tbaArticles.GetDataByID(ArticleID).Rows[0];

            textTitle.Text = rwArticle.DisplayTitle;
            textPath.Text = rwArticle.FilePath;
            textSummary.Text = rwArticle.ShortDescription;
            checkActive.Checked = rwArticle.Active;
            textReview.Text = rwArticle.ReviewDate.ToString();

        }

        protected void cmdNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx", false);
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            ArticlesTableAdapter tbaArticles = new ArticlesTableAdapter();
            String articleID = Request.QueryString["articleid"];
            int newID;

            try
            {
                if (articleID != null)
                {
                    tbaArticles.Update(textTitle.Text, textPath.Text, textSummary.Text, "",
                        checkActive.Checked, DateTime.Now, DateTime.Parse(textReview.Text),
                        int.Parse(articleID.ToString()));
                }
                else
                {
                    //tbaArticles.Insert(textTitle.Text, textPath.Text, textSummary.Text, "", checkActive.Checked, DateTime.Parse(textReview.Text), out newID);

                    //Response.Redirect("admin.aspx?articleID=" + newID.ToString(), false);
                }
            }
            catch(Exception ex)
            {
                General.ErrorHandler(ex, "Error thrown by admin.aspx.cmdSave_Click()");
            }
        }


    }
}