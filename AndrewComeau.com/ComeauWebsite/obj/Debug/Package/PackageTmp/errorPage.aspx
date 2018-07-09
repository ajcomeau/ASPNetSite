<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="errorPage.aspx.cs" Inherits="ComeauWebsite.errorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="REFRESH" content="10; URL=http://www.andrewcomeau.com" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    	<div id="container">
		<div id="header">
			<h1>AndrewComeau.com</h1>
            
			<p class="description">... because knowledge is meant to be shared.</p>
            <asp:Literal ID="QuoteBox" runat="server"></asp:Literal>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" IncludeStyleBlock="false">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Default.aspx" 
                        ToolTip="Return to Home Page"></asp:MenuItem>
                    <asp:MenuItem Text="About" Value="About" NavigateUrl="~/About.aspx" 
                        ToolTip="About this Site"></asp:MenuItem>
                    <asp:MenuItem Text="Article Search" Value="Article Search" 
                        NavigateUrl="~/Search.aspx" ToolTip="Search articles on AndrewComeau.com."></asp:MenuItem>
                </Items>
            </asp:Menu>
		</div>
		<div id="wrapper">
			<div id="content">


            <br />
                <h4>


                    That didn&#39;t quite work 
                    quite like we expected ...</h4>
                There was an error while processing your request on AndrewComeau.com.&nbsp; It&#39;s 
                possible that the page wasn&#39;t available or something else went wrong.&nbsp; 
                Whatever the error, it&#39;s been logged and we will address it as soon as possible.<br />
                <br />
                Meanwhile, you can use the link below to search for more articles on the site or 
                wait a few moments and you will be directed to the <a href="Default.aspx">Home 
                Page</a>.<p align="center">&nbsp;</p>
                <p align="center"><a href="http://www.andrewcomeau.com/Search.aspx">See More Articles on AndrewComeau.com ...</a></p>
			</div>
		</div>
		<div id="moreinfo">
			<h2>&nbsp;</h2>

            <br />
		</div>
		<div id="extra">
			

            <div class="itemwrap">
                <div class="contentcenter">
                
                Also Available on Amazon.com!<br>
                <a target="blank" href="http://www.amazon.com/Microsoft-Access-for-Beginners-ebook/dp/B0061RK6VO">
                <img border="0" src= "http://www.drewslair.com/images/books/mab.jpg" width="150" /></a><br />
                    <a href="http://www.amazon.com/gp/product/B0061RK6VO/ref=as_li_ss_tl?ie=UTF8&amp;tag=drewslaircom-20&amp;linkCode=as2&amp;camp=1789&amp;creative=390957&amp;creativeASIN=B0061RK6VO">
                    Microsoft Access for Beginners</a><br />
                    Kindle Edition<br />
                    Andrew Comeau</div>
            </div>
 
             <div class="itemwrap">
                <div class="contentcenter">
                <br />
 	                 <img src="http://www.drewslair.com/images/MCP(rgb).jpg" 
                        alt="Microsoft Certified Professional" title="Microsoft Certified Professional" 
	                 border="0" /> 
                </div>
             </div>

            <div class="itemwrap">
                <div class="contentcenter">
                <br />
	                 <a target="_blank" href="http://www.linkedin.com/in/andrewcomeau">
	                 <img src="http://www.linkedin.com/img/webpromo/btn_viewmy_160x33.gif" alt="View Andrew Comeau's profile on LinkedIn" title="Visit Andrew Comeau's LinkedIn profile." border="0" /></a>
                    <br />
                    <br />
                </div>
            </div>

		</div>
		<div id="footer">
			<ul class="style1">
				<li><a href="http://www.andrewcomeau.com">Home</a></li>
				<li><a href="http://www.andrewcomeau.com/About.aspx">About Us</a></li>
				<li><a href="http://www.andrewcomeau.com/privacy.aspx">Privacy Policy</a></li>
				<li><a href="http://www.andrewcomeau.com/Search.aspx">Article Search</a></li>
			</ul>
			<p class="style1">© 2012, Andrew Comeau, except where otherwise noted. 
                AndrewComeau.com content should not be republished without written permission 
                from the author. Read our <a href="http://www.andrewcomeau.com/privacy.aspx">privacy policy.</a>
                <br />
                More questions? Contact us 
                at <a href="mailto:sitemaster@drewslair.com">this address</a>.
                <br />
                <br />
                Microsoft is a registered trademark of Microsoft Corporation in the United 
                States and other countries.</p>
		</div>
	</div>

    </div>
    </form>
</body>
</html>
