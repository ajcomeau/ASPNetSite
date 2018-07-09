<%@ Page Title="Welcome to AndrewComeau.com!" MetaDescription="A reference site for professional and aspiring computer programmers. Features professional articles and tutorials on programming and software development." MetaKeywords="programming, software, development, code, downloads, ASP.NET, Ocala, Florida, Comeau, C#, VB.NET, Visual Studio, SQL, database, consulting" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ComeauWebsite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        For more articles, use the <a href="Search.aspx">Article Search</a> page where 
        you can search for site content by title, keyword or publish date.</p>
    <hr />

    <h3>
        WELCOME to AndrewComeau.com!&nbsp; </h3>
<p>
        This is a site dedicated to the sharing of 
        programming knowledge with those looking for solutions or interested in learning 
        more about programming technologies and the software development field.</p>
    <p>
        My name is Andrew Comeau and I have worked as a professional programmer for 
        several years.&nbsp; I&#39;ve been part of a formal software development team in a large 
        company and I&#39;ve been the rogue developer unofficially cranking out apps as needed.&nbsp; For over ten years, I&#39;ve also been the guy 
        programming on his own time and writing articles to share what he&#39;s learned with 
        others.&nbsp; Along the way, I&#39;ve gained some valuable insights into the 
        software development field and a lot of experience in different technologies.&nbsp; 
        I&#39;ve started this site to share this knowledge.</p>
        <div class="fltleft">
        <a target="_blank" href="http://www.flickr.com/photos/23912576@N05/">
        <img alt="Photo courtesy of laverrue (Flickr.com)" 
                src="Graphics/Content/016-GO.jpg" width="200" border="0" 
                title="Photo courtesy of laverrue (Flickr.com)" />
        </div>

        </a>This site will begin by focusing on my personal specialties, .NET programming 
        and Microsoft SQL Server, but I plan to make it a 
        diverse place featuring professional, quality articles where people can come to 
        learn about a variety of technologies and subjects.&nbsp; When possible, these&nbsp; 
        articles and the site itself will include demonstrations of the concepts and 
        code involved.&nbsp; 
    <br />
    <p>
        While AndrewComeau.com will feature ads, 
        it will <strong>not</strong> be one of those sites where you have to weed 
        through the nonsense to get to the information.&nbsp; AndrewComeau.com is all about 
        <strong><em>content</em></strong>.</p>
    <p>
        Your feedback is important to me.&nbsp; If you have any problems viewing this 
        site or questions about anything you see here, please contact me at
        <a href="mailto:sitemaster@drewslair.com">sitemaster@drewslair.com</a>.&nbsp; 
        
        </p>
    <hr />
    <h4>
        Reader requests ...</h4>
    <p>
        If there&#39;s a programming subject that you&#39;ve been wanting to know more about, 
        let me know.&nbsp; I&#39;m glad to answer questions as I can by e-mail and you might 
        inspire the next article here on AndrewComeau.com. You can send your questions 
        and comments to <a href="mailto:sitemaster@drewslair.com?subject=AndrewComeau.com Questions">
        sitemaster@drewslair.com</a>. </p>
    <p>
        Meanwhile, keep checking back because there&#39;s more on the way!</p>
    <p>
        &nbsp;</p>
</asp:Content>




