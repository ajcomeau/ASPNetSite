<%@ Page Title="Microsoft SQL Server for Beginners, Part V: Using SQL Server 2012 LocalDB - AndrewComeau.com" Language="C#" MasterPageFile="~/Site.Master"
 MetaDescription="Using LocalDB, the minimized developer version of SQL Server 2012 Express. Details download, installation, creation of server instances and installation of the AdventureWorks sample database." 
 MetaKeywords="LocalDB, SQL Server 2012, SQL Server Express, developer, beginner, AdventureWorks, database, SSMS, SQL Server Management Studio, Microsoft, tutorial" 
 AutoEventWireup="true" CodeBehind="201209131252.aspx.cs" Inherits="ComeauWebsite.Articles._201209131252" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 416px;
            height: 311px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span class="articletitle">Microsoft SQL Server for Beginners</span><br />
        <span class="articlesub">Part V: Using SQL Server 2012 LocalDB</span></p>
    <p>
        In a <a href="201208201834.aspx" 
            title="Read more about installing SQL Server Express.">previous chapter</a>, 
        I described the installation process for SQL Server 2012 Express which included 
        all the bells and whistles of the advanced services package. While it&#39;s great to 
        use this package if you can so that you have all the tools at your disposal to 
        learn from, some developers might not want such a large installation on a 
        particular machine or the administration that goes with it but might still want 
        the basic database capabilities of SQL Server for testing. For these developers, 
        SQL Server 2012 offers a new feature called
        <a href="http://msdn.microsoft.com/en-us/library/hh510202.aspx" target="_blank" 
            title="Read more about SQL Server 2012 Express LocalDB on Microsoft.com.">
        LocalDB</a>.</p>
    <p>
        LocalDB is a minimized version of SQL Server Express 
        specifically for developers that still offers all the 
        programmability features including T-SQL and the ability to create stored 
        procedures and other objects within an instance of SQL Server. It has a few 
        restrictions that the average beginner probably won&#39;t notice and you can connect 
        to it through SQL Server Management Studio to create and manage databases. You 
        can even install the <a href="201209041141.aspx" 
            title="Learn how to install the AdventureWorks sample database.">
        AdventureWorks sample database</a> in an instance of LocalDB to work with.</p>
    <h5>
        Downloading and Installing LocalDB</h5>
    <p>
        While LocalDB is included as part of the advanced services package, it also has 
        its own installation package if you want to install it separately. I also 
        recommend downloading SQL Server Management Studio which also has its own 
        installation package. To download either or both of these packages, simply visit 
        the <a href="http://www.microsoft.com/en-us/download/details.aspx?id=29062" 
            target="_blank" 
            title="Download SQL Server 2012 Express components from Microsoft.com.">Microsoft download page</a> and select the 
        <em>SqlLocalDB.MSI</em> install and the 
        <em>SQLManagementStudio_ENU.exe</em> packages that match your system type. There are 
        packages for both 32-bit and 64-bit systems so you will need to download the 
        right ones.</p>
    <p>
        The LocalDB installation should be done first by double-clicking on the 
        SQLLocalDB.MSI file. It&#39;s very quick but the program&#39;s presence on your machine 
        will be stripped down; there are no menu options or icons. The program is run 
        from a command prompt which I&#39;ll go into more detail about later.</p>
    <p>
        SQL Server Management Studio takes quite a bit longer to install and the 
        installation program presents the program as the addition of features 
        onto a current installation.&nbsp;It might also require a reboot to complete the 
        installation.</p>
    <div class="fltcenter">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB014.jpg" width="400px" />
        <p>SQL Server Management Studio can be installed separately from its own package.<br />
            Click to view full-size image.</p></div>
    <h5>
        Using LocalDB</h5>
    <p>
        LocalDB has a default SQL Server instance named v11.0 and can also support named 
        instances. These instances are stored deep within a the Users folder of the 
        administrative user who owns the instance. The path will look something like 
        this:</p>
    <p>
        C:\Users\<em>&lt;username&gt;</em>\AppData\Local\Microsoft\Microsoft SQL Server Local 
        DB\Instances</p>
    <p>
        The default instance might not be created as part of the main installation which 
        means that you&#39;ll need to manually start it within the SQLLocalDB utility. The 
        main LocalDB utility is an executable file named
        <a href="http://msdn.microsoft.com/en-us/library/hh212961.aspx" 
            title="Read more about the SQLLocalDB utility on Microsoft.com.">
        SQLLocalDB.exe</a>. You&#39;ll probably find it at:</p>
    <p>
        C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SQLLocalDB.exe</p>
    <p>
        In order to use the program, you will need to run the EXE file with the 
        appropriate options from within a command window. The easiest way is to 
        navigate to the folder within Windows and then hold down the SHIFT key while 
        right-clicking within the window. Select the &quot;Open command window here&quot; 
        option from the context menu and a command window will appear with that 
        directory already selected.</p>
    <div class="fltcenter">
        <img alt="" src="../Graphics/Content/MSSBImages/MSSB015.jpg" width="550px" /><p>&nbsp;</p></div>
    <p>
        For a full list of the commands that you can use in SQLLocalDB,
        <a href="http://msdn.microsoft.com/en-us/library/hh212961.aspx" target="_blank" 
            title="Read more about SQLLocalDB on Microsoft.com.">click here</a>. The 
        commands above will get you started. The first start command will start the 
        default instance, creating it if necessary. For named instances like the one 
        shown in the second and third commands above, it is necessary to explicitly name, 
        create and start the instance. Once you create an instance of SQL Server with 
        the utility, you can browse to the Instances subdirectory under your Windows 
        Users directory and see the files that it has created.</p>
<h5>
        Accessing LocalDB with SQL Server Management Studio</h5>
    <p>
        Just like with SQL Server Express, it&#39;s much easier to work with your databases 
        in a graphical environment. Once you&#39;ve installed both LocalDB and SSMS and 
        ensured there are instances of SQL Server to work with, you can access them 
        through SSMS by correctly setting the Server Name field in the connection box. 
        See the screenshot below for an example. &quot;(localdb)\&quot; followed by the instance 
        name will enable SSMS to connect to the LocalDB instance.</p>
    <div class="fltcenter">
        <img alt="" class="style1" src="../Graphics/Content/MSSBImages/MSSB016.jpg" /><p>&nbsp;</p></div>
        <p>If you have not started the LocalDB instance through the SQLLocalDB utility, then 
            SSMS may take a little longer to connect because it has to start the instance 
            before it can connect.</p>
    <h5>Installing the AdventureWorks Database</h5>
    <p>Installing the AdventureWorks sample database from Microsoft works much the same 
        way in LocalDB as it does in normal SQL Server Express. See
        <a href="201209041141.aspx">my earlier article</a> for the full details on 
        downloading and installing this database. Since you will not have full-text 
        indexing installed as part of LocalDB, you will need to make the changes to the 
        script described in that article. </p>
    <p>The other difference in the installation is when you set the 
        SqlSamplesDatabasePath variable in the script. Normally, this path would go 
        under Program Files to the SQL Server Data directory. Because LocalDB 
        buries this directory a few levels deep under your Users directory, it might be 
        better to set it to another directory that you can find easier such as your 
        Documents directory.</p>
    <h4>For more information:</h4>
    <p><a href="http://msdn.microsoft.com/en-us/library/hh510202.aspx" target="_blank" 
            title="Main MSDN article on SQL Server LocalDB">SQL Server 2012 Express 
        LocalDB</a> - Main MSDN article</p>
    <p><a href="http://msdn.microsoft.com/en-us/library/hh212961.aspx" target="_blank" 
            title="MSDN reference page for SQLLocalDB utility">SQLLocalDB Utility</a> - 
        MSDN reference page</p>
    <p><a href="http://www.sqlcoffee.com/SQLServer2012_0004.htm" target="_blank" 
            title="Additional information on LocalDB from SQL Coffee">What is LocalDB</a> 
        - Additional specifications and installation information from SQL Coffee</p>
    <p>&nbsp;</p>
</asp:Content>

