<%@ Page Title="Using Typed Datasets in Visual Studio - AndrewComeau.com" MetaDescription="An explanation of how typed datasets can simplify and organize your code." MetaKeywords="Visual Studio, programming, database, data, Comeau, C#, dataset, .NET, ADO.NET, Ocala, Florida" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201207102150.aspx.cs" Inherits="ComeauWebsite.Articles._201207102150" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<p><span class="articletitle">Tapping the Interface</span><br />
<span class="articlesub">Using typed datasets to move data in Visual Studio</span></p>
<p>If you've worked with 
Visual Studio or .NET for long, you're probably familiar with the <a target="_blank" href="http://msdn.microsoft.com/en-us/library/bwy42y0e">System.Data.DataSet</a> 
class which enables you to create a collection of data in 
memory, often retrieved from an SQL database. Within a dataset object, you can 
have a series of related
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/system.data.datatable.aspx">
DataTables</a> that categorize the data. Moving further down, each table can have 
multiple
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/system.data.datarow.aspx">
DataRow</a> objects. In effect, you can have an entire relational database in 
memory to which your application can refer and save changes, although in practice, I usually limit the data in memory to one 
    datatable or even a 
single datarow if possible, so as to avoid using too much memory.</p>

<pre>
using System.Data;
using System.Data.SqlClient;

public static DataSet GetQuotes()
{
    DataSet result = new DataSet();
    DataTable dtQuotes = new DataTable(&quot;Quotes&quot;);

    SqlDataAdapter daQuotes = new SqlDataAdapter(
       "SELECT * FROM Quotes",
        Properties.Settings.Default.AppDataConnectionString);
    daQuotes.Fill(dtQuotes);

    result.Tables.Add(dtQuotes);

    return result;
}
</pre>

<p>The above C# example code shows a function that  
returns a dataset containing a table of quotations like the ones you see at the 
top of the page.&nbsp; It declares the new dataset and empty table and then uses 
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/879f39d8(v=vs.71)">SQLDataAdapters</a> to retrieve the data from the 
table into the 
    datatable.&nbsp;The datatable is then added to the dataset which is returned 
as the output of the function.</p>

<p>The code that calls this function could then reference the data within the 
    dataset by referring to a specific table, rows and items. The following sample 
calls the function and refers to the Quotes table within the returned dataset, 
retrieving the QuoteText value from the first row.&nbsp; (Remember that row and 
column numbers start with 0.)</p>

<pre>DataSet dsQuotes = GetQuotes();
dsCustomer.Tables[&quot;Quotes"].Rows[0]["QuoteText"]
</pre>

<p>Once you understand the
<a target="_blank" href="http://www.codeproject.com/Articles/8477/Using-ADO-NET-for-beginners">
ADO.NET</a> dataset and other classes involved, this is a quick way to get data 
for your application from a database or an XML file and it's something that 
every programmer should be able to do. However, it's also a relatively manual 
process. As you can see in the last example above, referencing the data that's 
returned involves referring to rows by number and columns by number or name. You 
can use a loop to iterate through the rows or you can bind the table to a data grid but 
when referring to the columns, you still have to remember the ordinal number or 
the name that comes from the database. Unless you write nice, organized, 
classes that group all the database calls in one place, you could also have SQL 
statements, or preferably stored procedure references, scattered throughout your 
project.</p>
<p>Another type of dataset object in .NET solves some of these problems. The 
    <a href="http://www.4guysfromrolla.com/articles/020806-1.aspx" target="_blank">Typed Dataset</a> object is a graphical interface that enables you to simply drag 
database objects such as tables and stored procedures onto the dataset work 
area. The interface will then discover and document those objects and create 
custom data classes for them based on the ADO.NET classes mentioned above. For 
example, if you drag a Customers table onto the work area, it will create a CustomersDataTable class that can hold a collection of CustomerRow objects based 
on the table's design. The CustomerRow class will include a property for&nbsp; 
each of the fields in the Customers table and these properties can be referred 
to in code instead of the column name or number. A TableAdapter will also be 
created to go with the CustomersDataTable and this adapter will store the 
connection information and all the necessary SELECT, UPDATE, INSERT and DELETE 
queries can be automatically generated by Visual Studio based on the table 
structure. </p>
<p>To use a typed dataset, you have to add one as a new component in the 
project. You can do this by right-clicking on the project in the Solution 
Explorer or by selecting Add Component from the Project menu in Visual Studio. 
Select DataSet from the Data components, enter a name at the bottom and click 
Add. </p>
<div class="fltcenter"><a href="../Graphics/Content/021-dataset.jpg" target="_blank" 
        title="Click for full size view."><img border="0" 
        src="../Graphics/Content/021-dataset.jpg" width="500"></a></div>
<p>Visual Studio will then add the typed dataset to your project and open it in 
design mode. As you can see by the help text in the screenshot below, you can 
actually create dataset objects independently from a backend database using the 
    Dataset toolbox but when starting out, your main purpose will probably be to 
work with database objects. The Server Explorer is the Visual Studio window 
where you can work with SQL Server databases. If it's not visible, you can 
select it from the View menu.</p>
<div class="fltcenter"><a href="../Graphics/Content/022-newdataset.jpg" target="_blank" 
        title="Click for full size view."><img border="0" 
        src="../Graphics/Content/022-newdataset.jpg" width="500"></a></div>
        <p>&nbsp;</p>
<div class="fltcenter"><a href="../Graphics/Content/023-datasetquotes.jpg" target="_blank" 
        title="Click for full size view"><img border="0" 
        src="../Graphics/Content/023-datasetquotes.jpg" width="500"></a></div>
<p>The screenshots above show the dataset designer before and after 
the addition of the Quotes table. As you can see, the dataset designer has 
discovered three fields within the table and generated a Quotes datatable object 
for the table along with a QuotesTableAdapter object attached to it. It's even 
correctly identified the QuoteID field as the primary key. In the lower 
right-hand corner of the screenshot, you can see the properties for the 
TableAdapter which include the connection details and all queries. The SELECT 
command is expanded to show part of the SELECT statement that has been 
automatically generated based on the DataSet's analysis of the table.</p>
<p>In the Solution Explorer, the typed dataset is contained in an XSD file and 
you'll notice a few other files underneath it. These are automatically generated 
as you make changes within the dataset interface. The main file is the Designer.cs file which 
holds all of the code that defines and supports the objects created in the 
interface.</p>
<div class="fltcenter"><a href="../Graphics/Content/024-codebehind.jpg" target="_blank" 
        title="Click for full size view"><img border="0" 
        src="../Graphics/Content/024-codebehind.jpg" width="500" 
        title="Click for full size view"></a>&nbsp; </div>
<p>As it says in the file header, this file is not meant to be manually changed, 
although you should take a few minutes to look over it to see the sheer volume 
of code that Visual Studio generates in the background for just one or two 
objects within the interface.</p>
<p>Once the typed dataset is in place, you can refer to the custom objects 
through your code:</p>
<pre>using DataDemo.AppDataTableAdapters;

public static AppData.QuotesRow GetSampleData()
{
    QuotesTableAdapter tbaQuotes = new QuotesTableAdapter();
    AppData.QuotesDataTable dtQuotes = tbaQuotes.GetData();

    return (AppData.QuotesRow)dtQuotes.Rows[0];            
}
</pre>
<p>The above function actually returns an object from one of the custom classes 
in the typed dataset. Notice the extra Using statement at the top that 
references the collection of TableAdapters created by the dataset. The function 
declares a QuotesTableAdapter object which already includes a GetData function 
that uses the automatically generated SQL SELECT statement to select rows from 
the table. That function returns a QuotesDataTable object and the first row of 
that table is returned by this function as the result.&nbsp;The row collection 
in the QuotesDataTable object actually consists of generic datarow objects and, 
by default,
<a target="_blank" href="http://www.codeproject.com/Articles/9978/Complete-Comparison-for-VB-NET-and-C">
C# is stricter about conversions</a> than VB.NET so it's necessary to explicitly 
cast the row as a QuotesRow. Whatever code is calling this procedure, however, 
can do something like this:</p>
<pre>AppData.QuotesRow rwQuote = GetSampleData();
String QuoteText = rwQuote.QuoteText;
String Author = rwQuote.Author;
</pre>
<p>The text of the quote and the author which are stored in fields within the 
table are now properties of the QuotesRow object and can be called by name in 
the code.</p>
<p>In addition to the advantages in selecting and referencing data, the custom 
TableAdapter objects have auto-generated methods for updating and deleting rows 
that can be used as easily as the GetData method was used above.&nbsp; The 
TableAdapter manages the connections to the database and the typed dataset 
contains all of the SQL Statements or stored procedure references needed to 
carry out the operations.</p>
<p>Since I am firmly in the habit of using typed datasets to manage the data 
within my applications, I will be providing more information on how to work with 
them in future articles but this introduction should get you started if you 
haven't used them before. </p>
    <p>For more information:</p>
    <p><a href="http://www.codeproject.com/Articles/8477/Using-ADO-NET-for-beginners" 
            target="_blank">Using ADO.NET for Beginners</a> - CodeProject.com<br />
        <a href="http://www.4guysfromrolla.com/articles/020806-1.aspx" target="_blank">
        Using Strongly-Typed Data Access in Visual Studio 2005 and ASP.NET 2.0</a> - 
        4GuysFromRolla.com<br />
        <a href="http://www.codeproject.com/Articles/9978/Complete-Comparison-for-VB-NET-and-C" 
            target="_blank">Complete Comparison for VB.NET and C#</a> - CodeProject.com</p>
    <p>&nbsp;</p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <p class="articlesub">
        Summary</p>
    <p>
        A demonstration of how typed datasets can simplify and organize your Visual 
        Studio code and serve as a central data interface for your application.
    </p>
</asp:Content>

