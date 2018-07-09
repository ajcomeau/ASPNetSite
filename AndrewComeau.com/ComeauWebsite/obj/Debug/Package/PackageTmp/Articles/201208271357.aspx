<%@ Page Title="Microsoft SQL Server for Beginners, Part III: SQL Server Management Studio - AndrewComeau.com" Language="C#" MasterPageFile="~/Site.Master" 
 MetaDescription="Using Microsoft SQL Server Management Studio to connect to a SQL Server instance and create a basic database."
 MetaKeywords="Microsoft, SQL, SQL Sever, management studio, SSMS, I.T., database, DBMS"
AutoEventWireup="true" CodeBehind="201208271357.aspx.cs" Inherits="ComeauWebsite.Articles._201208271357" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 416px;
            height: 311px;
        }
        .style5
        {
            width: 399px;
            height: 101px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span class="articletitle">Microsoft SQL Server for Beginners</span><br />
        <span class="articlesub">Part III: SQL Server Management Studio</span></p>
    <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
    <p>
        Once you have SQL Server and all the necessary updates installed, the next step 
        is to learn how to create databases and work with them. The easiest interface 
        available to the beginner is Microsoft SQL Server Management Studio (SSMS), a 
        graphical environment where you can view and manipulate all of the databases and 
        other objects on your SQL Server instance and perform other advanced functions.</p>
    <div class="fltright"><img src="../Graphics/Content/MSSBImages/MSSB001.jpg" /></div>
    <p>
        If you 
        installed the Express edition with management tools or advanced tools as 
        detailed in <a href="201208201834.aspx">the last chapter</a>, you should have SSMS installed and showing
        in the Program Menu under whichever version of SQL Server you have installed. 
        Just click on the program to open it.</p>
    <h5>
        Connecting to a SQL Server</h5>
    <p>
        Management Studio is able to connect to both local instances of SQL Server that 
        are installed on your system and remote instances installed on other servers. I 
        use it to connect over the Internet to the SQL Server instance that provides 
        data to this website as well as my local SQL Server instance.</p>
    <p>
        When you first open SSMS, it will show you the login screen which enables you to 
        select the server you want to connect to. As you add servers, the connection 
        information will be saved and you will be able to select that information for 
        future sessions.</p>
    <div class="fltcenter">
        <img class="style4" src="../Graphics/Content/MSSBImages/MSSB002.jpg" /></div>
    <p>
        &nbsp;</p>
    <p>
        As you can see by the screenshot, I&#39;m using the 2008 version of SQL Server for 
        this demonstration. As of this writing, the latest version is SQL Server 2012 
        but the 2008 version is still
        <a href="http://www.microsoft.com/en-us/download/details.aspx?id=30438" 
            target="_blank">available for download</a> and is the last version to 
        support Windows XP. Unless otherwise specified, everything in this article 
        applies to both the 2008 and 2012 versions.</p>
    <p>
        In the screenshot above, the server name is the computer name followed by the 
        SQL Server instance name.&nbsp; In SQL Server Express, this is true for both 
        default and named instances of SQL Server except that the default instance will 
        be named SQLEXPRESS&nbsp;as shown here.&nbsp;I have this installation setup 
        for Windows Authentication mode so I&#39;m automatically logged in with my Windows 
        user name and password. All I have to do is hit Connect.</p>
    <div class="fltcenter">
        <a href="../Graphics/Content/MSSBImages/MSSB003.jpg" target="_blank">
        <img src="../Graphics/Content/MSSBImages/MSSB003.jpg" width="300" /></a>
        <p>Click image for full-size view.</p></div>

        <p>Once SSMS connects to the server, you should see a screen like the one shown in 
            the above screenshot. The Object Explorer on the left of the screen shows all 
            the database objects on the server as well as other management tools for the SQL 
            Server instance itself. In this shot, I have a few of the items expanded, 
            including a custom database that I created called Contacts and a single table 
            called MainContacts.&nbsp; I&#39;d recommend taking some time to explore the various 
            objects within the Object Explorer by right-clicking on them and seeing the 
            various options presented to you.</p>
    <h5>Creating Your First Database</h5>
    <div class="fltright">
        <img src="../Graphics/Content/MSSBImages/MSSB004.jpg" /></div>
    <p>For all the capabilities of SQL Server, creating a database is actually simple 
        although there are quite a few options and settings that you can use to 
        administer it properly.&nbsp; To create a new database, simply right-click on 
        the Databases item in the Object Explorer and select &quot;New Database&quot;. SSMS will 
        open the dialog window in the below screenshot with all the options for naming 
        and creating a new database. The only thing you really have to provide is a 
        name. The rest of the options can be safely left at the defaults but again, it&#39;s 
        a good idea to explore them.</p>
    <div class="fltcenter">
        <a href="../Graphics/Content/MSSBImages/MSSB005.jpg">
        <img src="../Graphics/Content/MSSBImages/MSSB005.jpg" width="300" /></a>
        <p>Click image for full-size view.</p>
        </div>
        <p>
            The database files section under the General page enables you to specify the 
            initial size of the database and how SQL Server will manage its growth. You can 
            also specify where the database will be located although it&#39;s best to 
            leave it in the default location unless you have a specific reason for putting 
            it elsewhere.</p>
    <p>
        The second Options page contain more lower level settings, many of which 
        probably won&#39;t mean much to you until you&#39;re very familiar with SQL Server but 
        it wouldn&#39;t hurt to learn more about them now. SQL Server uses MSDN as a help 
        resource so, as long as you have an Internet connection, you can just hit F1 on 
        any screen to find out more.</p>
    <p>
            When creating a database in this way, there is a Management Studio issue that 
            you might run into. If you&#39;re using the new LocalDB version of SQL Server 2012, 
            SSMS attempts to create the database under a hidden subdirectory of your User 
            directory in Windows and is denied access. A message box is displayed with SQL 
            Error 5105 and the message &quot;CREATE DATABASE failed&quot;. Even if it could create the database 
            file, you would have a hard time finding it. There are a couple of 
            <a href="http://www.stratospher.es/blog/post/error-creating-database-in-localdb-using-sql-server-management-studio-2012-ssms" 
                target="_blank" 
                title="See Adam Hoffman's article on this issue at http://stratospher.es.">ways around 
            this problem</a>. The first is to use the options panel in the screenshot above to 
            manually set the database directory. Under the Database Files list, use the 
            scroll bar to scroll over to the Path setting and manually set it to another 
            location on your hard drive.</p>
    <div class="fltcenter">
            <img alt="" class="style5" src="../Graphics/Content/MSSBImages/MSSB013.jpg" /></div>
    <p>
        The other option is to create the database using a query statement. To do this, 
        select File --&gt; New --&gt; Query with Current Connection. This will open up a new 
        query window where you can type SQL and T-SQL commands to communicate with the 
        database. Type the following and then press the F5 button to run it.</p>
    <pre>
        CREATE DATABASE TestDB</pre>
    <p>
        This is the T-SQL statement to create a new database and SSMS will place the new 
        database files under the user directory where it has access but will not bury 
        them in the lower levels. After SSMS completes the task, it should show a 
        message window underneath the script to confirm that it was successful. I will 
        write more about T-SQL scripts in <a href="201209041141.aspx" 
            title="Using T-SQL and installing the AdventureWorks Database">an upcoming 
        chapter</a>.</p>
    <h5>
        Adding Tables</h5>
    <p>
        Once you&#39;ve created the database, you&#39;ll probably want to create a table or two 
        in which to store your data. Again, it&#39;s as simple as expanding the object view 
        under your database, right-clicking on the Tables item and selecting &quot;New Table&quot;.
        </p>
    <div class="fltcenter">
        <a href="../Graphics/Content/MSSBImages/MSSB006.jpg">
        <img src="../Graphics/Content/MSSBImages/MSSB006.jpg" width="300" /></a>
        <p>Click image for full-size view.</p></div>
    <p>
        If you view the full-size version of the screenshot above, you&#39;ll see that the 
        table design environment is divided into three sections that take up the rest of 
        the Management Studio interface. The section in the top center of the screenshot 
        is the list of fields in the table. I&#39;ve created an extremely simple table here 
        with first and last names of contacts in a basic contact database. There are 
        three columns for each field; the field&#39;s name (column name), the data type and 
        a checkbox indicating if the field can accept NULL values. SQL Server has a good
        <a href="http://msdn.microsoft.com/en-us/library/ms187594(SQL.105).aspx" 
            target="_blank" title="Learn more about SQL Server data types on MSDN.">
        selection of data types</a> that you can choose from to accomodate different 
        entries.</p>
    <p>
        The Column Properties section under the field list enables you to change 
        settings for a specific field including the data type and size and whether the 
        field can be indexed. The properties that are available depend on the data type 
        of the field.&nbsp; On the right are the properties that apply to the entire 
        table. You might not need to adjust many of these properties but, again, it&#39;s a 
        good idea to get a basic familiarity with them.</p>
    <p>
        Once you&#39;re finished designing a table, all you have to do is select the Save 
        option from the File menu or click the Save icon on the toolbar. The program 
        will ask you for a table name and will then create the table.</p>
    <p>
        In future chapters, I will talk about ways of writing to and from the tables. 
        The next chapter will look at the use of scripts to create a database and its 
        objects.</p>
        <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
</asp:Content>

