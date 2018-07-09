<%@ Page Title="Sometimes, it's better to roll your own ... - Comeau Software Solutions" MetaDescription="Comparing the use of pre-made components to custom programming in Visual Studio." MetaKeywords="programming, object oriented, VB.NET, download, code, Ocala" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201206100958.aspx.cs" Inherits="ComeauWebsite.Articles._201206100958" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
        <span class="articletitle">Sometimes, it's better to roll your own ...</span><br />
        <span class="articlesub">Programming is more than click and drag. </span>&nbsp;</p>
    <p>
        A few years ago, after I got serious about sharpening my skills with <a target="_blank" href="http://www.asp.net/">ASP.NET</a>, 
        Microsoft&#39;s web building technology that blends HTML with .NET code to deliver 
        dynamic web pages, it didn&#39;t take me long to think of ways that I could use it 
        with this site. My other site, Drewslair.com, has gone through a mini-evolution 
        over the years, starting out in Microsoft Frontpage and then being converted 
        over to regular HTML and&nbsp; 
        <a target="_blank" href="http://www.amazon.com/gp/product/0596802447?ie=UTF8&tag=drewslaircom-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0596802447"
            target="_blank"><span style="color: #0000ff">Cascading Style Sheets</span></a> 
        so I could keep the same look and feel when I left FrontPage behind. Now, it 
        runs on WordPress.</p>
    <p>
        For a time, I switched the site over to ASP.NET which meant redoing the site in <a target="_blank" href="http://www.microsoft.com/visualstudio/en-us/default.mspx">
            Microsoft Visual Studio</a>.&nbsp; It took awhile but it was a fun
        project and I picked up some good experience which came in handy on later job 
        interviews.<br />
        <br />
        I didn't see myself needing to add user logins 
        or any other sophisticated features to the site  but I did
        have fun playing around with ASP.NET's navigation features and master 
        pages that I could use to replace the Server-Side Includes that I had used to share borders across
        the site. The tutorial that I was using advised using tables
        to setup the format for the master page that would be inherited by other pages but I quickly verified that the style sheet
        formatting worked just as well and I was able to keep the same look.<br />
        <br />
        What I thought would be an interesting touch would be to display random quotes in
        the top border of the site next to the site logo. It looked kind of empty as I'd
        never come up with something to put there.<br />
        <br />
    </p>
    <div class="fltcenter">
        <a target="_blank" href="../../images/desk/general/001-origheader.jpg">
            <img border="0" height="80" src="../Graphics/Content/001-origheader.jpg"
                width="382" /></a>
        <p>
            That's a big empty space.<br />
            </p>
    </div>
    I initially decided to store the quotes in a SQL Server 2005 database, pull them at random 
        when the page loaded and display them using a Literal control which accepts literal text,
    including HTML tags, and inserts it into the page. By feeding the right HTML code
    to the control, I could make it display the quote text with a carriage return between
    the quote and the author's name and position itself at exactly the spot on the page I wanted. 
        Making these functions part of the site's master page would cause all 
        pages based on it to inherit the functions.<br />
    <br />
    <p>First, though, I had to decide how I was going to <em>get</em> the data that I needed
    from the database. Here are the steps I decided to follow. </p>
    <ol>
        <li>Count the number of records in the quotes table.</li>
        <li>The quote IDs are sequential, so generate a random number between 1 and the number
            of quotes available.</li>
        <li>Go back to the database and get the record with a quote ID matching the number generated.</li>
        <li>If there&#39;s any error in retrieving a quote, manually display a quote that&#39;s 
            hard-coded into the site but not present in the database. This keeps the site 
            working and lets me know there&#39;s a problem.</li>
    </ol>
    <p>
        Ideally, step #4 would then have the site send me a notification by e-mail of the
        problem and maybe write the details of the error to a logfile but that can come
        later.&nbsp;</p>
    <p>
        Visual Studio features a SQLDataSource control which makes binding data to a 
        collection of page controls a breeze. You can throw this control on a page, 
        configure it through dialog settings and have the controls reference it to 
        display data. Saving and updating data back to the database is also ridiculously 
        easy. The problem was that in order to get the steps above to happen in the 
        right order, I needed to code them in Visual Basic rather than plot them out 
        through controls on the page. When I was working on the site redesign, I wasn&#39;t 
        able to find a way to do this with the SQLDataSource control. While the 
        page-bound controls could access the SQLDataSource&#39;s data, I had trouble getting 
        at that data through code.&nbsp;&nbsp;
    </p>
    <p>
        That's when I decided to go back to being a programmer and write my own 
        class
        to manage the connection to the database and accept SQL commands to return the data
        I needed in the form of string values and data tables. (<a target="_blank" href="dataclass.htm">Click 
        here to see the code.</a>) It took me longer than using
        the SQLDataSource but was much more satisfying and gave me the control I needed.
        Then I wrote the code in the Page_Load event of the master page to pass the necessary
        SQL commands to the data class, read the data coming back and display it on the
        page.&nbsp;(<a target="_blank" href="pageload.htm">Click to view the 
        code.</a>) Any page that inherits the master page would then display a quote as
        shown below.</p>
    <div class="fltcenter">
        <a href="../../images/desk/general/002-origheader.jpg" target="_blank">
            <img border="0" height="81" src="../Graphics/Content/002-origheader.jpg"
                width="521" /></a>
        <p>
            That's much better.</p>
    </div>
    <h5>
        Simpler Storage</h5>
    <p>
        After playing around with this for awhile and seeing it work, I started thinking
        that an entire SQL Server database was a little much for a read-only collection of quotes.&nbsp; It also required me to either login
        to the site control panel and go through a number of screens to add and edit quotes
        or setup a new page on the website just for that purpose and arrange the security
        so that nobody else could hack into it.&nbsp; That's when I decided to change to an
        <a target="_blank" href="http://en.wikipedia.org/wiki/XML">XML</a> quotes file instead.&nbsp; XML is a flat-file text format that uses custom tags very similar
        to HTML to format data in a way that can be easily translated to and from other
        database formats.&nbsp; Here's a sample of the quote file in XML:</p>
    <p class="code">
        &lt;Quote&gt;&nbsp;<br />
        &lt;QuoteText&gt;I love deadlines. I like the whooshing sound
        they make as they fly by.&lt;/QuoteText&gt; 
        <br />
        &lt;Author&gt;Douglas Adams&lt;/Author&gt;
        <br />
        &lt;/Quote&gt;
        <br />
        <br />
        &lt;Quote&gt;
        <br />
        &lt;QuoteText&gt;Every composer knows the anguish and
        despair occasioned by forgetting ideas which one had no time to write down.&lt;/QuoteText&gt;<br />
        &lt;Author&gt;Hector Berlinoz&lt;/Author&gt; 
        <br />
        &lt;/Quote&gt;
        <br />
        <br />
        &lt;Quote&gt;
        <br />
        &lt;QuoteText&gt;For
        disappearing acts, it's hard to beat what happens to the eight hours supposedly
        left after eight of sleep and eight of work.&lt;/QuoteText&gt; 
        <br />
        &lt;Author&gt;Doug
        Larson&lt;/Author&gt; 
        <br />
        &lt;/Quote&gt;</p>
 
    <p>
        As you can see, each quote block is marked by tags defining the data.&nbsp; The
        names of these tags are completely at my discretion as long as they're consistent.&nbsp;
        This results in a simple text file that I can easily update as needed.&nbsp; The
        program can then import the data from this file into a table, using the tags as
        column names and follow roughly the same steps to select a random quote; count the
        number available, generate a random number between 1 and the number available and
        then display the quote corresponding with that number in the list. (<a target="_blank" href="pageload2.htm">Click 
        to view the  code.</a>) There
        are fewer things that can go wrong since the program is dealing with a text file
        rather than going through another piece of software to access a proprietary database
        format.&nbsp; It's probably faster, too.</p>
    
    <h5>
        Back to SQL</h5>
    
    <p>
        Earlier, I mentioned that I did eventually find a way to tap into the 
        data coming from the SQLSourceControl and, rather than taking up design 
        space on the page, I declared it through code. (<a target="_blank" href="pageload3.htm">Click 
        to view the code.</a>)&nbsp; The Select command of the SQLDataSource 
        creates a DataView object, the DataTable of which can be read through 
        code.&nbsp; With a few extra statements, the quotes can be retrieved 
        into this table and a random quote can be selected as easily as from the 
        XML file.</p>
    
    <h5>
        Going Live</h5>
    
    <p>
        I couldn't offer this on the Web until I switched to a hosting service that supported ASP.NET.&nbsp;
        I hated leaving my <a href="http://www.icdsoft.com" target="_blank"><span style="color: #0000ff">
            old service</span></a> but in addition to the support for the new features,
        I gained some extra web resources and was able to setup two sites on the same hosting
        account.&nbsp; I finally decided to have one for Drewslair.com
        and one for ComeauSoftware.com (.net, .org ...).&nbsp; So, during 2010, I split ComeauSoftware.com 
        off to a new site which 
        hosted the ASP.NET pages while Drewslair.com  remained the same  to preserve the links on Google and other search engines.&nbsp;Sidetracked by other priorities, I didn't do much else with the ASP.NET 
        site and I decided to return to the previous host and a single 
        site. </p>

    <h5>
        Take Two</h5>
    <p>
        The experience with the ASP.NET site came in handy later one when I was going 
        after a couple of jobs requiring skills in web design. After working on several 
        web applications for outside companies and picking up even more experience, I 
        started thinking about trying again so I could get serious writing about .NET. 
        ComeauSoftware.com was reborn as the site you&#39;re enjoying right now!</p>
    <p>
        &nbsp;For the second try, I decided to go back to using a SQL database for the 
        quotes because, this time, I&#39;m also storing the information for the random book 
        links that you see on the left side of the screen and the details on the site&#39;s 
        articles. With that much data, a full database was just easier to work with. I 
        also switched from VB.NET to C# and used a
        <a href="http://www.4guysfromrolla.com/articles/020806-1.aspx" target="_blank">
        typed dataset</a> to represent and access the tables in the new database which 
        is why the code will be the subject of another article. The basic steps are 
        still the same, however; the list of quotes is pulled from the table, counted 
        and then a random number is generated to specify which will be selected. That 
        quote is displayed. The steps work the same for the selection of the book to be 
        displayed. There are more things I&#39;d like to do so this time, I&#39;ll try to keep 
        the site going for a lot longer than a year.&nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    
</asp:Content>
<asp:Content ID="Content5" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
    <h4>
    Summary:
</h4>
<p>
    While programming environments like Visual Studio offer a lot of ready-made 
    tools and controls, sometimes it&#39;s better to reach a little deeper into your 
    storehouse of knowledge and create your own custom functions so that things work 
    just right.</p>
</asp:Content>

