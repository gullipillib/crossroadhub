<%@ Page Language="C#" AutoEventWireup="true" Debug="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>



<!DOCTYPE html>
<script runat="server">

    string ImageFileUrl = "";
    string UserId = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        UserId = Session["usercountervalue"].ToString();
        if (Page.IsPostBack == false)
        {
           
            if (Session["usercountervalue"] == null)
            {
                Response.Redirect("index.aspx");
            }
            SqlDataSource1.SelectCommand = "SELECT UserName, SurName, Imagefile FROM [UserTable] where UserId = '" + Session["usercountervalue"] + "'";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count != 0)
            {

                ImageFileUrl = dt.Rows[0].Field<string>("ImageFile"); //usethis to get field value       
                
            }
        }
    }


    protected void Button16_Click(object sender, EventArgs e)
    {
        SqlDataSource2.InsertCommand = "INSERT INTO UserDataTable(UserId, ImageId, VideoId, PostId, Dated, Reported, PostMatter, Category) Values ('" + UserId + "', '" + TextBox3.Text + "',  '" + TextBox4.Text + "',  '" + TextBox2.Text + "',   '" + DateTime.Now.ToString() + "', 'no', '" + TextBox2.Text + "', '" + DropDownList1.SelectedValue  + "')";
        SqlDataSource2.Insert();
                
    }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {

         
    }

     
</script>

    
<html>
<head>
    <title>Cross Road Hub</title>
</head>

<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" BackColor="#000099" Style="position: absolute; height: 49px; width: 1459px; top: -1px; left: 14px; z-index: -1;"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 107px; top: 9px; position: absolute; height: 27px; width:369px; " ToolTip="search friends"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Style="cursor: pointer; top: 13px; left: 494px; position: absolute; height: 26px; width: 56px" Text="Search" BackColor="#0066FF" ForeColor="White" 
            OnClick="Button1_Click" />
    
        <asp:Image ID="Image2" runat="server" Style="height:30px; width:30px; top: 9px; left: 66px; position: absolute; " ImageUrl="images/logo.jpg" />
        
        <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" style="z-index: 1; left: 10px; top: 57px; position: absolute; width: 1446px; height: 729px" Visible="true" Direction="LeftToRight">
           
            
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" BackColor="Transparent" style="z-index: 30; left: 18px; top: 184px; position: absolute; width: 125px; height: 220px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None">
            
                 <asp:Button ID="Button7" runat="server" Text="Prayers" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 27px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button8" runat="server" Text="Testimonials" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 1px; top: 62px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button9" runat="server" Text="Church" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 92px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button10" runat="server" Text="Songs" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 122px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button11" runat="server" Text="Worship" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 152px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button12" runat="server" Text="Events" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 192px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Label ID="Label10" runat="server" BackColor="Transparent" Style="position: absolute; height: 25px; width: 100px; top: -1px; left: 5px; z-index: -1;" Text="ACTIVITIES" Font-Size="10pt" 
                     ForeColor="#666666" Font-Names="Courier New"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" BackColor="Transparent" style="z-index: 1; left: 18px; top: 414px; position: absolute; width: 125px; height: 94px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None">
                <asp:Label ID="Label4" runat="server" BackColor="Transparent" Style="position: absolute; height: 25px; width: 100px; top: 6px; left: 5px; z-index: -1;" Text="MISC" Font-Size="10pt" 
                     ForeColor="#666666" Font-Names="Courier New"></asp:Label>
            
                 <asp:Button ID="Button13" runat="server" Text="Donate" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 11px; top: 30px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button14" runat="server" Text="Invite friends" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 1px; top: 62px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
         </asp:Panel>

        <asp:Button ID="Button5" runat="server" Text="Home" Font-Names="Arial" Font-Size="9pt" ForeColor="#999999" style="z-index: 1; left: 981px; top: 12px; position: absolute" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button4" runat="server" Text="۩" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="z-index: 1; left: 1041px; top: 12px; position: absolute" ToolTip="Friends Requests" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button2" runat="server" Text="۝" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="z-index: 1; left: 1070px; top: 12px; position: absolute" ToolTip="Messages" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button3" runat="server" Text="۞" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="z-index: 1; left: 1097px; top: 12px; position: absolute" ToolTip="Notifications" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button6" runat="server" Text="▼" Font-Names="Arial" Font-Size="9pt" ForeColor="#999999" style="z-index: 1; left: 1154px; top: 15px; position: absolute"  
            BackColor="Transparent" BorderStyle="None" />


       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db0c82a4d13fe24ad6baa8a59100e2d5e6ConnectionString %>"
            SelectCommand="SELECT [Imagefile], [UserName], [SurName] FROM [UserTable]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db0c82a4d13fe24ad6baa8a59100e2d5e6ConnectionString %>"
            SelectCommand="SELECT [UserId], [ImageId], [VideoId], [PostId], [Dated], [Reported], [PostMatter] FROM [UserDataTable] where UserId='1'"></asp:SqlDataSource>
        
        
        

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="z-index: 1; left: 630px; top: 4px; position: absolute; width: 360px; " 
            BackColor="Transparent" Font-Size="10pt" ForeColor="White" GridLines="None" Height="35px" PageSize="1" ShowHeader="False" CellPadding="0">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# new Uri(Convert.ToString(Eval("Imagefile"))) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" SortExpression="UserName" HeaderText="UserName" />
                <asp:BoundField DataField="SurName" HeaderText="SurName" SortExpression="SurName" />
                <asp:BoundField DataField="Imagefile" HeaderText="Imagefile" ShowHeader="False" SortExpression="Imagefile" Visible="False" />
            </Columns>
            <RowStyle Height="5px" />
        </asp:GridView>

         <asp:Panel ID="Panel4" runat="server" BackColor="Transparent" style="z-index: 1; left: 18px; top: 68px; position: absolute; width: 125px; height: 107px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None">

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="z-index: 1; left: 0px; top: 3px; position: absolute; width: 127px; height: 61px;" 
            BackColor="Transparent" Font-Size="10pt" ForeColor="White" GridLines="None" PageSize="1" ShowHeader="False" CellPadding="0">
            <Columns>
               
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# new Uri(Convert.ToString(Eval("Imagefile"))) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:BoundField DataField="UserName" SortExpression="UserName" HeaderText="UserName" />
                <asp:BoundField DataField="SurName" HeaderText="SurName" SortExpression="SurName" />
            <asp:BoundField DataField="Imagefile" HeaderText="Imagefile" ShowHeader="False" SortExpression="Imagefile" Visible="False" />
            </Columns>
            <RowStyle Height="5px" />
        </asp:GridView>
             <asp:Button ID="Button15" runat="server" Text="Edit Profile" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="z-index: 1; left: 1px; top: 83px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
   
             </asp:Panel>

            

        <asp:Panel ID="Panel5" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None">

             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="z-index: 1; left: 11px; top: 10px; position: absolute; width: 30px; height: 30px;" 
            BackColor="Transparent"  GridLines="None" PageSize="1" ShowHeader="False" CellPadding="0">
            <Columns>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# new Uri(Convert.ToString(Eval("Imagefile"))) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:BoundField DataField="Imagefile" HeaderText="Imagefile" ShowHeader="False" SortExpression="Imagefile" Visible="False" />
                
              </Columns>
            <RowStyle Height="5px" />
        </asp:GridView>
        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 67px; top: 19px; position: absolute; height: 27px; width:369px; "></asp:TextBox>
        <asp:Button ID="Button16" runat="server" Style="cursor: pointer; top: 123px; left: 609px; position: absolute; height: 26px; width: 56px" Text="Post" BackColor="#0066FF" ForeColor="White" 
                 OnClick="Button16_Click"/>
            <asp:Button ID="Button18" runat="server" Text="Image" Font-Names="Arial" Font-Size="9" ForeColor="#999999" style="z-index: 1; left: 57px; top: 78px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" ToolTip="Image File" />
        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 117px; top: 69px; position: absolute; height: 27px; width:369px; " ToolTip="The Url to your Photo on the internet or youtube or onedrive"></asp:TextBox>
            <asp:Button ID="Button17" runat="server" Text="Video" Font-Names="Arial" Font-Size="9" ForeColor="#999999" style="z-index: 1; left: 55px; top: 122px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" ToolTip="Video" />
        <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 1; left: 117px; top: 114px; position: absolute; height: 27px; width:343px; " 
                 ToolTip="The Url to your Photo on the internet or youtube or onedrive"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" BackColor="Transparent" Style="position: absolute; height: 20px; width: 20px; top: 122px; left: 24px; z-index: 0;" Font-Names="Arial">֍</asp:Label>
            <asp:Label ID="Label3" runat="server" BackColor="Transparent" Style="position: absolute; height: 20px; width: 20px; top: 82px; left: 27px; z-index: 0;" Font-Names="Arial">௹</asp:Label>
        
            <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Arial" Font-Size="9pt" ForeColor="#999999" style="z-index: 1; left: 497px; top: 126px; position: absolute">
                <asp:ListItem>General</asp:ListItem>
                <asp:ListItem>Prayers</asp:ListItem>
                <asp:ListItem>Testimonials</asp:ListItem>
                <asp:ListItem>Chruch</asp:ListItem>
                <asp:ListItem>Songs</asp:ListItem>
                <asp:ListItem>Worship</asp:ListItem>
                <asp:ListItem>Events</asp:ListItem>
             </asp:DropDownList>
       </asp:Panel>

         <asp:Panel ID="PanelGeneral" runat="server" BackColor="White" style="overflow:auto; z-index: 1; left: 158px; top: 238px; position: absolute; width: 676px; height: 543px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">
             
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="z-index: 1; left: 11px; top: 10px; position: absolute; width: 30px; height: 30px;" 
            BackColor="Transparent"  GridLines="None" PageSize="1" ShowHeader="False" CellPadding="0">
            <Columns>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# new Uri(Convert.ToString(Eval("Imagefile"))) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:BoundField DataField="Imagefile" HeaderText="Imagefile" ShowHeader="False" SortExpression="Imagefile" Visible="False" />
                
              </Columns>
            <RowStyle Height="5px" />
        </asp:GridView>

             <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" style="border-style: None; z-index: 1; left: 8px; top: 51px; position: absolute; direction: ltr; overflow-y: scroll; width: 649px; height: 1642px; background-color: White;" 
            BackColor="Transparent"  GridLines="Horizontal" PageSize="100000" ShowHeader="False" CellPadding="0" DataMember="DefaultView">
            <Columns>
                 
                 <asp:ImageField DataImageUrlField="ImageId" ShowHeader="False">
                 </asp:ImageField>
                 
                 <asp:BoundField DataField="Dated" HeaderText="Dated" ShowHeader="False" SortExpression="Dated" />
                 
                 <asp:BoundField DataField="PostMatter" HeaderText="PostMatter" ShowHeader="False" SortExpression="PostMatter" />
                 
                 <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                      
                       
                        <iframe class="youtube-player" id="player" type="text/html" src=src='<%# new Uri(Convert.ToString(Eval("VideoId"))) %>' frameborder="0" style="z-index: 320; left: 350px; top: 500px; position: absolute; height: 240px; width: 320px; border:medium;"></iframe>

                   </ItemTemplate>
                </asp:TemplateField>
                 
              </Columns>
            
        </asp:GridView>

           

             </asp:Panel>
        
        <asp:Panel ID="PanelPrayers" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">

             </asp:Panel>
        
        <asp:Panel ID="PanelTestimonials" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">

             </asp:Panel>
        
        <asp:Panel ID="PanelChruch" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">

             </asp:Panel>

        <asp:Panel ID="PanelSongs" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">

             </asp:Panel>

        <asp:Panel ID="PanelWorship" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical">

             </asp:Panel>
        
        <asp:Panel ID="PanelEvents" runat="server" BackColor="White" style="z-index: 1; left: 158px; top: 68px; position: absolute; width: 676px; height: 159px" Visible="False" Direction="LeftToRight" 
            BorderStyle="None" ScrollBars="Vertical" >

             </asp:Panel>

        <asp:Panel ID="PanelFriends" runat="server" BackColor="White" style="z-index: 1; left: 846px; top: 68px; position: absolute; width: 273px; height: 280px" Visible="True" Direction="LeftToRight" 
            BorderStyle="None" >

             </asp:Panel>
        
        
        
    </form>
</body>
</html>
