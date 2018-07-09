<%@ Page Title="Article Search - Comeau Software Solutions" MetaDescription="Site search page for ComeauSoftware.com" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ComeauWebsite.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%; 
        }
        .style3
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptMan" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" align="center" colspan="3">
                Use the fields below to search for an article on ComeauSoftware.com.</td>
        </tr>
        <tr>
            <td class="style3" align="right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" align="right">
                Title:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="textTitle" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" align="right">
                Article Summary:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="textSummary" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" align="right">
                Date Posted:</td>
            <td>
                &nbsp;
                From:&nbsp;
                <asp:TextBox ID="textDateFrom" runat="server" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="textDateFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="textDateFrom">
                </ajaxToolkit:CalendarExtender>
&nbsp; To:&nbsp;
                <asp:TextBox ID="textDateTo" runat="server" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="textDateTo_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="textDateTo">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Button ID="cmdSearch" runat="server" Text="Search" 
                    onclick="cmdSearch_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdReset" runat="server" Text="Reset Fields" 
                    onclick="cmdReset_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    <br />
    <p align="center">
        <strong>Search Results</strong><br />
        <asp:Label ID="lblArticleCount" runat="server"></asp:Label>
    </p>

    <asp:Panel ID="pnlGrid" runat="server" HorizontalAlign="Center">
        <asp:GridView ID="gvArticles" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="Articles" 
        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
        onselectedindexchanged="gvArticles_SelectedIndexChanged" 
            onsorting="gvArticles_Sorting" ondatabound="gvArticles_DataBound" 
            Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Go to Page" >
                <ItemStyle Wrap="True" Width="15%" />
                </asp:CommandField>
                <asp:BoundField DataField="DisplayTitle" HeaderText="Title" 
                SortExpression="DisplayTitle" >
                <ItemStyle Width="35%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Description" SortExpression="ShortDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ShortDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ShortDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="35%" />
                </asp:TemplateField>
                <asp:BoundField DataField="CreateDate" HeaderText="Posted" 
                SortExpression="CreateDate" DataFormatString="{0:d}" >
                <ItemStyle HorizontalAlign="Center" Width="15%" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ArticleID" ShowHeader="False">
                <ControlStyle Width="1px" />
                <ItemStyle ForeColor="#F7F6F3" Width="1px" />
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

    <br />
    <asp:Panel ID="pnlGoogle" runat="server">

        <br />
        To search the full text of articles on ComeauSoftware.com, try the Google custom 
        search below.&nbsp; (Results limited to articles currently indexed by Google.)

        <div id="cse" style="width: 100%;">Loading</div>
        <script src="http://www.google.com/jsapi" type="text/javascript"></script>
        <script type="text/javascript">
            google.load('search', '1', { language: 'en', style: google.loader.themes.SHINY });
            google.setOnLoadCallback(function () {
                var customSearchOptions = {}; var customSearchControl = new google.search.CustomSearchControl(
              '016514425185609736068:sm63jo8yzvm', customSearchOptions);
                customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
                var options = new google.search.DrawOptions();
                options.setAutoComplete(true);
                customSearchControl.draw('cse', options);
            }, true);
        </script>
        <noscript>
        <p>&nbsp;</p>
        <p><i>Your broswer does not have JavaScript enabled. Please enable it to use this feature.</i></p>
        </noscript>

    </asp:Panel>
    <br />
    <asp:SqlDataSource ID="Articles" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DB_43396_sitedataConnectionString %>" 
        
        
        
        
        
        SelectCommand="GetArticlesForSearch" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>


