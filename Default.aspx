<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StudyMate Data Viewer</title>
</head>
<body>
    <form id="form2" runat="server">
    <div align="center" 
        style="font-family: 'Times New Roman' ; " 
        title="StudyMate Data Viewer">
    
        <asp:Label ID="lblheader" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Names="Segoe UI" Font-Overline="False" Font-Size="X-Large" 
            ForeColor="Blue" Text="StudyMate Data Viewer"></asp:Label>
    
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Black" 
            Text="Current Database Location"></asp:Label>
        <br />
        <asp:Label ID="txtdb" runat="server" ForeColor="#FF9933"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblLink" runat="server" Text="Link"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtLink" runat="server"></asp:TextBox>
        <br />
        <br />
        &nbsp;<asp:RadioButtonList ID="radioType" runat="server" Height="24px" 
            RepeatDirection="Horizontal" Width="189px" 
            onselectedindexchanged="radioType_SelectedIndexChanged">
            <asp:ListItem>Lecture</asp:ListItem>
            <asp:ListItem>Lab</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="txtnote" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
            Text="Submit" />
        &nbsp;<asp:Button ID="btnClear" runat="server" onclick="btnClear_Click" 
            Text="Clear" Width="58px" />
        &nbsp;<asp:Button ID="btnfill" runat="server" onclick="btnfill_Click" 
            Text="Auto Fill" Width="72px" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" 
            Text="To view available data click Retrieve"></asp:Label>
        .<br />
        <br />
        <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" 
            onclick="btnRetrieve_Click" />
        &nbsp;<asp:Button ID="btnclearview" runat="server" Text="Clear View" 
            onclick="btnclearview_Click" Width="81px" />
        <br />
        <br />
        <asp:GridView ID="DataView" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            Caption="Current Data" CaptionAlign="Top" CellPadding="4" DataKeyNames="ID" 
            DataSourceID="Database" EnableModelValidation="True" ForeColor="Black" onrowcancelingedit="DataView_RowCancelingEdit" 
            onrowdeleted="DataView_RowDeleted" onrowdeleting="DataView_RowDeleting" 
            onrowediting="DataView_RowEditing" onrowupdated="DataView_RowUpdated" 
            onrowupdating="DataView_RowUpdating" 
            onselectedindexchanged="radioType_SelectedIndexChanged" 
            onsorted="DataView_Sorted" onsorting="DataView_Sorting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="Database" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/Data.mdb" 
            DeleteCommand="DELETE FROM [List] WHERE [ID] = ? AND (([Subject] = ?) OR ([Subject] IS NULL AND ? IS NULL)) AND (([Year] = ?) OR ([Year] IS NULL AND ? IS NULL)) AND (([Type] = ?) OR ([Type] IS NULL AND ? IS NULL)) AND (([Link] = ?) OR ([Link] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [List] ([ID], [Subject], [Year], [Type], [Link]) VALUES (?, ?, ?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [List]" 
            UpdateCommand="UPDATE [List] SET [Subject] = ?, [Year] = ?, [Type] = ?, [Link] = ? WHERE [ID] = ? AND (([Subject] = ?) OR ([Subject] IS NULL AND ? IS NULL)) AND (([Year] = ?) OR ([Year] IS NULL AND ? IS NULL)) AND (([Type] = ?) OR ([Type] IS NULL AND ? IS NULL)) AND (([Link] = ?) OR ([Link] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Link" Type="String" />
                <asp:Parameter Name="original_Link" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_Link" Type="String" />
                <asp:Parameter Name="original_Link" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <br />
    
    </div>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
