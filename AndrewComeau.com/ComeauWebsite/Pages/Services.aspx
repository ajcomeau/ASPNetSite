<%@ Page Title="Comeau Software Solutions - Software consulting services in Ocala, Florida" Language="C#" MasterPageFile="~/Site.Master"
 MetaDescription="Professional software consultation including custom programming, website design, electronic publishing and general technology consultation. Offering on-site consulting services throughout Central Florida." 
 MetaKeywords="Microsoft, Access, Programmer, Developer, Application, Analysis, Consultant, Ocala, Florida, Central, Marion, Alachua, Gainesville, websites, wordpress, online presence, Kindle, eBook, resume"
  AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="ComeauWebsite.Pages.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <h2 class="style1">Comeau Software Solutions<br />
    <span class="articlesub">Bringing the answers and making the technology work.</span></h2>
    
<p>    As a professional software developer with several years of programming 
    and software experience, I can help you find the tools that will eliminate extra 
    work, simplify your workflow and more effectively manage your information. For 
    over 20 years, I've worked with companies in fields including manufacturing and 
    healthcare which provides me with the perspective to better understand your 
    processes and needs.</p>
<p>
    Click on any of the services below for more information:
</p>
<div class="fltcenter">
    <ajaxToolkit:Accordion  ID="Accordion1" runat="server" Width="85%" 
        CssClass="accordion" ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
        <Panes>
            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>
                Software and Technology Consultation
                </Header>
                <Content>
                Not everyone has the time to be a technology expert. Whether you're running a small business or
                just need to tap someone with more experience in hardware and software, it never hurts to talk 
                to a specialist. I have been working with software and computer technology for the last 20 years
                and will be glad to help you find the right product for your needs. <a href="serv-stc.aspx">Find out more ...</a>
                </Content>
            </ajaxToolkit:AccordionPane>
            <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>
                Websites and Online Solutions
                </Header>
                <Content>
                Since 2000, I have been running my own websites and other online promotional tools. During that
                time, I've gained the experience to help you register a domain, design websites and blogs and promote
                your online presence using the appropriate tools. Let me take care of the technical challenges that go
                with an Internet presence so you can focus on your business and what you want to say. <a href="serv-wos.aspx">Find out more ...</a>
                </Content>
            </ajaxToolkit:AccordionPane>
            <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Microsoft Access Project Rescue</Header>
                <Content>Do you have custom applications designed in Microsoft Access? Is the original developer no longer
                available? Maybe it's a small application or two designed by a previous employee or maybe it's a large
                system of Access and Excel applications that is affecting a major part of your business. Either way, I
                can help you to get control of that application again. With 15 years of experience in Microsoft 
                Access, I can analyze your existing system, make requested changes and recommend whatever other steps
                are needed to ensure that your data is safe. <a href="serv-access.aspx">Find out more ...</a>
                </Content>
            </ajaxToolkit:AccordionPane>
            <ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Custom Software Development</Header>
                <Content>
                Sometimes your existing software doesn't do everything you want it to do but changing over to
                an entirely new system would be too expensive and time consuming. When nothing else will meet your needs,
                I can work with you to develop desktop or online solutions that will accomodate your business needs and
                simplify your process. As a professional software developer, I am experienced in asking the necessary
                questions, designing user-friendly programs and documentation and providing end-user training and support.
                </Content>
            </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Computer Programming Consultation</Header>
                <Content>
                While there are thousands of books, websites and classes out there to help people learn programming,
                sometimes a one-on-one personal approach is needed. Whether you're learning to work with Microsoft Access
                or some of the latest programming languages, I will be glad to sit down with you and provide the guidance
                you need to start a career in software development or get over a tough spot in your latest project.  
                    <a href="serv-stc.aspx">Find out more ...</a>
                </Content>
            </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane6" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Electronic Publishing and Promotion</Header>
                <Content>
                Whether you need to publish an eBook or simply get your resume out there to be seen, I can help you 
                through the technical details and advise you on how to promote your work to the people who need to
                see it. With a background in resume writing and experience in publishing for the Kindle, I will be
                glad to help you with your project. <a href="serv-epub.aspx">Find out more ...</a>
                </Content>
            </ajaxToolkit:AccordionPane>
            <ajaxToolkit:AccordionPane ID="AccordionPane7" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Computer Hardware and Software Services</Header>
                <Content>
                Is your computer running slow?  Are you trying to decide if it's time for a new machine or what type
                of equipment to buy?  In addition to my other services, I can help you speed up a slow running machine
                and advise you on the best equipment to buy for your needs. I am completely independent of any brand name
                so I can focus completely on your needs as a computer user and provide you with the information you need.
                </Content>
            </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane8" runat="server" 
                ContentCssClass="accordionContent" HeaderCssClass="accordionHeader">
                <Header>Resume Consultation</Header>
                <Content>
                Looking for a new job? Let me help you polish your resume so that it gets the most attention from prospective
                employers. Anyone can put together a quick resume with Microsoft Word but it takes extra skill to write and format
                that resume in a way that will effectively market your skills. With a background in professional resume consultation, 
                proofreading and <a href="comeau-resume.aspx">20 years of experience</a> in various fields, I can help you tailor your resume to make the most of
                your experience and advise you on how to best distribute that resume to get it in front of the people making the
                decisions.
                </Content>
            </ajaxToolkit:AccordionPane>
        </Panes>
    </ajaxToolkit:Accordion>
    </div>
    <p>&nbsp;</p>
    <p>
    As a professional, my first priority is providing you with the best service and 
    solutions to meet your needs. It is not in my interests to sell you services or 
    products that you don't need. At the end of the day, I would rather have a 
    satisfied customer than a quick sale.

    For more information on my work and experience, take some time to look around this website or 
        <a href="comeau-resume.aspx">check out my resume</a>.
</p>
<p>
    Based in Ocala, Florida, I am able to provide on-site service for all of Central 
    Florida and remote service elsewhere.
</p>
    <div class="fltcenter">
        <img alt="" src="../Graphics/Content/CardImage.jpg" width="400" /></div>

        <p>
            &nbsp;</p>
    <p>
    Please contact me at
    <a href="mailto:acomeau@drewslair.com?subject=Drewslair.com%20-%20Consulting%20service%20information%20request">
    acomeau@drewslair.com</a> or call (352) 572-2997 for more information on these 
    or any of the services I provide including rates and availability.&nbsp;</p>
    <p>
        &nbsp;</p>

</asp:Content>

