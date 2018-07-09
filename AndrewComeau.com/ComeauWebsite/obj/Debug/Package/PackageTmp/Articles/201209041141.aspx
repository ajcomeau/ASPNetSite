<%@ Page Title="Microsoft SQL Server for Beginners, Part IV: The AdventureWorks Database - AndrewComeau.com" Language="C#" MasterPageFile="~/Site.Master" 
 MetaDescription="Downloading and installing Microsoft's AdventureWorks sample database for SQL Server. The article also features an explanation of running commands and scripts within SQL Server Management Studio."
 MetaKeywords="AdventureWorks, database, Microsoft, installation, SSMS, SQL Server Management Studio, SQLCMD mode, SQL script, SQL, T-SQL, query, relational, normalization"
AutoEventWireup="true" CodeBehind="201209041141.aspx.cs" Inherits="ComeauWebsite.Articles._201209041141" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span class="articletitle">Microsoft SQL Server for Beginners</span><br />
        <span class="articlesub">Part IV: Installing the AdventureWorks Database</span></p>
    
    <p><a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
    <p>In the <a href="201208271357.aspx">last part of this series</a> I wrote about SQL 
        Server Management Studio (SSMS), the interface that enables you to work with SQL Server 
        objects such as databases and tables. The program enables you to do quite a bit 
        with a SQL Server installation. You 
        can create entire databases and manuipulate all the objects within them just 
        through context menus.</p>
    <p>Having a graphical interface is nice but the real work of SQL Server is done 
        through commands issued to the service which the menu options in a program like 
        SSMS often do for you. If you really want to be knowledgeable about SQL Server, 
        it&#39;s important to learn the syntax of these commands and how to write and issue 
        them on your own.</p>
    <h5>The Database Language</h5>
    <p>SQL Server uses 
        <a href="http://www.drewslair.com/desk/access/beginners/sqlbasics.shtml" 
            title="More about SQL on Drewslair.com.">Structured Query Language (SQL)</a> and
        <a href="http://msdn.microsoft.com/en-us/library/bb510741.aspx" target="_blank" 
            title="More about T-SQL on Microsoft.com.">Transact-SQL (T-SQL)</a> to 
        communicate with the database service. SQL is actually a subset of T-SQL and is 
        not limited to Microsoft SQL Server. Implementations of the langauge are found 
        in many popular database systems including MySQL and <a target="_blank" 
            href="http://www.amazon.com/gp/product/B0061RK6VO/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0061RK6VO&linkCode=as2&tag=drewslaircom-20" 
            title="Microsoft Access for Beginners on Amazon.com.">Microsoft Access</a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B0061RK6VO" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
 although 
        there may be subtle differences in syntax.</p>
    <p>SQL includes commands to work with data at the table level. With SQL, you can 
        query or read data from one or more tables in a variety of ways as well as 
        insert, update and delete data. These comands are very close to real English and 
        might look something like this;</p>
    <p class="inlinecode">SELECT * FROM Customers</p>
    <p class="inlinecode">DELETE FROM Books WHERE BookID = 9</p>
    <p class="inlinecode">UPDATE Employees SET Status = &#39;Former&#39; WHERE EmployeeID = 10</p>
    <p>SQL can also be used to create tables, indexes and other database objects and 
        grant permissions on these objects to various users and groups. SQL operations 
        are generally performed one statement at a time. For a basic introduction to 
        SQL, refer to my
        <a href="http://www.drewslair.com/desk/access/beginners/sqlbasics.shtml" 
            target="_blank" title="Understanding SQL on Drewslair.com">Understanding SQL</a> 
        articles on Drewslair.com which provide the basic syntax that you can use for 
        querying databases along with additional resources. While these articles are 
        written for Microsoft Access users, the syntax applies to SQL Server as well.</p>
    <p>T-SQL is an expansion of SQL which enables the programmer to create entire 
        procedures that are run directly on the server and include an indefinite number 
        of individual SQL statements or T-SQL commands. These <em>stored procedures</em> 
        can include flow control statements such as IF ... ELSE and WHILE which grant 
        decision making abilities to the code. The procedures can respond to 
        errors, undo or roll back changes when necessary and use input, output and 
        internal variables during their operations. While SQL operates at the table 
        level, T-SQL operates at the database level, enabling the creation of entire 
        databases with all the objects and permissions necessary.</p>
    <p>In addition to stored procedures, SQL and T-SQL are used in the writing of 
        scripts which are used to make a series of changes within a database, often as 
        part of software deployment.&nbsp;Scripts can include commands to create or 
        alter stored procedures in addition to the other changes.&nbsp;These scripts 
        can be be run within SQL Server Management Studio and other SQL Server tools. 
        The advantage with SSMS is that it provides an easy way to edit the script or to 
        run selected parts of it if necessary. I&#39;l write more about both SQL and T-SQL 
        later but for now, I want to show you the basics of running a script in SSMS.</p>
    
    <div class = "bookdesc">
    <!-- Begin Amazon Image Link -->
        <a href="http://www.amazon.com/gp/product/0735658145/ref=as_li_ss_il?ie=UTF8&camp=1789&creative=390957&creativeASIN=0735658145&linkCode=as2&tag=drewslaircom-20">
        <img border="0" 
            src="http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=0735658145&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=drewslaircom-20" 
            align="left" ></a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=0735658145" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /><!-- End Amazon Image Link --><!-- Begin Amazon Text Link --><a href="http://www.amazon.com/gp/product/0735658145/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0735658145&linkCode=as2&tag=drewslaircom-20">Microsoft SQL Server 2012 T-SQL Fundamentals</a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=0735658145" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
    <!-- End Amazon Text Link -->
    <br>
    <span class="author">Itzik Ben-Gan</span>
    <br />
    <!-- Begin Amazon Kindle Link -->
    <a href="http://www.amazon.com/gp/product/B008HMNPZK/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B008HMNPZK&linkCode=as2&tag=drewslaircom-20">Kindle edition available</a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B008HMNPZK" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
    <!-- End Amazon Kindle Link -->
    <p>&nbsp;</p>    
    </div>
    
    <h5>Downloading the AdventureWorks Database</h5>
    <p>In the last chapter, I showed you how to create a basic database through SSMS but 
        you probably still don&#39;t have any significant databases to play around with and 
        learn from. Fortunately, Microsoft provides sample databases. One of these is 
        the AdventureWorks database, a customer and product database based around a 
        fictional company. On a desktop database like Microsoft Access, you would just 
        download a database file and open it in the program. There is a way to do 
        that in SQL Server but the Microsoft download I&#39;ll be using here is instead 
        packaged as a script with a collection of data files which provides us with a 
        good opportunity to learn more about running scripts on SQL Server.</p>
    <p>To download the database, go to the link below and download the AdventureWorks 
        2008 OLTP Script.ZIP file.&nbsp; It&#39;s just over 20 MB so it might take a few 
        minutes.</p>
    <p><a href="http://msftdbprodsamples.codeplex.com/releases/view/89502" 
            target="_blank">Download AdventureWorks Database</a> (will open in separate 
        window)</p>
    <p>If, for any reason, that page is not available, check out the
        <a href="http://msftdbprodsamples.codeplex.com/" target="_blank">main page here</a> 
        and look for a download that is marked as an OLTP Script.</p>
    <p>After you&#39;ve downloaded the database, unzip all the files to a location on your 
        computer. I recommend a directory directly under the C: root directory because 
        you&#39;ll need to type the address of the location later so it&#39;s best to keep it 
        simple. </p>
    <div class="fltcenter">
        <a target="_blank" href="../Graphics/Content/MSSBImages/MSSB011.jpg">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB011.jpg" width="500" /></a>
        <p>Click on image for full-size view.</p></div>
    <p>You&#39;ll see that the file contains over 70 files, mostly CSV files which contain the 
        data to be imported into the new database. Once you have Management Studio open 
        and have connected to your instance of SQL Server Express, you can open the 
        &quot;instawdb.sql&quot; script file from this directory using the File --&gt; Open menu or 
        Ctrl-O. The script will appear in the right side of the SSMS window.</p>
    <p>This is a very large script of over 7700 lines and it&#39;s written so that if there 
        are any errors, which there might be, it can simply be run over again. This script 
        will not make any changes outside of SQL Server and will not affect any other 
        data on your computer. It simply creates a new database within your instance of 
        SQL Server Express and all the necessary objects within that database. It then 
        imports the data from the CSV files into the appropriate tables. While the 
        database was created for SQL Server 2008, it will work in both the 2008 and 2012 
        versions.</p>
    <h5>Installation</h5>
    <p>Before you run the script, there are a couple of changes that you need to make 
        for it to run properly. First, as instructed in the script, Management Studio 
        needs to be running in SQLCMD mode which enables the program to run certain commands 
        that it couldn&#39;t otherwise. You can set this mode by selecting 
        &quot;SQLCMD mode&quot; from the Query menu in Management Studio. When you&#39;ve done this, 
        you&#39;ll see the &quot;on error exit&quot; line change so that it has a colored background 
        as shown in the screenshot below.</p>
    <div class="fltcenter">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB007.jpg" /></div>
    <p>The next thing to do is to make a couple of minor changes in the script itself. 
        In the following instructions, I&#39;ll be referring to line numbers. If you look at 
        the very bottom of the SSMS window, you&#39;ll see a status bar that shows line and 
        column numbers on the right. You can use these numbers for reference as you 
        scroll down to the necessary lines or you can use the Edit --&gt; Go to... menu 
        (Ctrl-G) to enter a line number to find in the script.</p>
    <p class="cautionnote">These line numbers should be treated as approximate. This 
        script is subject to revisions and the one that you download might not exactly 
        match the one that I used for this article.</p>
    <p>Near the top of the script, around line 37, you&#39;ll see two lines that 
        start with &quot;:setvar&quot;. These lines set variables that the script will use to reference the correct 
        directories. You need to uncomment these lines by removing the double dashes 
        (&quot;--&quot;) in front of them. Code lines can be commented in scripts by using these 
        double dashes at the beginning of the line or by using /* and */ at the 
        beginning and end of a block of text.</p>
    <p>Once you uncomment these lines, you&#39;ll need to change the path statements to 
        match the appropriate paths on your system. The first line shows the data 
        directory for your instance of SQL Server. It&#39;s probably under your Program 
        Files directory and might look like this:</p>
    <p>C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\</p>
    <p>Verify the correct path by navigating to your own data directory and place that 
        directory address in 
        the statement as shown. Be sure to include the backslash at the end of the 
        address because the 
        script will be attaching file names to this path during its operation.</p>
    <p>The second line tells the script where the script files are located on your system so 
        that it can find the CSV files and import the data. Replace the existing path 
        with the location that you used to unpack the files.</p>
    <p>There are a couple of elements in the script that use SQL Server&#39;s full text 
        indexing feature. If you have not installed this feature, the script will fail 
        when it gets to these points in the process. In that case, there are some lines 
        in the script that you need to comment out so that it will run normally. You can 
        do this by selecting the appropriate lines and using Ctrl-C to comment them or 
        by manually placing two dashes at the beginning of each line.</p>
    <ul>
        <li>Comment out the CREATE FULLTEXT INDEX commands near lines 3502 through 3523.</li>
        <li>Comment out the uspSearchCandidateResumes stored procedure 
            that demonstrates full text index searching. This procedure is located near 
            lines 5880 through 5933.</li>
    </ul>
    <p>Once you make the necessary changes, you&#39;re ready to run the script. One thing to 
        remember about running script items in SSMS is that if you have any parts of the 
        script selected, those are the only parts that will be run. In this case, you 
        want to run the entire script.&nbsp; You can 
        do this by selecting the entire script (Ctrl-A) or by selecting nothing at all. Then press F5 to run the script or click on the Execute toolbar 
        icon. Then wait. This is a long script and it carries out a lot of operations, 
        including importing all that data so it&#39;s going to take a minute. The 
        yellow bar at the bottom of the script window contains a timer that will show 
        you how long it&#39;s been running.</p>
    <div class="fltcenter">
        <a target="_blank" href="../Graphics/Content/MSSBImages/MSSB008.jpg">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB008.jpg" width="400" /></a>
        <p>Click on image for full-size view.</p></div>
    <p>The script contains statements that print out reports of its progress to the 
        screen but the 
        results screen shown in the bottom half of the screenshot above is not updated 
        until the script stops for some reason. Any messages in red mean 
        that errors occurred. You can actually double-click on these errors and the offending 
        line will be shown. For any errors, refer back to my instructions above or 
        search Google or MSDN with the text of the error and &quot;AdventureWorks&quot;. If you 
        can&#39;t find an answer, you can always 
        <a href="mailto:sitemaster@drewslair.com?subject=AdventureWorks Question">e-mail me here</a> and I&#39;ll offer whatever advice I can. 
        Once you fix any errors, you can re-run the script since it will overwrite its 
        previous work.</p>
    <p>If all goes well, you should see a results page reporting the statistics for the 
        new database.</p>
    <div class="fltcenter">
        <a target="_blank" href="../Graphics/Content/MSSBImages/MSSB009.jpg">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB009.jpg" width="400" /></a>
        <p>Click on image for full-size view.</p>
        </div>
    <h5>Exploring the Database</h5>
    <p>Once the database is installed correctly, there&#39;s nothing left to do but start 
        exploring it. The AdventureWorks database has almost 70 tables in it, many of 
        which are related to each other in one or more ways. If you expand the Tables item 
        under the database, you&#39;ll see that most of the tables are named according to 
        the department they fall under. I would also recommend keeping the database 
        script as a reference that you can explore as you learn about T-SQL. One of the 
        great things about the help system in SQL Server is that you can click on any of 
        the keywords within the script and press F1 to bring up a help page which will 
        often give you a full description and detail on that keyword.</p>
    <p>Doing queries against the tables within the AdventureWorks database is fairly 
        simple; right-click on the database itself and select &quot;New Query&quot; from the 
        context menu. A blank query window will open where you can enter the query.&nbsp; 
        I&#39;d recommend starting with SELECT queries if you&#39;re not very familiar with SQL&nbsp; 
        Then press F5 to run your new query.&nbsp; Remember that if you have multiple 
        queries within the window, you can select a specific query to run it separately 
        from the rest. Click on the screenshot below for some sample queries that you 
        can try out.</p>
        <div class="fltcenter"><a href="../Graphics/Content/MSSBImages/MSSB012.jpg"><img alt="" class="style4" src="../Graphics/Content/MSSBImages/MSSB012s.jpg" /></a><p>Click to view full size image.</p></div>
    <p>If you are familiar with relational database principles, Microsoft also offers a 
        diagram of the database which shows all the relationships between the tables. 
        You can download the diagram
        <a href="http://www.microsoft.com/en-us/download/details.aspx?id=10331" 
            target="_blank">on this page</a> or go to Microsoft.com and search for 
        &quot;AdventureWorks Database Diagram&quot;.&nbsp; There are two versions, one for HTML 
        and one for Microsoft Visio. The Visio version is the one I would recommend and 
        if you don&#39;t have Visio, you can also download a
        <a href="http://www.microsoft.com/en-us/download/details.aspx?id=21701" 
            target="_blank">free Visio viewer program</a> from Microsoft.</p>
<p>If you don&#39;t know about relational databases or data normalization yet, you can 
    check out the following links which provide an explanation of the basic 
    principles.</p>
    <p><a href="http://support.microsoft.com/kb/283878" target="_blank">Description of 
        the Data Normalization Basics</a> - Microsoft.com</p>
    <p><a href="http://msdn.microsoft.com/en-us/library/ms167593(SQL.105).aspx" 
            target="_blank">SQL Server Tutorials</a> - Microsoft.com</p>
    <p>Also check out the Drewslair.com articles on
        <a href="http://www.drewslair.com/desk/access/beginners/sqlbasics.shtml" 
            target="_blank">SQL basics</a> that I referred to earlier which will give 
        you enough SQL knowledge to get you started in querying the tables within the 
        database.</p>
    <p>&nbsp;</p>
</asp:Content>

