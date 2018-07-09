using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using ComeauWebsite.Classes;
using ComeauWebsite.Classes.AppDataTableAdapters;

namespace ComeauWebsite
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection cnNew = new SqlConnection("Data Source=COMEAU-DESKTOP;Initial Catalog=AdventureWorks2012;Integrated Security=True");
                SqlDataAdapter daNew = new SqlDataAdapter("Select Top 10 * From Production.Product", cnNew);
                DataTable dtNew = new DataTable();
                daNew.Fill(dtNew);
                
                AppData.ArticlesRow rwArticle = GetArticle();
                ArticleLink.NavigateUrl = "~/" + rwArticle.FilePath;
                ArticleLink.Text = rwArticle.DisplayTitle;
                ArticleSubTitle.Text = rwArticle.ShortDescription;
                ArticleSummary.Text = rwArticle.LongSummary;

            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Exception thrown by Default.aspx.Page_Load.");
            }
        }

        protected AppData.ArticlesRow GetArticle()
        {
            ArticlesTableAdapter tbaArticle = new ArticlesTableAdapter();
            AppData.ArticlesRow rwArticle;

            try
            {
                 rwArticle = (AppData.ArticlesRow)tbaArticle.GetRandomArticle().Rows[0];
            }
            catch
            {
                throw;
            }

            return rwArticle;
        }

      
    }
}