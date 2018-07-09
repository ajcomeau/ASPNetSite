<%@ Page Title="Microsoft SQL Server for Beginners, Part II: Installing SQL Server Express - AndrewComeau.com" Language="C#" MasterPageFile="~/Site.Master" 
 MetaDescription="Installing Microsoft SQL Server. Guidance for the beginning programmer on selecting and installing the right edition of the software."
 MetaKeywords="Microsoft, SQL, SQL Sever, network, desktop, enterprise, information technology, I.T., database, DBMS, installation, download"
AutoEventWireup="true" CodeBehind="201208201834.aspx.cs" Inherits="ComeauWebsite.Articles._201208201834" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 820px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span class="articletitle">Microsoft SQL Server for Beginners</span><br />
        <span class="articlesub">Part II: Installing SQL Server Express</span></p>
    <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
    <p>
        Just like with any software, SQL Server uses a standard installation program to 
        install its components on your system. Depending on the edition that you&#39;re 
        using, you will be installing it from media that you purchased or from the 
        <a href="http://www.microsoft.com/en-us/download/details.aspx?id=29062" 
            target="_blank" 
            title="Download page for Microsoft SQL Server 2012 Express">free 
        install packages</a> that you can download from Microsoft&#39;s website. Unlike other 
        installs, the SQL Server installation can be a long process as there are a number of 
        components, requirements and options to consider, many of which I&#39;ll be 
        detailing in this article.</p>
    <h5>
        Which version and which edition?</h5>
    <p>
        As of this writing, the latest version of SQL Server is SQL Server 2012. 
        The previous versions, SQL Server 2008 and 2005, are 
        <a href="http://www.microsoft.com/sqlserver/en/us/editions/previous-versions.aspx" 
            target="_blank" 
            title="Find previous versions of Microsoft SQL Server on Microsoft.com.">still available for 
        download</a> on Microsoft.com. The 2008 version is also the last version to support 
        Windows XP and it&#39;s still being shipped as part of the Visual Studio 2010 
        product.</p>
    <p>
        SQL Sever 2012 comes in a number of editions for different uses. The Standard 
        and Enterprise editions cost thousands of dollars and are intended for full 
        production use on a dedicated server which is why I&#39;m not using either of them 
        for this demonstration. There are two other editions that would be useful to someone 
        just starting out with the product; the Developer and the Express editions.
    </p>
    <p>
        The Developer edition has all the features of the full Enterprise edition except 
        that it can only be used for testing and not on an actual production sever. It&#39;s 
        available for a 
        <a href="http://www.amazon.com/gp/product/B007RFXQAM/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B007RFXQAM&linkCode=as2&tag=drewslaircom-20" 
            target="_blank" 
            title="Find the SQL Sever 2012 Developer Edition on Amazon.com.">very reasonable price online</a><img src="http://www.assoc-amazon.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B007RFXQAM" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> and is appropriate 
        for developers testing large, high-demand applications.
    </p>
    <p>
        The Express edition has a few limitations on it such as a maximum database size 
        of 10 GB and no support for multiple processors but for the average home user 
        trying to learn about SQL Server, it&#39;s a free download that will handle almost 
        any database a beginner might construct. Because of this, I&#39;ve chosen to base 
        this article around SQL Server 2012 Express. If you&#39;re using another version or 
        edition, you&#39;ll still find much of this information helpful.</p>
    <h5>
        Requirements</h5>
    <p>
        For home machines, SQL Server 2012 Express requires Windows Vista Service Pack 2 
        or Windows 7, Service Pack 1 to be installed.
        32- and 64-bit systems are supported with a 2 Ghz processor, 2 GB of RAM and 2.2 
        GB of hard disk space recommended. See the 
        <a href="http://www.microsoft.com/en-us/download/details.aspx?id=29062" 
            target="_blank" title="Download page for Microsoft SQL Server 2012 Express">product download page</a> for full 
        requirements.</p>
    <p>
        For my installation, I used a Microsoft 
        <a href="http://www.drewslair.com/desk/software/virtualpc.shtml" 
            target="_blank" 
            title="Find out more about Microsoft Virtual PC on Drewslair.com.">Virtual PC</a> machine with 2 GB of RAM 
        allocated to it and Windows 7 (32-bit) installed. The host machine&#39;s processor is 2.5 
        Ghz. I found out about the service pack requirement the hard way and that added 
        a lot of time to the installation. The virtual machine&#39;s original disk size was 
        16 GB but once the service pack, necessary updates and SQL Server were 
        installed, I only had a few gigabytes left which was barely enough for a minimal 
        installation of Visual Studio 2010 with one langauge. I found a way to 
        <a href="http://vmtoolkit.com/files/folders/converters/entry87.aspx" 
            target="_blank" title="Link to VMToolKit's VHDResizer">expand the virtual machine&#39;s disk</a> to a 32 GB limit to give myself more room.</p>
    <p>
        Even with the service pack pre-installed, depending on the options and the 
        hardware, 
        my installation took just over an hour to complete although that might have had 
        somethign to do with the virtual environment. Still, set aside some time for 
        this one.</p>
    <h5>
        Selecting and Downloading a Package</h5>
    <p>
        Even with the version and the edition decided, there are still more options. 
        There are versions of SQL 2012 Express for both 32- and 64-bit systems so you 
        will need to know what type of system you&#39;re running before installing it. You 
        should be able to see this in your computer&#39;s System Properties. </p>
    <p>
        The <a href="http://www.microsoft.com/en-us/download/details.aspx?id=29062" 
            title="Download page for Microsoft SQL Server 2012 Express">download page</a> also offers different packages based on the components that 
        need to be installed. If you have the resources, I recommend Express with 
        Advanced Services which is the full package with the database engine itself and 
        all the management, reporting and analysis tools. This package comes in both 32 
        and 64 bit versions so, again, you&#39;ll need to be sure of what kind of system 
        you&#39;re running. The SQLEXPRADV_x64_ENU.exe (64-bit) and SQLEXPRADV_x86_ENU.exe 
        (32-bit)packages on the download page are 1.3 GB each and contain the complete 
        set of tools. This is the package that I use in this demonstration.</p>
    
        <div class="fltcenter"><img src="../Graphics/Content/027-download.jpg" width="400" />
        <p>Microsoft's download page for SQL Server 2012 Express offers a number of download options depending on the components you need.</p>
        </div>
    <p>
        The next best package, for my recommendation, is Express with Tools which 
        contains the database engine and SQL Server Management Studio Express (often 
        referred to as SSMS). This is a graphic interface that you will need in order to 
        manage databases and issue queries to those databases. While it&#39;s possible to do 
        this through a command prompt, you&#39;ll find life much easier and faster if you 
        have the management studio and I recommend this package at a minimum.&nbsp; The 
        SQLEXPRWT_x64_ENU.exe (64-bit) and SQLEXPRWT_x86_ENU.exe (32-bit) packages on 
        the download page will get you setup with this configuration and are 706 MB and 
        669 MB respectively.</p>
    <p>
        A final note on installation packages. Although SQL Server 2008 Express is 
        included as part of the Visual Studio 2010 install, I actually recommend 
        installing SQL Server <em>first</em> from one of the packages on the Microsoft site, 
        getting it configured appropriately and then installing Visual Studio with the 
        SQL Server option <em>unchecked</em> so that Visual Studio does not try to 
        install it. I&#39;ve had multiple bugs on a couple different systems when trying to 
        add components to a SQL Server installation performed by Visual Studio, to the 
        point where I had to remove both packages and start again. At this point I like 
        to let each program take care of its own installation.</p>
    <h5>
        Installation</h5>
    <table class="style2">
        <tr>
            <td valign="top" width="50%">
                &nbsp;</td>
            <td width="50%" style="text-align: center">
                (Click on any image for full-size screenshot.)</td>
        </tr>
        <tr>
            <td valign="top" width="50%">
                The installation packages are EXE files which you can run by double-clicking on 
                the file or right-clicking on the file and selecting Open from the context menu.
                <br />
                <br />
                The installation process may seem to pause or be inactive at times, this is 
                because there are a lot of background inspections happening such as a 
                verification that you have the correct operating system and updates installed. 
                After a few moments, you should see the opening screen on the right where you 
                have the choice of installing a new instance, adding features or upgrading a 
                previous version.</td>
            <td width="50%">
                <a href="../Graphics/Content/SQLInstPics/screen001.jpg" target="_blank">
                <img alt="" src="../Graphics/Content/SQLInstPics/screen001s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                Read over the license terms. After you indicate that you accept them, you can 
                click Next to proceed.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen002.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen002s.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                The setup files themselves take a few moments to install. During this time, the 
                installation is searching for updates to the installation.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen003.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen003s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                You are able to choose which features are installed from the package. I 
                recommend selecting all features, including 
                <a href="http://msdn.microsoft.com/en-us/library/hh510202.aspx" target="_blank" 
                    title="Find out more about SQL Server 2012 Express LocalDB on Microsoft.com.">LocalDB</a> which is 
                new to SQL Server 2012 and will be featured in an upcoming article.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen004.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen004s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td class="style4" rowspan="2">
                The installation will perform a few more checks and alert you if it cannot 
                continue because of missing updates or other issues.<br />
                <br />
                If all checks pass, the installation moves on to the next step which is to name 
                the instance and specify its location. SQL Server Express can use either a single, 
                default instance called SQLExpress or multiple, named instances on the same 
                machine. This affects
                <a href="http://msdn.microsoft.com/en-us/library/ms165614(v=SQL.90).aspx" 
                    target="_blank">how the instances are referenced</a> from outside SQL 
                Server. In SQL Server Express, 
                all it really means is that a default instance will be named SQLExpress. In the 
                screenshot to the right, I decided to do a named instance called SQL2012.
                <br />
                <br />
                I also decided to put it on a second drive since I was running really low on the 
                virtual machine&#39;s C: 
                drive space. The installation still created a folder under the <a>Program</a> 
                Files directory with over 600 MB of application files but the other 1.24 GB of 
                files specific to this instance went on the E: drive instead.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen005.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen005s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen006.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen006s.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td class="style4" rowspan="2">
                SQL Server runs a number of Windows services&nbsp; that can be set to start 
                automatically when Windows loads or to be started manually. The database engine 
                itself is one of these services. Each service 
                <a href="http://msdn.microsoft.com/en-US/library/ms143170(v=SQL.90).aspx" 
                    target="_blank" title="More about SQL Server service acounts on Microsoft.com">uses a Windows account</a> to access 
                the resources it needs. When installing SQL Server Express on a home system for training 
                purposes like this, I&#39;ve typically accepted the defaults presented by the 
                installation program. As you get more involved with SQL Server, however, this 
                becomes a more important part of the installation.&nbsp; You can read more about 
                SQL Server service accounts on
                <a href="http://technet.microsoft.com/en-us/library/dd560633(v=ws.10).aspx" 
                    target="_blank">Microsoft TechNet</a>.<br />
                <br />
                The Collation tab affects the way in which the database engine puts information 
                in order and can safely be left at the default.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen007a.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen007sa.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen007b.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen007sb.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td class="style4" rowspan="4">
                One of SQL Server&#39;s strengths is its ability to integrate its security with 
                Windows so that Windows accounts can be used to authenticate users on SQL Server 
                databases. The Server Configuration tab under Database Engine Configuration 
                enables you to choose between straight Windows authentication and mixed mode 
                which allows for SQL Server specific logins and passwords. I decided on mixed 
                mode here and the installation then asks for a password for the server 
                administrator (sa) account. Be sure to use a strong password. Additional users 
                can also be added as administrators.<br />
                <br />
                The Data Directories tab enables you to specify directories for different types 
                of data including log files and backups.&nbsp;It&#39;s good to look these over but 
                you&#39;ll probably want to accept the defaults.<br />
                <br />
                The User Instances tab allows users with reduced privileges to run separate 
                instances of SQL Server Express with limited permissions. These instances are 
                generated automatically as needed. It can be left on the default setting.<br />
                <br />
                SQL Server 2012 uses the
                <a href="http://msdn.microsoft.com/en-us/library/gg471497" target="_blank">
                FILESTREAM</a> feature to store certain data within the file system rather than 
                directly in the database, providing for more efficient storage and searches. This applies to binary data such as documents and 
                images that would normally take up large amounts of space in the database. If 
                you will be storing large amounts of unstructured data within the database, it 
                might be a good idea to activate this feature through the FILESTREAM tab.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen008a.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen008sa.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen008b.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen008sb.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen008c.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen008sc.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen008d.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen008sd.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                If the install package you selected includes SQL 
                <a href="http://msdn.microsoft.com/en-us/library/ms159106.aspx" target="_blank" 
                    title="Read more about SQL Server Reporting Services on MSDN Books Online.">Reporting Services</a>, the install 
                will give you the option of installing and configuring Reporting Services with 
                the default settings or simply installing the files and letting you do the 
                setup. Unless you&#39;re familiar with Reporting Services, it&#39;s probably a good idea 
                to select Install and Configure as I did.&nbsp; For more information,
                <a href="http://msdn.microsoft.com/en-us/library/ms143711.aspx#bkmk_whentoinstalldefaultconfig" 
                    target="_blank">see the MSDN article</a>.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen009.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen009s.jpg" width="300px" /></a></td>
        </tr>
        <tr>
            <td class="style4" rowspan="2">
                After the Error Reporting screen, which asks your permission to send installation 
                error reports to Microsoft, the install should finally begin. Again, depending 
                on the package that you&#39;re installing, this might take awhile. Once it&#39;s 
                finished, you&#39;ll see the completion screen which lists the components and 
                indicates if they were successfully installed.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen011.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen011s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen012.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen012s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                The final screen of the installation presents options for additional 
                documentation and support. I particularly recommend the first option; 
                <a href="http://msdn.microsoft.com/en-us/library/ms130214" target="_blank" 
                    title="Books Online for SQL Server 2012 on MSDN">Books 
                Online</a> which, for past versions, is some of the best vendor produced 
                documentation that I&#39;ve seen. The screen also includes links to other web 
                resources that you can use as you learn more about SQL Server.</td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen013.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen013s.jpg" width="300" /></a></td>
        </tr>
        <tr>
            <td class="style4">
                After you close the installation program, check your program menu and verify 
                that there is a SQL Server 2012 group with items for the installed components. 
                One of them should be SQL Server Management Studio which will be the subject of 
                another chapter. The advanced tools installation also includes a minimal 
                installation of Visual Studio 2010 but if you want full programming capability, 
                I recommend following up with an installation of either the express edition or 
                professional edition of <a href="http://www.microsoft.com/visualstudio/en-us" 
                    target="_blank" title="Microsoft Visual Studio home page on Microsoft.com.">Visual Studio</a>. If you do this, be sure to unselect 
                the option to install SQL Server Express. </td>
            <td>
                <a href="../Graphics/Content/SQLInstPics/screen014.jpg" target="_blank">
                <img src="../Graphics/Content/SQLInstPics/screen014.jpg" width="300" /></a></td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <br />
    Even though there are a lot of steps involved and a few things to know, it&#39;s 
    still a relatively easy installation and a lot is done for you by the install 
    program. If you would like more information on installing SQL Server, you can 
    also check out
    <a href="http://www.youtube.com/watch?v=I4DbljJf_j0&amp;feature=g-hist" 
        target="_blank" title="Installing SQL Server 2012 by Video Tutorial Junk Yard">
    this video tutorial</a> which will step you through the process.<br />
        <p>
        <a href="../Indexes/microsoft-sql-server-beginners.aspx">Series Index</a></p>
</asp:Content>

