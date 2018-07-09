<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="ComeauWebsite.adminpanel" ValidateRequest="false" EnableEventValidation="false" ViewStateEncryptionMode="Never" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 646px;
        }
        .style4
        {
            width: 150px;
            text-align: right;
        }
        .style5
        {
            width: 119px;
        }
        .style6
        {
            width: 521px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="header">
		    <h1><a href="http://www.ComeauSoftware.com">ComeauSoftware.com</a></h1>
            
		    <p class="description">... because knowledge is meant to be shared.</p>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" IncludeStyleBlock="false">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Default.aspx" 
                        ToolTip="Return to Home Page"></asp:MenuItem>
                    <asp:MenuItem Text="About" Value="About" NavigateUrl="~/About.aspx" 
                        ToolTip="About this Site"></asp:MenuItem>
                    <asp:MenuItem Text="Article Search" Value="Article Search" 
                        NavigateUrl="~/Search.aspx" ToolTip="Search articles on ComeauSoftware.com."></asp:MenuItem>
                    <asp:MenuItem Text="Extras" Value="Extras">
                        <asp:MenuItem NavigateUrl="~/Pages/JobSearch.aspx" 
                            Text="Free Job Search Software" Value="Free Job Search Software">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
	    </div>
        <br />
        <div id="wrapper">
            <div id="admincontent">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
            <br />
                <asp:Panel ID="pnlControls" runat="server">
                    Select Category:&nbsp;&nbsp;
                    <asp:Button ID="cmdArticleSel" runat="server" Text="Articles" 
                        onclick="cmdArticleSel_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdQuotesSel" runat="server" Text="Quotes" 
                        onclick="cmdQuotesSel_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdAdsSel" runat="server" Text="Ads" 
                        onclick="cmdAdsSel_Click" />


                </asp:Panel>

            <br />

                <asp:Panel ID="pnlArticles" runat="server" Visible="False">


                <table align="center">
                    <tr>
                        <td align="right">
                            Display Title:</td>
                        <td>
                            <asp:TextBox ID="textTitle" runat="server" Width="399px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            File Path:</td>
                        <td>
                            <asp:TextBox ID="textPath" runat="server" Width="399px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Description</td>
                        <td>
                            <asp:TextBox ID="textDescription" runat="server" Width="399px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Summary:</td>
                        <td>
                            <asp:TextBox ID="textSummary" runat="server" TextMode="MultiLine" Width="488px" 
                                AutoPostBack="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;Active:&nbsp;
                            <asp:CheckBox ID="checkActive" runat="server" Checked="True" />
                            &nbsp;&nbsp; Find in Search:&nbsp;
                            <asp:CheckBox ID="checkSearch" runat="server" />
                            &nbsp; Select at Random:
                            <asp:CheckBox ID="checkRandom" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="cmdSave" runat="server" onclick="cmdSave_Click" 
                                Text="Save Article" UseSubmitBehavior="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="cmdNew" runat="server" onclick="cmdNew_Click" 
                                Text="New Article" />
                        </td>
                    </tr>
                </table>
                <br />
                    <asp:GridView ID="gvArticles" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ArticleID" 
                        DataSourceID="Articles" ForeColor="#333333" GridLines="None" 
                        HorizontalAlign="Center" 
                    onselectedindexchanged="gvArticles_SelectedIndexChanged" Width="100%" 
                        AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="DisplayTitle" HeaderText="Display Title" 
                                SortExpression="DisplayTitle" />
                            <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                                SortExpression="Active" />
                            <asp:BoundField DataField="ReviewDate" HeaderText="Last Reviewed" 
                                SortExpression="ReviewDate" />
                            <asp:BoundField DataField="FilePath" HeaderText="File Path" 
                                SortExpression="FilePath" >
                            <ItemStyle Width="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ArticleID" InsertVisible="False" ReadOnly="True" 
                                ShowHeader="False" SortExpression="ArticleID">
                            <ItemStyle ForeColor="White" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                <p>
                    &nbsp;</p>

                </asp:Panel>

                <asp:Panel ID="pnlQuotes" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                Quote Text:</td>
                            <td class="style3">
                                <asp:TextBox ID="textQuote" runat="server" TextMode="MultiLine" Width="600px" 
                                    Height="50px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                Author:</td>
                            <td class="style3">
                                <asp:TextBox ID="textAuthor" runat="server" Width="280px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style3">
                                <asp:Button ID="cmdSaveQuote" runat="server" onclick="cmdSaveQuote_Click" 
                                    Text="Save Quote" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="cmdNewQuote" runat="server" onclick="cmdNewQuote_Click" 
                                    Text="New Quote" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>

                </asp:Panel>

                <asp:Panel ID="pnlAds" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style5">
                                Description:</td>
                            <td class="style6">
                                <asp:TextBox ID="textProdDesc" runat="server" Width="462px"></asp:TextBox>
                            </td>
                            <td rowspan="9">
                                <div class="contentcenter">            
                                <asp:Label ID="lblIntro" runat="server"></asp:Label>
                                <br />
                                <asp:Literal ID="litImage" runat="server"></asp:Literal>                
                                <br />
                                <asp:Literal ID="litText" runat="server"></asp:Literal>
                                <br />
                                <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                <br />
                                <asp:Literal ID="litAlt" runat="server"></asp:Literal>
                                    <br />
                                <br />
                                    <asp:Button ID="cmdPreviewAd" runat="server" Text="Preview" 
                                        onclick="cmdPreviewAd_Click" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Author / Manuf.:</td>
                            <td class="style6">
                                <asp:TextBox ID="textManuf" runat="server" Width="462px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Text Link:</td>
                            <td class="style6">
                                <asp:TextBox ID="textTextLink" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Image Link:</td>
                            <td class="style6">
                                <asp:TextBox ID="textImageLink" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Alternate Link:</td>
                            <td class="style6">
                                <asp:TextBox ID="textAltLink" runat="server" Height="50px" TextMode="MultiLine" 
                                    Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Assoc. Article</td>
                            <td class="style6">
                                <asp:TextBox ID="textAssocArticle" runat="server" Width="462px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Intro Text:</td>
                            <td class="style6">
                                <asp:TextBox ID="textIntroText" runat="server" Width="462px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Active:</td>
                            <td class="style6">
                                <asp:CheckBox ID="chkProdActive" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style6">
                                <asp:Button ID="cmdSaveAd" runat="server" onclick="cmdSaveAd_Click" 
                                    Text="Save Ad" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="cmdNewAd" runat="server" onclick="cmdNewAd_Click" 
                                    Text="New Ad" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="gvAds" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="adID" 
                        DataSourceID="Ads" ForeColor="#333333" GridLines="None" 
                        HorizontalAlign="Center" 
                        onselectedindexchanged="gvAds_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:TemplateField HeaderText="Image" SortExpression="ImageLink">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageLink") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="litImage" runat="server" Text='<%# Eval("ImageLink") %>'></asp:Literal>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                                SortExpression="Active" />
                            <asp:BoundField DataField="adID" InsertVisible="False" ReadOnly="True" 
                                SortExpression="adID">
                            <ItemStyle Font-Size="Smaller" ForeColor="White" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>


                </asp:Panel>

                    <asp:SqlDataSource ID="Articles" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DB_43396_sitedataConnectionString %>" 
                        
                        
                        
                        
                        SelectCommand="SELECT [ArticleID], [DisplayTitle], [FilePath], [ShortDescription], [Active], [ReviewDate] FROM [Articles]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="Ads" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DB_43396_sitedataConnectionString %>" 
                        SelectCommand="SELECT [adID], [Description], [ImageLink], [Active] FROM [SiteAds]">
                    </asp:SqlDataSource>

            <br />
            
            </div>
        </div>
    </div>
    </form>
</body>
</html>
