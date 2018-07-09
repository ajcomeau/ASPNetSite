using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using ComeauWebsite.Classes;

namespace ComeauWebsite.Articles
{
    public partial class _201206051547 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (textInput.Text.Length > 0)
                listResults.Focus();

        }

        private List<String> ManualCompare(string ValueList)
        {
            // Split the input list into an array using commas as a delimiter.
            string[] inputList = ValueList.Split(new char[] { ' ' });
            // Create a new list of Index Values to be returned.
            List<String> returnList = new List<String>();
            int arrayIndex = 0;
            bool match = false;

            // Add the first value from the input list to the return list.
            returnList.Add(inputList[0]);

            // Iterate through all the values in the input array.
            foreach (string inputValue in inputList)
            {
                match = false;
                // Skip first value since it's already been added to the return list.
                if (arrayIndex > 0)
                {
                    // Now iterate through all the values in the return list.
                    foreach (String textValue in returnList)
                    {
                        // If there's been no match yet and the text value of the current
                        // list item matches the input value, declare a match and increment the count.
                        if (!match && textValue == inputValue)
                            match = true;
                    }

                    // If no match has  been made, create a new item and add it to the list.
                    if (!match)
                        returnList.Add(inputValue);
                }

                // Increment the array place.
                arrayIndex++;
            }

            // Return the finished list.
            return returnList;
        }


        private List<String> DistinctValues(string ValueList)
        {
            // Split the input list into an array using commas as a delimiter.
            string[] inputList = ValueList.Split(new char[] { ',' });
            List<string> returnList = inputList.AsQueryable().Distinct().ToList();

            // Return the finished list.
            return returnList;
        }

        protected void cmdRun_Click(object sender, EventArgs e)
        {

            List<String> resultList = new List<String>();

            try
            {
                listResults.Items.Clear();

                if (textInput.Text.Length > 0)
                {
                    if (radOptions.SelectedValue == "0")
                        resultList = ManualCompare(textInput.Text);
                    else
                        resultList = DistinctValues(textInput.Text);

                    foreach (String resultItem in resultList)
                        listResults.Items.Add(resultItem);

                    if (resultList.Count > 1)
                    {
                        lblResult.BackColor = Color.Red;
                        lblResult.Text = "  FAIL  ";
                    }
                    else
                    {
                        lblResult.BackColor = Color.Green;
                        lblResult.Text = "  PASS  ";
                    }
                }
            }
            catch (Exception ex)
            {
                lblResult.BackColor = Color.Red;
                lblResult.Text = "  ERROR  ";
                General.ErrorHandler(ex, "Error thrown from article 20120651547.cmdRun_Click");
            }
        }
    }
}