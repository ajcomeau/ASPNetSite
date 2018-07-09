<%@ Page Title="Tweaking the System: Finding the most efficient programming solutions - AndrewComeau.com" MetaDescription="An example of how the need for efficiency affects programming and design decisions." MetaKeywords="website, software, design, programming, C#, ASP.NET, SQL, T-SQL, stored procedure, code, Comeau, Ocala, Florida" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201207121656.aspx.cs" Inherits="ComeauWebsite.Articles._201207121656" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<p><span class="articletitle">Tweaking the System</span><br />
<span class="articlesub">Finding the most efficient application design</span></p>
<p>Like any system, one of the important traits of a good computer program is 
the efficiency with which it runs. Many people might think of this in terms of 
how fast it loads or how dependable it is. It can also be measured by how well 
organized the interface is which determines how successful the program is in 
enabling the user to do their job. Programmers like myself also look at how much 
memory the program uses which can determine whether the program will run 
reliably or whether the user will be plagued with crashes and blue screens.</p>
<div class="fltright">
<a target="_blank" href="http://www.flickr.com/photos/eyeliam/">
    <img border="0" src="../Graphics/Content/026-design.jpg" width="200" 
        title="Photo courtesy of eyeliam (Flickr.com)" /></a></div>
<p>Designing an efficient application actually starts during the planning phase 
when the developer is determining what resources the program will use and how it 
will access them. How many users will be running this application? What kind of 
machines or devices will they be using to run it? How much data is transferred 
over the network or to and from the database? Do we need to reduce those demands 
and how can we accomplish that? These are questions that are as appropriate for 
small programs written by sole developers as they are in corporate environments 
where multiple enterprise systems are running and competing for resources. The 
home user who downloads a program that behaves badly is just as much a customer 
as the production user who can't get their job done or the I.T. administrator 
who's yelling about system resources being squandered because a program from I.T. 
isn't working right.</p>
<p>Sometimes efficient design is an ongoing process. Programmers are only human 
and often can't see the outcome except in hindsight. That's when optimizations 
and bug fixes are needed to iron out the wrinkles that pop up from time to time. 
I touched on this in my <a href="201206051547.aspx">article on algorithms</a> when I mentioned designing an 
application to fit an existing problem and I'd like to give another example of 
it here.</p>
<p>When I was designing this site, I decided that I was going to have some 
dynamic features added to each page. The random quotes and advertisements on 
each page are examples of this and I decided to store the information for these 
items in a database that the pages could pull from. Database access is one of 
the most obvious places to look for increasing application efficiency. How is 
the data in the database itself organized? How many times does the program have 
to go back to the database to get a single task done? How much data will 
ultimately be stored? Sometimes the question comes down to where in the system 
    various tasks will be performed.</p>
<p>The basic algorithm for both the quotations and the advertisements is this:</p>
<ol>
  <li>Count the number of eligible records in the appropriate table.</li>
  <li>Generate a random number that is equal to or less than the number of 
  records found.</li>
  <li>Select the matching record from the table.</li>
  <li>Use the data to populate the fields on the page.</li>
</ol>
<p>Those are the steps. The requirements are that the process has to happen in a 
short enough time that it doesn't create a noticeable delay in loading the page. 
That would annoy the user and I don't want that. Since there are two items being 
populated from two different tables, it actually has to happen twice. There's 
also a possibility that I will want to add a <em>third</em> feature so it has to be 
especially efficient and <em>modular</em>, meaning that multiple versions of the process 
can be easily strung together like train cars; fitting easily into the 
collection but still separate. The small amount of data that I was initially 
working with, about a dozen quotes and the about the same number of ads, should 
also be able to increase without causing problems. </p>
<p>Understand that when a page from this site is being served, there are two 
systems on the web server that are communicating; ASP.NET which is running the 
Visual Studio code and SQL Server which houses the database and responds to data 
requests from ASP.NET. Although I am capable with SQL Server and stored 
procedures, I'm a .NET programmer first so I started with that. Let's take a 
look at the code for the function that retrieves the quotes.</p>
<pre>public void GetQuote()
{
    // Reads a random quote from the site_quotes file and displays it
    // as part of the page header section.

	// Declare variables
	AppData.QuotesDataTable dtQuotes;
	AppData.QuotesRow QuoteRow;
	Random numberGen = new Random();
	int QuoteCount;
	int QuoteSelect;
	
    try
    {
	// Read quotes table from database.
        QuotesTableAdapter tbaQuotes = new QuotesTableAdapter();
        dtQuotes = tbaQuotes.GetData();

	// Count quotes and pick random quote
        QuoteCount = dtQuotes.Rows.Count;
        QuoteSelect = numberGen.Next(QuoteCount);
        QuoteRow = (AppData.QuotesRow)dtQuotes.Rows[QuoteSelect];

	// Display selected quote
        QuoteBox.Text = QuoteBoxText(QuoteRow.QuoteText, QuoteRow.Author);
    }
    catch
    {
        QuoteBox.Text = QuoteBoxText("The law of unintended consequences " +
        "governs all technological revolutions.", "Arnold J. Toynbee");
        throw;
    }
}
</pre>

</p>
<p>This code references custom data classes from a typed dataset which I 
describe in 
<a href="201207102150.aspx">another&nbsp;article</a>. The process is described in the comments, however. 
    The code 
requests ALL quotes from the database table and loads them into memory. It then generates 
a random number based on the number of quotes in the table, selects the 
corresponding quote from the collection, displays the quote in the control on 
the page and discards the rest. If there's any error, the CATCH portion of the 
code displays a standard quote and throws the error forward to be handled 
later.</p>
<p>This is okay and ran just fine with the small number of quotes that I 
mentioned. The C# language shown above is also a little more flexible than a stored 
    procedure in generating random 
numbers. Loading the entire table into memory is not the most efficient way of 
doing things, however, and I knew the solution wouldn't last so I started 
looking at ways of having SQL Server do it through a stored procedure. If you're 
not familiar with
<a target="_blank" href="http://en.wikipedia.org/wiki/Stored_procedure">stored 
procedures</a>, they are basically subroutines that are called by a database like 
    MySQL and SQL Server. In addition to the normal data manipulation functions of 
    SQL, they include programming structure like decision statements and loops. In 
    Microsoft SQL Server, they&#39;re written in a language called
    <a href="http://en.wikipedia.org/wiki/Transact-SQL" target="_blank">Transact-SQL 
    (T-SQL)</a>.</p>

<pre>CREATE PROCEDURE dbo.GetRandomQuote 

AS

-- Declare variables
DECLARE @QuoteCount int
DECLARE @QuoteSelect int

-- Count number of quotes and generate random number.
SET @QuoteCount = (SELECT COUNT(*) FROM Quotes)
SET @QuoteSelect = 
(CAST((RAND(DATEPART(microsecond, GETDATE())) * @QuoteCount) + 1 AS INT));

-- Add row numbers to list of quotes and select quote where row number 
-- matches @QuoteSelect
WITH QuoteCollection AS
(
	SELECT	QuoteID, QuoteText, Author, 
		ROW_NUMBER() OVER (ORDER BY QuoteID) AS RowNumber 
	FROM 	Quotes
)
SELECT 	QuoteID, QuoteText, Author FROM QuoteCollection
WHERE 	RowNumber = @QuoteSelect

GO
</pre>
<p>This code might look a little more intimidating than the previous C# code but 
it does pretty much the same thing. The @QuoteCount variable holds the number of 
quotes available and the @QuoteSelect variable holds a random number generated 
by the <a href="http://msdn.microsoft.com/en-us/library/ms177610.aspx" 
        target="_blank">RAND()</a> function and using the microsecond portion of the current date and 
time as a seed to help ensure a truly random number. The 
    <a href="http://msdn.microsoft.com/en-us/library/ms175972.aspx" target="_blank">WITH</a> and 
    <a href="http://msdn.microsoft.com/en-us/library/ms186734.aspx" target="_blank">ROW_NUMBER()</a> 
functions are used to generate a list of the available quotes with row numbers 
that the procedure can use to select from with the @QuoteSelect variable and the 
last two lines actually return the selected record to whatever code is calling 
the stored procedure. A similar stored procedure is used to pull a random 
advertisement to display on left side of the page.</p>
<p>To use this stored procedure in ASP.NET, I add it to the typed dataset that 
is supplying the data to the application. It's added as an extra Query on the 
QuotesDataTable class. When doing this, it's important to ensure that the data 
returned by the procedure matches the structure of the class shown. In this 
case, the three fields being returned by the procedure (QuoteID, QuoteText, 
Author) match the fields in the QuotesDataTable class.</p>
<p><img border="0" src="../Graphics/Content/025-randomquote.jpg" width="525"></p>
<p>Now that the procedure is available to the program, the Visual Studio code 
gets a lot simpler.</p>
<pre>        
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
</pre>
<p>Instead of pulling the entire table, ASP.NET requests ONE random quote from the 
server and displays it for the reader to see. Since the procedure for the site 
advertisements does the same thing, the page load event simply calls both 
procedures in turn.</p>
<pre>protected void Page_Load(object sender, EventArgs e)
{
    // Get new quote and site ad.

    try
    {
        GetQuote();
        GetSiteAd();
    }
    catch (Exception ex)
    {   
        // Error handling code ...
    }
}
</pre>
<p>That's the modular design I was mentioning earlier. Since this load event is 
actually on a single master page that's inherited by all the other pages on the 
site, if I want to remove part of this functionality, I change one line and if I 
want to add a similar function, I can adapt much of the code into new procedures 
and then add one line to the load event to call them. </p>
<p>With the bulk of the processing done on SQL Server rather than through 
ASP.NET, the loading of the pages on the site did seem to improve slightly. It 
might have actually shaved as much as a second from the load time. Another 
advantage is that it's easier to change a stored procedure than it is to change 
the programming behind the site. Changes to a stored procedure take effect as 
soon as they are saved whereas changes to the site have to be published to the 
server. </p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <p class="articlesub">
        Summary:</p>
    <p>
        Efficiency is one of the overriding considerations when designing almost any 
        kind of application. This requirement affects everything from the algorithms 
        used to the distribution of work within the system.</p>
</asp:Content>

