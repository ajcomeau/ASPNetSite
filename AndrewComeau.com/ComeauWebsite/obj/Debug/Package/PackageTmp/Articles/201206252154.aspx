<%@ Page Title="Getting Started in Software Development: Part Three - AndrewComeau.com" MetaKeywords="programming, Windows, websites, smartphones, Android, training, Comeau, Ocala, Florida, Microsoft, Visual Studio, .NET, C#, VB, Javascript, PHP" MetaDescription="A Quick Look at Programming Technologies. A review of the technology options for new computer programmers." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201206252154.aspx.cs" Inherits="ComeauWebsite.Articles._201206252154" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<p class="articletitle">Getting Started in Software Development<br />
    <span class="articlesub">Part Three: A Quick Look at Programming Technologies</span></p>
    <p>
        See Part <a href="201206190957.aspx">One</a> <a href="201206200922.aspx">
        Two</a> <a href="201206252154.aspx">Three</a>&nbsp;
        <a href="201206281110.aspx">Four</a> 
        <a href="../Indexes/getting-started-software-development.aspx">
        Index</a></p>
    <p>So far, I've given you some general ideas of what it takes to start and 
maintain a career in software development but you're probably still wanting some 
direction as to the actual first steps of learning how to program. In this 
chapter, I'll give you a sampling of the options available. Pay close attention 
to the links sprinkled throughout for additional information.</p>
<p>There are a lot of options out there because there are a lot of different 
computer languages and types of devices to program. The type of device for which 
you're creating an application and the operating system it uses is sometimes 
called the <em>platform</em>. For example, if you're programming Windows applications for 
the PC, then you'd be writing for the Windows platform. The
<a target="_blank" href="http://www.android.com/">Android OS</a> that powers 
smartphones and tablets would be a separate platform and would require different 
programming tools. Some people might get confused by the term platform so it's 
easiest just to say &quot;I write Windows programs.&quot; or &quot;I create websites.&quot;. You'll 
find that one of the challenges of a programming career is communicating ideas 
to non-programmers.</p>
<p>As I mentioned, I've pretty much used the tools that were available and in 
demand. I started with BASIC in college, used Microsoft Access / VBA when I was 
working in an office and moved on to the .NET languages as a professional 
programmer. Along the way, I've learned popular scripting languages like HTML 
and SQL and worked with more obscure languages like
<a target="_blank" href="http://en.wikipedia.org/wiki/ObjectPAL">ObjectPAL</a>. 
Most importantly, I've used the tools that were needed at the time and got the 
job done. Above all, I recommend that you start with a platform that you're 
going to find immediately useful and interesting whether that be smartphone apps 
or website design which can include multiple languages depending on the 
preference of the programmer and what's available on the web server where the 
website will be published. If you're really interested in programming, a short 
exploration of a new language for its own sake can be interesting but, as I've 
said, long-term practice is the key.</p>
<h5>Windows Desktop</h5>
<p>Microsoft is still a huge player in today's market, even if it's having to 
share the field with a few more competitors than it used to. For beginning 
programmers, Microsoft products also offer the most support and documentation 
through <a target="_blank" href="http://msdn.microsoft.com/en-US/">Microsoft's 
own site</a> and third-party sites like this one. While there's more and more 
emphasis on web and smartphone apps, creating standalone programs for Windows is 
still a good way to be introduced to programming and has the advantage that you 
can quickly create your own installable programs without needing access to a web 
server or other equipment.</p>
<p>Microsoft also offers a lot of free programming tools that you can simply 
download and install to get started. Primary among these are the
<a target="_blank" href="http://www.microsoft.com/visualstudio/en-us/products/2010-editions/express">
Visual Studio Express</a> products. Visual Studio is what's called an
<a target="_blank" href="http://en.wikipedia.org/wiki/Integrated_development_environment">
Integrated Development Environment (IDE)</a>, a graphical environment that 
includes all the tools you need to write, test, debug and deploy your own 
programs. The Visual Studio programs cover both Windows and Web programming. 
While the full version costs hundreds of dollars, the Express versions offer 
most of the same functions and are <i>completely free</i> to install and use. In 
addition, there are incredible amounts of reference materials on the web, both 
from Microsoft and elsewhere, that will provide you with any answers you need 
when learning how to use these tools. Often, it comes down to typing a question 
into Google.</p>
<p>For Windows programming with Visual Studio, there are two primary languages 
that you can choose from; Visual Basic and C#.
<a target="_blank" href="http://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-basic-express">
Visual Basic (or VB.NET)</a> is a descendent of the BASIC programming language 
and offers commands that are very similar to English.
<a target="_blank" href="http://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-csharp-express">
C# (pronounced &quot;C Sharp&quot;)</a> is related to the C programming language in 
    which 
Windows was originally written. It can look a little more intimidating and 
has stricter rules about syntax (C# is case-sensitive where VB.NET is not. C# 
code lines usually end with a semi-colon. etc..)&nbsp; The advantage with C# is 
that it resembles other popular languages like Java and PHP so if you learn C#, 
you'll have an easier time learning those languages when the time comes. </p>
<p>Visual Studio languages use Microsoft's
<a target="_blank" href="http://www.microsoft.com/net/">.NET framework</a>, a 
huge library of functions that is designed to standardize and simplify all areas 
of programming. When installing Windows updates, you might have seen the .NET 
framework among the recommended items. Installing the framework makes these 
functions available on your machine so that programs written in a .NET language 
can access them.</p>
<p>As of this writing,
<a target="_blank" href="http://www.microsoft.com/visualstudio/en-us">Visual 
Studio 2010</a> is the latest released version with the 2012 version on its way 
to the market. The 2010 version is the last version to officially run on Windows 
XP. According to the Microsoft website, the 2012 version will require Windows 7.</p>
<h5>Websites and Web Applications</h5>
<p>The Internet has become so pervasive that even if you're programming 
standalone applications, there's a good chance they will access the Internet for 
information at some point.</p>
<p>When I started designing a website back in 2000, I was using Microsoft 
FrontPage which was a lot like Microsoft Word or Publisher. It provided a
<a target="_blank" href="http://en.wikipedia.org/wiki/WYSIWYG">WYSIWYG (What You 
See Is What You Get)</a> environment where I could create the content. The 
program generated the HTML code in the background and sometimes added its own 
proprietary code. Then I just uploaded the files and the web server, a type of 
computer that receives requests for web pages and serves these pages over the 
Internet, would take care of the rest. It was a start but it was only the 
beginning.</p>
<p><a target="_blank" href="http://www.w3schools.com/html/default.asp">HTML 
(HyperText Markup Language)</a> is still the backbone for most of the content 
you see on the Web. At the core, web pages are text files with tags (markups) 
that signal whatever browser you're using to format the text in a certain way. 
Basic HTML is pretty easy to learn and you should learn it if you plan on doing 
any web design, even though there are plenty of programs out there just like 
FrontPage that will write it for you. To be a programmer and truly take 
ownership of your work, you need to know what's going on in the background. I 
don't generally write pages in raw HTML because it would take too long but I am 
able to get in there and edit the HTML if necessary and fix problems that just 
aren't fixable at the WYSIWYG level.</p>
<p><a target="_blank" href="http://www.w3schools.com/css/">CSS (Cascading Style 
Sheets)</a> is another technology you'll need for serious web development. A CSS 
file is a set of formatting instructions that a web page uses to format the 
content. It is used to separate the formatting instructions from the page 
content itself. This enables the web designer to have multiple pages with a 
consistent look and feel while writing the instructions in one file. It also 
removes a lot of coding instructions from the pages themselves so that search 
engines can index them better.</p>
<p>The next level up from HTML are the languages that add dynamic features to a 
website that HTML can't provide. Some examples would be displaying the current 
date when a website is displayed or pulling specific information from a database 
based on the user's identity. The random quotes that you see at the top of the 
pages on this site and the selected books from Amazon.com at the left are 
dynamic features that I programmed specifically for this site using the Visual 
Studio tools that I mentioned earlier. The Article Search page pulls the 
information for the articles from a database that I created for the site. The 
information is pulled using <a target="_blank" href="http://www.asp.net/">
ASP.NET</a> which is a style of programming that combines HTML with VB.NET or C# 
to create dynamic features like those. Visual Studio
<a target="_blank" href="http://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-web-developer-express">
also covers web programming</a> and can create dynamic websites using ASP.NET.</p>
<p>Of course, Microsoft is not the only technology provider out there and there 
are alternatives to both ASP.NET and Visual Studio. For dynamic websites, 
languages like
<a target="_blank" href="http://www.cs.brown.edu/courses/bridge/1998/res/javascript/javascript-tutorial.html">
JavaScript</a> and <a target="_blank" href="http://www.php.net/">PHP</a> are 
also used to add features and are supported in Linux environments where ASP.NET 
usually is not. If you see a web page with a .PHP extension, that's a sign that 
it's using some amount of PHP programming as that extension is generally needed 
for the web server to recognize it and handle the code appropriately. Both of 
these languages have various IDEs available but both can also be programmed though a standard text or HTML editor. They are known as
<a target="_blank" href="http://en.wikipedia.org/wiki/Scripting_language">
scripting languages</a>.</p>
<p>As many different technologies can be used in web design, it's important to 
remember that you don't have to pick all of them up at once and, just like with 
Windows applications, there are tons of documentation available online for any 
question you might have.</p>
<h5>Smartphone Apps</h5>
<p>Applications for the various devices and tablets will continue to get more 
and more popular as people slowly move way from the traditional PC and laptop 
toward devices that they can easily carry such as Android phones, the 
iPhone and the Blackberry. I'm sure there are new programmers out there already 
who have gotten their start programming mobile applications.</p>
<p>Not having done much with mobile apps yet, there's not as much I can say 
about them from a technical standpoint. Just as with desktop and online 
applications, however, there are specific languages and tools that are used when 
programming for these devices. When trying to determine what programming options 
exist for a specific device or software, there are two terms that you should 
keep in mind;</p>
<ul>
  <li>Software Development Kit (SDK) - This is a collection of software and 
  tools that you can use to create software for a device. For example, the 
  Android platform is based around a Linux operating system and mostly uses the 
  Java language for its apps. An
  <a target="_blank" href="http://developer.android.com/index.html">SDK is 
  available</a> that you can download and install to get started programming 
  applications.</li>
  <li>Application Programming Interface (API) - In the world of programming, an 
  interface specifies how your program can communicate with another program or 
  collection of code libraries. It might simply be the names of functions that 
  can be accessed from outside the program to perform certain calculations. 
  Major websites like
  <a target="_blank" href="https://developers.facebook.com/?ref=pf">Facebook</a>,
  <a target="_blank" href="https://developers.google.com/">Google</a> and
  <a target="_blank" href="http://developer.amazon.com/">Amazon</a> provide APIs 
  so that developers can write their own applications to use the data the sites 
  make available such as product information. On many websites, including this 
  one, you'll see link buttons used to share the site's content on Facebook or 
  Twitter. Even these could be considered to be part of an API since they 
  involve code that the web designer obtains from Facebook or Twitter and 
  incorporates into his own site so that the two sites can interact.</li>
</ul>
<p>Remembering these two terms, you will find it easier to track down the 
programming resources available for any software platform, online service or 
device. From this point on, you'll probably find yourself noticing them quite a 
bit more as you surf the web or work with different technologies and you'll 
start to see the world slightly differently as you realize how many 
opportunities are out there to develop your programming skills.</p>
<h5>Databases</h5>
<p>One more thing I want to mention in regard to programming is the database. No 
matter what kind of applications you're programming, at some point you'll need a 
place to store data whether it's a user profile, customer and order data or blog 
entries. As I said, I use a database to store the quotes you see at the top of 
these pages and the links&nbsp; for the book advertisements.</p>
<p>There are a number of databases out there that you can learn about and each 
has its benefits depending on the environment in which you're using it. I 
started with <a target="_blank" href="http://office.microsoft.com/en-us/access/">
Microsoft Access</a> which is a fine desktop database and a great way to learn 
about database principles. I later moved on to
<a target="_blank" href="http://www.microsoft.com/sqlserver/en/us/default.aspx">
Microsoft SQL Server</a> which is more appropriate for network applications with 
large stores of data where security is required. SQL Server also has its own 
programming environment that makes use of stored procedures. These procedures 
use a scripting language called
<a target="_blank" href="http://msdn.microsoft.com/en-us/library/ms189826(v=sql.90).aspx">
Transact SQL (T-SQL)</a> and can be called by programs in other languages like 
C# to carry out complex operations on the data within the database.</p>
<p>Outside the Microsoft environment, there's also
<a target="_blank" href="http://www.mysql.com/">MySQL</a>, which is often used&nbsp; 
with web applications and languages like PHP. The
<a target="_blank" href="http://wordpress.org/">WordPress</a> blogging software 
uses MySQL to store all of a blog's data. MySQL has the advantages of working on 
both Windows and Linux web servers and being open-source. Other examples would 
be <a target="_blank" href="http://www.sqlite.org/">SQLite</a> and
<a target="_blank" href="http://msdn.microsoft.com/en-us/data/ff687142.aspx">SQL 
Server Compact Edition</a>, smaller database systems used for data specific to 
single programs like mobile applications.</p>
<p>While it's not necessary for a programmer to be a full-fledged database 
administrator, it is important to have a good grasp of database principles 
because knowing how to efficiently communicate with the database will help your 
program perform that much better.<i> </i></p>
<h5>Conclusion</h5>
<p>There are a lot of technologies out there, they're constantly being updated 
and the field is constantly changing. There's far too much for any one person to 
learn and it's easy to be intimidated by that but the only thing you can do is find 
the type of programming that interests you and dive in. Know that it will 
take you a few years to become proficient but that's no worse than pursuing a 
four-year college degree and you can do this a lot cheaper. The best part is 
that with every week that goes by and every project you take on, you will be 
learning new things and adding to your experience. </p>
<p>For another selection of technologies that are still popular in the 
development world, check out this article on TechRepublic.com - &quot;<a target="_blank" href="http://www.techrepublic.com/blog/10things/10-development-technologies-that-refuse-to-die/3296">10 
Development Technologies that Refuse to Die</a>&quot; </p>
    <p>
        See Part <a href="201206190957.aspx">One</a> <a href="201206200922.aspx">
        Two</a> <a href="201206252154.aspx">Three</a>&nbsp;
        <a href="201206281110.aspx">Four</a> <a href="../Indexes/series001.aspx">
        Index</a></p>
<p>&nbsp;</p>



</asp:Content>


