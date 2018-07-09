<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="ComeauWebsite.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style4
        {
            text-align: right;
            width: 405px;
        }
        .style5
        {
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
    </p>
    <table class="style2">
        <tr>
            <td class="style4">
                Display Title:</td>
            <td class="style5">
                <asp:TextBox ID="textTitle" runat="server" Width="399px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                File Path:</td>
            <td class="style5">
                <asp:TextBox ID="textPath" runat="server" Width="399px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Summary:</td>
            <td class="style5">
                <asp:TextBox ID="textSummary" runat="server" TextMode="MultiLine" Width="399px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Active:</td>
            <td class="style5">
                <asp:CheckBox ID="checkActive" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                Last Review Date:</td>
            <td class="style5">
                <asp:TextBox ID="textReview" runat="server" Width="150px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="ReviewDateCalExtend" runat="server" 
                    Enabled="True" TargetControlID="textReview">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
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
        onselectedindexchanged="gvArticles_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="DisplayTitle" HeaderText="Display Title" 
                    SortExpression="DisplayTitle" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                    SortExpression="Active" />
                <asp:BoundField DataField="ReviewDate" HeaderText="Last Reviewed" 
                    SortExpression="ReviewDate" />
                <asp:BoundField DataField="FilePath" HeaderText="File Path" 
                    SortExpression="FilePath" />
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
    <p>
        <asp:SqlDataSource ID="Articles" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DB_43396_sitedataConnectionString %>" 
            
            SelectCommand="SELECT [ArticleID], [DisplayTitle], [Active], [ReviewDate], [FilePath] FROM [Articles]">
        </asp:SqlDataSource>
    </p>
</asp:Content>

