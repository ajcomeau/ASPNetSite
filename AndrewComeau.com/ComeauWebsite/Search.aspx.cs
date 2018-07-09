using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComeauWebsite.Classes;
using ComeauWebsite.Classes.AppDataTableAdapters;

namespace ComeauWebsite
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvArticles_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Get the article ID from the selected row, pull the correct article
                // and redirect to it.
                GridViewRow rwSelect = gvArticles.SelectedRow;
                int articleID = int.Parse(rwSelect.Cells[rwSelect.Cells.Count - 1].Text);
                ArticlesTableAdapter tbaArticles = new ArticlesTableAdapter();

                AppData.ArticlesRow rwArticle =
                    (AppData.ArticlesRow)tbaArticles.GetDataByID(articleID).Rows[0];

                Response.Redirect("~/" + rwArticle.FilePath, false);
            }
            catch(Exception ex)
            {
                General.ErrorHandler(ex, "Exception thrown by Search.aspx.gvArticles_SelectedIndexChanged.");
            }
        }

        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            try
            {
                // Perform the search and rebind the grid.
                CreateArticleSearch();
                gvArticles.DataBind();
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Exception thrown by Search.aspx.cmdSearch_Click.");
            }
        }

        protected void CreateArticleSearch()
        {
            // Declare the base query and start the WHERE clause.
            string articleQuery = "SELECT DisplayTitle, ShortDescription, CreateDate, ArticleID FROM Articles ";
            string whereClause = "WHERE ";
            DateTime dateParse;

            try
            {
                // Important, clear the parameters first.
                Articles.SelectParameters.Clear();

                // Test the field to see if there's anything there.
                if (textTitle.Text.Length > 0)
                {
                    // If there is a value, add to the WHERE clause and add a parameter.
                    whereClause += "DisplayTitle LIKE @ArticleTitle ";
                    Articles.SelectParameters.Add("ArticleTitle", "%" + textTitle.Text + "%");
                }

                // Do the same for each subsequent field except test to see if the
                // WHERE clause already holds something and add AND as necessary.
                if (textSummary.Text.Length > 0)
                {
                    if (whereClause == "WHERE ")
                        whereClause += "ShortDescription LIKE @ArticleSummary ";
                    else
                        whereClause += "AND ShortDescription LIKE @ArticleSummary ";
                    
                    Articles.SelectParameters.Add("ArticleSummary", "%" + textSummary.Text + "%");
                }

                if (DateTime.TryParse(textDateFrom.Text, out dateParse))
                {
                    if (whereClause == "WHERE ")
                        whereClause += "CreateDate >= @DateFrom ";
                    else
                        whereClause += "AND CreateDate >= @DateFrom ";

                    Articles.SelectParameters.Add("DateFrom", dateParse.ToString());
                }

                if (DateTime.TryParse(textDateTo.Text, out dateParse))
                {
                    if (whereClause == "WHERE ")
                        whereClause += "CreateDate <= @DateTo ";
                    else
                        whereClause += "AND CreateDate <= @DateTo ";

                    Articles.SelectParameters.Add("DateTo", dateParse.ToString());
                }

                // Test WHERE clause to see if it contains anything.
                // Add it to the base query if it does.
                if (whereClause.Length > 6)
                {
                    articleQuery += whereClause;
                    articleQuery += " AND Active <> 0 AND SearchSelect <> 0";
                }
                else
                    articleQuery += " WHERE Active <> 0 AND SearchSelect <> 0";

                // Specify the command type for the SQLDataSource and attach the query.
                Articles.SelectCommandType = SqlDataSourceCommandType.Text;
                Articles.SelectCommand = articleQuery;

            }
            catch
            {
                throw;
            }
        }

        protected void gvArticles_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                // Refresh the search and rebind the grid.
                CreateArticleSearch();
                gvArticles.DataBind();
            }
            catch (Exception ex)
            {
                General.ErrorHandler(ex, "Exception thrown by Search.aspx.gvArticles_Sorting.");
            }
        }

        protected void gvArticles_DataBound(object sender, EventArgs e)
        {
            if (gvArticles.Rows.Count > 0)
            {
                // Show the number of articles in the grid.  Hide the grid if there are none.
                lblArticleCount.Text = gvArticles.Rows.Count.ToString() + " articles found.";
                pnlGrid.Visible = true;
            }
            else
                pnlGrid.Visible = false;
        }

        protected void cmdReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx", false);
        }

     }
 }