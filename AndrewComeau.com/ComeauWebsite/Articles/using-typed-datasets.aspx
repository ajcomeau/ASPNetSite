﻿<%@ Page Title="Using Typed Datasets in Visual Studio - Comeau Software Solutions" 
MetaDescription="An explanation of how typed datasets can simplify and organize your code." 
MetaKeywords="Visual Studio, programming, database, data, Comeau, C#, typed dataset, .NET, ADO.NET, Ocala, Florida" 
Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="using-typed-datasets.aspx.cs" Inherits="ComeauWebsite.Articles._201207102150" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p><span class="articletitle">Tapping the Interface</span><br />
<span class="articlesub">Using typed datasets to move data in Visual Studio</span></p>
<p>One of the most important functions of many programs is the transfer of data, 
    usually to and from a database. Whether it&#39;s an address book or an accounting 
    system, most programs deal with data at some point and a major part of writing 
    those programs is accounting for how the program will store and manage that 
    data. That holds true in the .NET languages as well as any other programming 
    environment.</p>
    <p>If you've worked with 
Visual Studio or .NET for long, you're probably familiar with the <a target="_blank" href="http://msdn.microsoft.com/en-us/library/bwy42y0e">System.Data.DataSet</a> 
class and its hierarchy of data classes which enable you to create a collection of data in 
memory, usually retrieved from a database. Within a DataSet object, you can 
have a series of related
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/system.data.datatable.aspx">
DataTables</a> that categorize the data. Moving further down, each table can have 
multiple
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/system.data.datarow.aspx">
DataRow</a> objects. In effect, you can have an entire relational database in 
memory to which your application can refer and save changes although, in practice, I usually limit the data in memory to one 
        DataTable or even a 
single DataRow if possible, so as to avoid using too much memory.</p>

<pre>
using System.Data;
using System.Data.SqlClient;

public static DataTable GetQuotes()
{
    DataTable dtQuotes = new DataTable(&quot;Quotes&quot;);

    SqlDataAdapter daQuotes = new SqlDataAdapter(
       "SELECT * FROM Quotes",
        Properties.Settings.Default.AppDataConnectionString);

    daQuotes.Fill(dtQuotes);

    return <strong>dtQuotes</strong>;
}
</pre>

<p>The above C# example code shows a function that  
returns a DataTable containing a list of quotations like the ones you see at the 
top of the page. It declares a new empty DataSet and and then uses 
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/879f39d8(v=vs.71)">SQLDataAdapters</a> to retrieve the data from 
    a database into a DataTable which is then added to the new DataSet which is returned 
as the output of the function.</p>

<p>Whatever code calls this function could then reference the data within the 
    DataTable by referring to specific rows and items. The following sample 
calls the function and refers to the Quotes table, 
retrieving the QuoteText value from the first row.&nbsp; (Remember that row and 
column numbers start with 0.)</p>

<pre>DataTable dsQuotes = GetQuotes();
dsQuotes.Rows[0]["QuoteText"];
</pre>

<p>Once you understand the
<a target="_blank" href="http://www.codeproject.com/Articles/8477/Using-ADO-NET-for-beginners">
ADO.NET</a> DataSet and other classes involved, this is a quick way to get data 
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
    <a href="http://www.4guysfromrolla.com/articles/020806-1.aspx" target="_blank">Typed DataSet</a> 
    is a data class which is automatically generated by Visual Studio through the 
    use of a graphical interface which enables you to simply drag 
database objects such as tables and stored procedures onto the DataSet work 
area. The interface will then discover and document those objects and create 
custom data classes for them based on the ADO.NET classes mentioned above. It will 
    also create TableAdapters which will manage the communication with the database 
    and will generate the correct connection strings and SQL queries to perform all 
    of the reads and updates needed. Individual fields within the tables become 
    named properties of the new data classes that can be referenced in code. Custom 
    functions can be attached to these classes to specify the data to be retrieved 
    into the resulting data objects.</p>
    <div class="fltcenter">
        <a href="../Graphics/Content/029-sitedataset.jpg" target="_blank">
        <img src="../Graphics/Content/029-sitedataset.jpg" width="500" alt="An image of a typed dataset design view in Visual Studio 2010" title="The typed dataset generates custom data classes for tables and other objects within the database." /></a>
        <p>Figure 1 - The typed dataset generates custom data classes for tables and other objects within the database. 
            (Click for larger view.)</p>    
    </div>
    <p>For 
example, if you drag a Customers table onto the work area, it will create a CustomersDataTable class that can hold a collection of CustomerRow objects based 
on the table's design. The CustomerRow class will include a property for 
each of the fields in the Customers table and these properties can be referred 
to in code instead of the column name or number. A TableAdapter will also be 
created to go with the CustomersDataTable. this adapter will store the 
connection information and manage the connection whenever data needs to be transferred. 
        All the necessary SELECT, UPDATE, INSERT and DELETE 
queries can be automatically generated by Visual Studio based on the table 
structure. </p>
    <p>Figure 1 shows the typed dataset for this site in Visual Studio 2010. There are 
        three tables including the table for the quotes mentioned earlier, a table for 
        articles included on the site and one for the advertisements you see on the left 
        of the page. The tables themselves are showing on the left of the screenshot and 
        they have been added to the the dataset designer where they&#39;ve been translated 
        into data classes, each with its own TableAdapter and custom functions.</p>
<p>To create a typed dataset, you have to add one as a new component in the 
project. You can do this by right-clicking on the project in the Solution 
Explorer or by selecting &#39;Add Component&#39; from the Project menu in Visual Studio. 
Select the DataSet from the Data components, enter a name at the bottom and click 
    the Add button.&nbsp; </p>
<div class="fltcenter"><a href="../Graphics/Content/021-dataset.jpg" target="_blank" 
        title="Click for full size view."><img border="0" 
        src="../Graphics/Content/021-dataset.jpg" width="500" 
        alt="A typed dataset is is added as a new item within a Visual Studio project. " 
        title="A typed dataset is is added as a new item within a Visual Studio project. (Click for larger view.)"></a><p>Figure 2 - 
        A typed dataset is is added as a new item within a Visual Studio project. (Click 
        for larger view.)</p></div>
<p>Visual Studio will then add the typed dataset to your project and open it in 
design mode. The Server Explorer is the Visual Studio window 
where you can work with SQL Server databases. If it's not visible, you can 
select it from the View menu. If you&#39;re working with the Express edition of Visual 
    Studio, the general equivalent is the Database Explorer panel.</p>
<div class="fltcenter"><a href="../Graphics/Content/022-newdataset.jpg" target="_blank" 
        title="Click for full size view."><img border="0" 
        src="../Graphics/Content/022-newdataset.jpg" width="500" 
        alt="A new, empty typed dataset in Visual Studio." 
        
        title="A new, empty typed dataset in Visual Studio. (Click for larger view.)"></a>
        <p>Figure 3 - A new, empty typed dataset in Visual Studio. (Click for larger view.)</p>
    </div>
        <p>&nbsp;</p>
<div class="fltcenter"><a href="../Graphics/Content/023-datasetquotes.jpg" target="_blank" 
        title="Click for full size view"><img border="0" 
        src="../Graphics/Content/023-datasetquotes.jpg" width="500" 
        alt="New data classes are created simply by dragging database objects onto the dataset design area." 
        title="New data classes are created simply by dragging database objects onto the dataset design area. (Click for larger view.)"></a>
        <p>Figure 4 - New data classes are created simply by dragging database objects onto the dataset design area. 
            (Click for larger view.)</p></div>
<p>Figures 3 and 4 show the dataset designer before and after 
the addition of the Quotes table. As you can see, the dataset designer has 
discovered three fields within the table and generated a Quotes DataTable object 
for the table along with a QuotesTableAdapter object attached to it. It's even 
correctly identified the QuoteID field as the primary key. In the lower 
right-hand corner of the screenshot, you can see the properties for the 
TableAdapter which include the connection details and all queries. The SELECT 
command is expanded to show part of the SELECT statement that has been 
automatically generated along with the UPDATE, INSERT and DELETE commands based on 
    Visual Studio&#39;s analysis of the table.</p>
    <p class="code">SELECT QuoteID, QuoteText, Author FROM dbo.Quotes</p>
<p>In the Solution Explorer, the typed dataset is contained in an XSD file and 
you'll notice a few other files underneath it. These are automatically generated 
as you make changes within the dataset interface. The main file is the Designer.cs file which 
holds all of the code that defines and supports the objects created in the 
interface.</p>
<div class="fltcenter"><a href="../Graphics/Content/024-codebehind.jpg" target="_blank" 
        title="Click for full size view"><img border="0" 
        src="../Graphics/Content/024-codebehind.jpg" width="500" 
        
        title="The typed dataset generates a substantial amount of code to support all of its functions. (Click for larger view.)" 
        alt="A view of the auto generated code behind a Visual Studio typed dataset."></a>&nbsp;
        <p>Figure 5 - The typed dataset generates a substantial amount of code to support 
            all of its functions. (Click for larger view.)</p></div>
<p>As it says in the file header in Figure 5, this code is not meant to be manually changed, 
although if you create your own dataset, you should take a few minutes to look over it to see the sheer volume 
of code that Visual Studio generates in the background for just one or two 
objects within the interface.</p>
<p>Once the typed dataset is in place, you can refer to the custom objects 
through your code rather than generic data objects.:</p>
<pre>using DataDemo.AppDataTableAdapters;

public static AppData.QuotesRow GetNewQuote()
{
    QuotesTableAdapter tbaQuotes = new QuotesTableAdapter();
    AppData.QuotesDataTable dtQuotes = tbaQuotes.GetData();

    return (AppData.QuotesRow)dtQuotes.Rows[0];            
}
</pre>
<p>The above function actually returns an object from one of the custom classes 
in the Typed DataSet. Notice the extra Using statement at the top that 
references the collection of TableAdapters created by the DataSet. The function 
declares a QuotesTableAdapter object which already includes a GetData function 
that uses the automatically generated SQL SELECT statement to select rows from 
the table. That function returns a QuotesDataTable object and the first row of 
that table is returned by this function as the result.&nbsp;The row collection 
in the QuotesDataTable object actually contains generic DataRow objects and, 
by default,
<a target="_blank" href="http://www.codeproject.com/Articles/9978/Complete-Comparison-for-VB-NET-and-C">
C# is stricter about conversions</a> than VB.NET so it's necessary to explicitly 
cast the row as a QuotesRow. Whatever code is calling this procedure, however, 
can do something like this:</p>
<pre>AppData.QuotesRow rwQuote = GetNewQuote();
String QuoteText = rwQuote.<strong>QuoteText</strong>;
String Author = rwQuote.<strong>Author</strong>;
</pre>
<p>The text of the quote and the author, which are stored in fields within the table, 
    are now properties of the QuotesRow object and can be called by name in the code 
    rather than having to remember the table field names or guess at the ordinal 
    numbers. While this is a simple example, this ability can save a lot of time and 
    effort when it comes to working with multiple large tables within an enterprise 
    application.</p>
<p>In addition to the advantages in selecting and referencing data, the auto-generated methods for updating and deleting rows 
    come in especially handy when binding form controls 
    such as datagrids to data within your database. Multiple types of changes made 
    through a form by the user can be saved with a single command because the 
    DataSet and TableAdapters are able to use the correct commands to save the 
    changes to each row of data. For an example of this, see my other article
    <a href="moving-to-visual-studio.aspx">Moving Beyond Microsoft Access</a>. </p>
    <h3>For more information:</h3>
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

