<%@ Page Title="Comeau Software Solutions - Home Page" 
MetaDescription="Professional site for Andrew Comeau, an independent software programmer and consultant based in Ocala, Florida. Site features professional articles and tutorials on programming and software development." 
MetaKeywords="programming, software, development, code, downloads, ASP.NET, Ocala, Florida, Comeau, C#, VB.NET, Visual Studio, SQL, database, consulting" 
Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ComeauWebsite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style2
        {
            font-style: italic;
            font-size: medium;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class = "bookdesc-noborder">
    <p class="articletitle">Add some new career skills to your portfolio!</p>
    <p>
        <a href="http://www.amazon.com/gp/product/B00FNAMMA8/ref=as_li_ss_tl?ie=UTF8&amp;amp;camp=1789&amp;amp;creative=390957&amp;amp;creativeASIN=B00FNAMMA8&amp;amp;linkCode=as2&amp;amp;tag=drewslaircom-20" 
            target="_blank">
    <img style="float: left;" border="0" src="/Graphics/Books/firstguidecover.jpg" 
          align="left" width="150px"></a><strong><span class="articlesub">Your First Guide to Database Design</span></strong>
    <br /><span class="style2">Andrew Comeau</span>
    </p>
        <a 
        href="http://www.amazon.com/gp/product/B00FNAMMA8/ref=as_li_ss_tl?ie=UTF8&amp;camp=1789&amp;creative=390957&amp;creativeASIN=B00FNAMMA8&amp;linkCode=as2&amp;tag=drewslaircom-20" 
        target="_blank">Your First Guide to Database Design</a> 
    is a clear, easy-to-use guide to relational database design for both beginners 
    and I.T. professionals who need to know how to organize and store 
    <em>any</em> amount of information on <em>any</em> subject. Whether you're using SQL Server, MySQL 
    or another database software, this book will show you how to model the data, create a system of tables and use Structured Query Language (SQL) to read and 
            write to your new database. 
        <br />
        <br />
        <a href="Pages/db-design-guide.aspx">Read more ...</a> or <a href="/pages/firstguide-support.aspx">go to the official support page.</a>
    </div>
    <hr />

    <h3>
        Featured article ....</h3>

    <p class="articletitlecenter">
    <asp:HyperLink ID="ArticleLink" CssClass="articletitlecenter" runat="server">Article Title</asp:HyperLink></p>
    <p class="articlesubcenter">
    <asp:Label ID="ArticleSubTitle" runat="server" Text="Description"></asp:Label>
    </p>
    <p>
    <asp:Label ID="ArticleSummary" runat="server" Text="Summary" Width="100%"></asp:Label>
    </p>

    <p>
        For more articles or if you&#39;re having trouble finding the one you&#39;re looking for 
        on this site, please visit <a href="http://www.drewslair.com">Drewslair.com</a>, 
        the companion blog for ComeauSoftware.com. Many of the articles previously on 
        this site have been moved there in preparation for an upcoming site renovation.</p>

<hr />
    <h3>Come Join the Ocala I.T. Professionals!</h3>
    <p>The Ocala I.T. Professionals is a new I.T. networking group in Ocala, Florida. It's purpose is to provide a forum for people from all areas of I.T. and all levels of experience to come together, discuss the latest technologies and work together on projects and new opportunities.</p>

<div class="fltleft"><a href="http://www.meetup.com/Ocala-I-T-Professionals/" target="_blank"><img src="http://www.drewslair.com/wp-content/uploads/2014/03/meetup.jpg" width="150" /></a></div>
<p>We're currently using Meetup.com to organize the group and enable people to sign up and stay informed on the latest meetings. The meetings are being held every two weeks in various locations and the intention is to alternate between presentations on various technology subjects and casual social gatherings where the members can relax, get to know each other and talk shop over food and drink.</p>

<p>So, if you're in Ocala and have been looking for a group of like-minded I.T. people who will understand you when you talk about the latest programming tools or hardware, come join us!</p>

<p>Find us on Meetup.com ... <a href="http://www.meetup.com/Ocala-I-T-Professionals/" target="_blank">http://www.meetup.com/Ocala-I-T-Professionals/</a></p>

<p>On Twitter ... <a href="https://twitter.com/OcalaITPros" target="_blank">https://twitter.com/OcalaITPros</a></p>

<p>On Facebook ... <a href="https://www.facebook.com/OcalaITPros" target="_blank">https://www.facebook.com/OcalaITPros</a></p>

<p>Also, check out our site! ... <a href="http://www.ocalaitpros.com" target="_blank">http://www.ocalaitpros.com</a></p>
    <hr />

    <h3>About Andrew Comeau and Comeau Software Solutions</h3>

<p>With over 20 years of software and technology experience, I have worked with a wide variety of desktop and online applications and am able to recommend the right solution for your specific needs. 
        I also provide web design services, custom programming and general computer 
        support as needed. In addition to these services, I have published two books;
        <a href="Pages/db-design-guide.aspx">Your First Guide to Database Design</a> and
        <a href="Pages/ms-access-for-beginners.aspx">Microsoft Access for Beginners</a>, 
        along with a variety of instructional articles, some of which which you will 
    find here on the site.</p>
    <p>For more information on specific services provided by Comeau Software Solutions, 
        please visit the <a href="Pages/Services.aspx">Services</a> page. 
</p>

    <p>
        Aside from promoting my professional services,
        ComeauSoftware.com is a site dedicated to the sharing of programming knowledge 
        with those looking for solutions or interested in learning more about 
        programming technologies and the software development field. While featuring 
        <a href="Search.aspx">professional, 
        quality articles</a> on a diverse set of programming technologies, the site 
        also offers content that examines the educational and professional realities of 
        working in the programming field.</p>
    <p>
        If you have any questions or comments cocerning anything you see here, please send them to <a href="mailto:services@ComeauSoftware.com">
        services@ComeauSoftware.comm</a>.&nbsp;</p>


<hr />

    <p>&nbsp;</p>
</asp:Content>




