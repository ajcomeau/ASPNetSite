<%@ Page Title="Microsoft SQL Server for Beginners, Part I: From Desktop to Network - AndrewComeau.com" Language="C#" MasterPageFile="~/Site.Master" 
 MetaDescription="A comparison between desktop and network database systems and reasons for choosing one over the other."
 MetaKeywords="Microsoft, Access, SQL, SQL Sever, network, desktop, enterprise, information technology, I.T., database, DBMS"
AutoEventWireup="true" CodeBehind="201208151223.aspx.cs" Inherits="ComeauWebsite.Articles._201208151223" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span class="articletitle">Microsoft
        SQL Server for Beginners</span><br />
        <span class="articlesub">Part I: From Desktop to Network</span></p>
    <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
    <p>
        In an 
        <a href="http://www.drewslair.com/desk/access/beginners/intro.shtml" 
            target="_blank" 
            title="&quot;Microsoft Access for Beginners&quot; on Drewslair.com">earlier series of articles</a>, I wrote about getting started with Microsoft 
        Access, which is one of the foremost desktop database packages available and an 
        excellent tool for small to mid-size database projects. While it was not the 
        first database software that I used, it was the one that took me from novice to 
        professional status. Once I reached that level, however, I had to 
        start learning more advanced tools in order to advance in my career and 
        take on new projects. One important set of tools was Microsoft SQL Server, which 
        remains one of the most popular network database systems on the market.</p>
    <p>
        While the transition was a little intimidating at first, it wasn&#39;t that 
        difficult in the long-run, especially since I was able to transfer much of the 
        database knowledge that I had gained with Access. Like the desktop database, SQL 
        Server is a relational database system which uses tables, relationships and 
        queries to store information and make it available for retrieval and analysis. 
        Unlike Access, SQL Server puts less focus on its own self-contained interface 
        and more emphasis on making the data available over a network to any application 
        that is capable of using the information.
    </p>
    <p>
        If you go to <a href="http://www.microsoft.com/sqlserver/en/us/default.aspx" 
            target="_blank">the SQL Server home page</a> and look for an actual definition of 
        SQL Server, you&#39;ll encounter a lot of explanations that are impressive to 
        corporate I.T. managers and marketing professionals but don&#39;t really serve the 
        average person who is trying to learn how to use the product. If you&#39;ve never 
        used SQL Server before but have a basic idea of what a database is and perhaps 
        some experience with desktop databases, the best way to give you a beginning 
        perspective on SQL Server might be to compare a few of its features to those of Microsoft 
        Access:</p>
    <p>
        <table cellpadding="4" class="style4" align="center">
            <tr>
                <td class="style6">
                    Microsoft Access</td>
                <td class="style5">
                    SQL Server</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7" valign="top">
                    An <a target="_blank" href="http://www.amazon.com/gp/product/B0039L2XD4/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0039L2XD4&linkCode=as2&tag=drewslaircom-20">Access 2010</a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B0039L2XD4" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
                    database can store up to 2 gigabytes of data in one database 
                    file. While larger databases can be created by creating links between files, 
                    these are absolute links to specific PC or network file locations and must be 
                    manually maintained. </td>
                <td valign="top">
                    A single SQL Server 2012 database can store up to 524,272 terabytes of 
                    information (over 268 million times the Access 2010 limit). Up to 50 instances 
                    of SQL Server can be run on a single network server and each instance can hold 
                    32,767 databases.&nbsp; Data can be easily queried between databases without any 
                    attention to where the data is physically stored. </td>
            </tr>
            <tr>
                <td class="style7" valign="top">
                    An Access database can have up to 255 concurrent users although performance 
                    starts to degrade long before that. That number also depends on the database 
                    being split with separate interface or front-end files which are then linked to 
                    a common back-end file which holds the actual data.</td>
                <td valign="top">
                    SQL Server 2012 has a maximum of 32,767 user connections.</td>
            </tr>
            <tr>
                <td class="style7" valign="top">
                    Access 2010&#39;s only way of preventing unauthorized users from accessing the data 
                    is a database password and individual file encryption. Once that password is 
                    obtained, all objects within the database are available to all users.</td>
                <td valign="top">
                    SQL Server offers Integrated Windows security in addition to its own system of 
                    logins and passwords. Users can be granted and denied access to specific objects 
                    based on their Windows user accounts and group memberships.</td>
            </tr>
            <tr>
                <td class="style7" valign="top">
                    Access uses standard SQL (Structured Query Language) for querying the database 
                    tables.&nbsp; These queries permit one operation (SELECT, UPDATE, INSERT, etc..) 
                    per query.&nbsp;Visual Basic for Applications (VBA) or Access macros can be 
                    used to carry out multiple operations although this requires the application to 
                    be run from a trusted location on the machine due to the possibility of 
                    malicious code.</td>
                <td valign="top">
                    SQL Server uses T-SQL (Transact-SQL) and compiled stored procedures which permit 
                    complex data manipulation and multiple operations directly on the server. These 
                    procedures 
                    can be quickly modified and re-deployed. This reduces 
                    the amount of data transfer between the server and the front-end application. 
                    This in turn increases the efficiency of the operations. </td>
            </tr>
        </table>
&nbsp;</p>
    <p>
        For more specifications see the following links:</p>
    <p>
        <a href="http://office.microsoft.com/en-us/access-help/access-2010-specifications-HA010341462.aspx" 
            target="_blank">Access 2010 Specifications</a> /
        <a href="http://office.microsoft.com/en-us/access-help/introduction-to-access-2010-security-HA010341741.aspx#_Toc265079111" 
            target="_blank">Introduction to Access 2010 Security</a></p>
    <p>
        <a href="http://msdn.microsoft.com/en-us/library/ms143287" target="_blank">
        Product Specifications for SQL Server 2012</a></p>
    <p>
        If you are interested in 
        <a href="../Indexes/getting-started-software-development.aspx" 
            title="Check out &quot;Getting Started in Software Development&quot; another article series here on AndrewComeau.com.">pursuing an I.T. career</a>, you can find a final, 
        practical reason to develop your SQL Server skills by going to a site like 
        CareerBuilder.com or Monster.com and doing some comparative searches for 
        Microsoft Access and SQL Server. Notice the number of positions for each of 
        these technologies, the prominence with which they are mentioned in the 
        individual listings and the relative pay. That should give you a good idea of 
        which is the more valuable skill. Having worked with both technologies for 
        years, I can say that if a company is going to hire a new person, it&#39;s probably 
        going to be someone with the SQL Server experience and perspective while 
        Microsoft Access projects are just as likely to be handed to an existing 
        employee.</p>
    <p>
        None of this is to say that desktop databases like Microsoft Access aren&#39;t 
        useful. As I said, Access is great for small department-level projects and it&#39;s 
        a wonderful training ground for database and basic programming skills. It has 
        its place in the I.T. world. It also has some very passionate defenders from 
        whom I would prefer not to get hate mail. In the end, the choice comes down to 
        using the right tool for the right job.
    </p>
    <p>
        One of the great things about SQL Server is that even though it&#39;s a network 
        database, you don&#39;t need a nework in order to run it in your machine and study 
        it in-depth. There are multiple editions of SQL Server including
        <a href="http://www.microsoft.com/sqlserver/en/us/editions/2012-editions/express.aspx" 
            target="_blank">SQL Server Express</a> which can be installed on your PC and 
        accessed either through its own management tools or through another development 
        package like Microsoft Visual Studio which includes the Express edition as part 
        of its own installation. In the following chapters, I will guide you through 
        downloading the appropriate packages, installing the software and getting 
        familiar with some of its basic functions.</p>
    <p>
        For More Information:</p>
    <p>
        <a href="http://www.youtube.com/playlist?list=PLE0C845D72DD579C4" 
            target="_blank" 
            title="Microsoft SQL Server 2012 Tutorials for Administrators on YouTube">
        Microsoft SQL Server 2012 Tutorials for Administrators</a> - A series of free 
        video tutorials from Video Tutorial Junk Yard</p>
        <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
</asp:Content>

