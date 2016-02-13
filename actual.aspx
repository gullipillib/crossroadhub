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
            SqlDataSource1.SelectCommand = "SELECT UserName, SurName, Imagefile FROM UserTable where UserId = '" + Session["usercountervalue"] + "'";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count != 0)
            {

                ImageFileUrl = dt.Rows[0].Field<string>("ImageFile"); //usethis to get field value       
                
            }
            SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'General') order by Dated DESC";
        }
    }


    protected void Button16_Click(object sender, EventArgs e)
    {
       if(TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" )
       { 
	
        if(TextBox3.Text != "" && TextBox3.Text.Contains("youtu.be"))
       	{
		TextBox3.Text = TextBox3.Text.Replace("https://youtu.be","https://www.youtube.com/embed");
	    }
        if(TextBox3.Text != "" && TextBox3.Text.Contains("youtube"))
       {
           TextBox3.Text = TextBox3.Text + "?autoplay=1&loop=1";
       }
        if (TextBox4.Text != "" && TextBox4.Text.Contains("youtu.be"))
        {
            TextBox4.Text = TextBox4.Text.Replace("https://youtu.be", "https://www.youtube.com/embed");
        }
        
           
        SqlDataSource2.InsertCommand = "INSERT INTO UserDataTable(UserId, ImageId, VideoId, PostId, Dated, Reported, PostMatter, Category) Values ('" + UserId + "', '" + TextBox3.Text + "',  '" + TextBox4.Text + "',  '" + TextBox2.Text + "',   '" + DateTime.Now.ToString() + "', 'no', '" + TextBox2.Text + "', '" + DropDownList1.SelectedValue  + "')";
        SqlDataSource2.Insert();
        Label5.Text = "post successful";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";       
       }  
       else
       {
           Label5.Text = "post not successful";

       }     
    }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {

         
    }

    protected void Button20_Click(object sender, EventArgs e)
    {

        Label111.Text = GridView7.SelectedDataKey[0].ToString() + "  " + GridView7.SelectedDataKey[1].ToString() + " added as friend";
    }


    protected void Button5_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'General') order by Dated DESC";

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'Prayers') order by Dated DESC";

    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'Events') order by Dated DESC";

    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'Songs') order by Dated DESC";

    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'Church') order by Dated DESC";

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT Top 25 UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.ImageId, UserDataTable.Category, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserDataTable.Category = 'Testimonials') order by Dated DESC";

    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
</script>

    
<html>
<head>
    <title>Cross Road Hub</title>
</head>

<body>
    <form id="form1" runat="server">
       
				<asp:Button ID="Button5" runat="server" Text="Home" Font-Names="Arial" Font-Size="9pt" ForeColor="#999999" style="cursor: pointer; z-index: 1000; left: 981px; top: 12px; position: absolute" 
            BackColor="Transparent" BorderStyle="None" OnClick="Button5_Click" />
        <asp:Button ID="Button4" runat="server" Text="۩" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="z-index: 1000; left: 1041px; top: 12px; position: absolute" ToolTip="Friends Requests" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button2" runat="server" Text="۝" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="z-index: 1000; left: 1070px; top: 12px; position: absolute" ToolTip="Messages" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button3" runat="server" Text="۞" Font-Names="Arial" Font-Size="12pt" ForeColor="#999999" style="cursor: pointer; z-index: 1000; left: 1097px; top: 12px; position: absolute" ToolTip="Notifications" 
            BackColor="Transparent" BorderStyle="None" />
        <asp:Button ID="Button6" runat="server" Text="▼" Font-Names="Arial" Font-Size="9pt" ForeColor="#999999" style="cursor: pointer; z-index: 1000; left: 1154px; top: 15px; position: absolute"  
            BackColor="Transparent" BorderStyle="None" ToolTip="Logout" OnClick="Button6_Click" />
                <asp:Button ID="Button7" runat="server" Text="Prayers" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 21px; top: 201px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" OnClick="Button7_Click" />
                <asp:Button ID="Button8" runat="server" Text="Testimonials" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 11px; top: 238px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" OnClick="Button8_Click" />
                <asp:Button ID="Button9" runat="server" Text="Church" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 19px; top: 275px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" OnClick="Button9_Click" />
                <asp:Button ID="Button10" runat="server" Text="Songs" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 21px; top: 305px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" OnClick="Button10_Click" />
                <asp:Button ID="Button11" runat="server" Text="Worship" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 21px; top: 342px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button12" runat="server" Text="Events" Font-Names="Arial" Font-Size="9" ForeColor="Black" style="cursor: pointer; z-index: 1000; left: 21px; top: 382px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" />
                <asp:Button ID="Button16" runat="server" Style="z-index:1000; cursor: pointer; top: 192px; left: 768px; position: absolute; height: 26px; width: 56px" Text="Post" BackColor="#0066FF" ForeColor="White" 
                 OnClick="Button16_Click"/>
			
			
        <asp:Label ID="Label1" runat="server" BackColor="#000099" Style="position: absolute; height: 49px; width: 1459px; top: -1px; left: 14px; z-index: -1;"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 107px; top: 9px; position: absolute; height: 27px; width:369px; " ToolTip="search friends"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Style="cursor: pointer; top: 13px; left: 494px; position: absolute; height: 26px; width: 56px" Text="Search" BackColor="#0066FF" ForeColor="White" 
            OnClick="Button1_Click" />
    
        <asp:Image ID="Image2" runat="server" Style="height:30px; width:30px; top: 9px; left: 66px; position: absolute; " ImageUrl="images/logo.jpg" />
        
        <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" style="z-index: 1; left: 10px; top: 57px; position: absolute; width: 1446px; height: 729px" Visible="true" Direction="LeftToRight">
           
            
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" BackColor="Transparent" style="z-index: 30; left: 18px; top: 184px; position: absolute; width: 125px; height: 220px" Visible="true" Direction="LeftToRight" 
            BorderStyle="None">
            
                 
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

        


       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db0c82a4d13fe24ad6baa8a59100e2d5e6ConnectionString %>"
            SelectCommand="SELECT [Imagefile], [UserName], [SurName] FROM [UserTable]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db0c82a4d13fe24ad6baa8a59100e2d5e6ConnectionString %>"
            
            SelectCommand="SELECT UserTable.UserId, UserTable.Imagefile, UserTable.UserName, UserTable.SurName, UserTable.UserId AS Expr1, UserDataTable.Category, UserDataTable.ImageId, UserDataTable.VideoId, UserDataTable.PostId, UserDataTable.Dated, UserDataTable.Reported, UserDataTable.PostMatter FROM UserTable CROSS JOIN UserDataTable WHERE (UserTable.UserId = '1')"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db0c82a4d13fe24ad6baa8a59100e2d5e6ConnectionString %>"
            SelectCommand="SELECT [Imagefile], [UserName], [SurName], [FriendRequests], [UserId]  FROM [UserTable]"></asp:SqlDataSource>
       
        
        

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="z-index: 1; left: 630px; top: 4px; position: absolute; width: 360px; " 
            BackColor="Transparent" Font-Size="10pt" ForeColor="White" GridLines="None" Height="35px" PageSize="1" ShowHeader="False" CellPadding="0">
            <Columns>
               
                <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                         
                        
                         <iframe src='<%# new Uri(Eval("Imagefile").ToString()) %>'  width="30"  height="30" ></iframe>
                         
                       
                                    
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
               
                 
               <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                         
                        
                         <iframe src='<%# new Uri(Eval("Imagefile").ToString()) %>'  width="50"  height="50" ></iframe>
                         
                       
                                    
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
                 
                <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                         
                        
                         <iframe src='<%# new Uri(Eval("Imagefile").ToString()) %>'  width="50"  height="50" ></iframe>
                         
                       
                                    
                   </ItemTemplate>
                     
                </asp:TemplateField>
              </Columns>
            <RowStyle Height="5px" />
        </asp:GridView>
        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 67px; top: 19px; position: absolute; height: 27px; width:369px; "></asp:TextBox>
        
            <asp:Button ID="Button18" runat="server" Text="Image" Font-Names="Arial" Font-Size="9" ForeColor="#999999" style="z-index: 1; left: 57px; top: 78px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" ToolTip="Image File" />
        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 117px; top: 69px; position: absolute; height: 27px; width:369px; " ToolTip="The Url to your Photo on the internet or youtube or onedrive"></asp:TextBox>
            <asp:Button ID="Button17" runat="server" Text="Video" Font-Names="Arial" Font-Size="9" ForeColor="#999999" style="z-index: 1; left: 55px; top: 122px; position: absolute" 
                    BackColor="Transparent" BorderStyle="None" ToolTip="Video" />
        <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 1; left: 117px; top: 114px; position: absolute; height: 27px; width:343px; " 
                 ToolTip="The Url to your Photo on the internet or youtube or onedrive"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" BackColor="Transparent" Style="position: absolute; height: 20px; width: 20px; top: 122px; left: 24px; z-index: 0;" Font-Names="Arial">֍</asp:Label>
            <asp:Label ID="Label3" runat="server" BackColor="Transparent" Style="position: absolute; height: 20px; width: 20px; top: 82px; left: 27px; z-index: 0;" Font-Names="Arial">௹</asp:Label>
        <asp:Label ID="Label5" runat="server" BackColor="Transparent" Style="position: absolute; height: 20px; width: 20px; top: 92px; left: 567px; z-index: 0;" Font-Names="Arial" Font-Size="8pt" 
                 ForeColor="#999999"></asp:Label>
        
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
             
               
             <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" style="border-style: None; z-index: 1; left: 8px; top: 0px; position: relative; direction: ltr; overflow-y: scroll; width: 649px; height: 1642px; background-color: White;" 
            BackColor="Transparent"  GridLines="None" PageSize="100000" ShowHeader="False" CellPadding="0" DataMember="DefaultView" PagerStyle-VerticalAlign="Top" RowStyle-VerticalAlign="Top" RowStyle-Height="300" CellSpacing="60" PagerStyle-Height="400">
            <Columns>
                 

                 <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                         
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("Dated") %>' style="position: relative; top:0px; left:90px;" Font-Size="9" ForeColor="Gray" Font-Names="arial"></asp:Label>
                        <iframe src='<%# new Uri(Eval("Imagefile").ToString()) %>'  width="50"  height="50"  style="position: relative; top:90px; left:50px;"></iframe>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>' style="position: relative; top:90px; left:55px;" Font-Names="arial" Font-Size="11" ForeColor="#0000CC"></asp:Label>
                         <asp:Label ID="Label3" runat="server" Text='<%# Bind("SurName") %>' style="position: relative; top:90px; left:100px;" Font-Size="11" Font-Names="arial" ForeColor="#0000CC"></asp:Label>
                        
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PostMatter") %>' style="position: relative; top:120px; left:0px;" ForeColor="#666666" Font-Size="13" Font-Names="arial"></asp:Label>

                         <iframe src='<%# new Uri(Eval("ImageId").ToString()) %>'  width="320"  height="240" style="position: relative; top:150px; left:0px;" ></iframe>
                         <iframe src='<%# new Uri(Eval("VideoId").ToString()) %>'  width="320"  height="179" style="position: relative; top:150px; left:300px;"></iframe>
                         
                       
                                    
                   </ItemTemplate>
                      </asp:TemplateField> 
                
                
                 
              </Columns>
            
                 <PagerStyle VerticalAlign="Top" Wrap="False" />
                 <RowStyle Height="410px" VerticalAlign="Top" />
            
        </asp:GridView>

           
                     
                
                     

             </asp:Panel>
        
         <asp:Panel ID="Panel6" runat="server" BackColor="Transparent" style="z-index: 1; left: 846px; top: 68px; position: absolute; width: 350px; height: 290px" Visible="True" Direction="LeftToRight" 
            BorderStyle="None" >

                 <!-- Begin BidVertiser code -->
<SCRIPT SRC="http://bdv.bidvertiser.com/BidVertiser.dbm?pid=684725&bid=1760519" TYPE="text/javascript"></SCRIPT>
<!-- End BidVertiser code --> 

              </asp:Panel>
                    


        <asp:Panel ID="PanelFriends" runat="server" BackColor="White" style="z-index: 1; left: 896px; top: 368px; position: absolute; width: 273px; height: 280px" Visible="True" Direction="LeftToRight" 
            BorderStyle="None" >
                  <asp:Label ID="Label111" runat="server" BackColor="Transparent" Style="position: absolute; height: 49px; width: 200px; top: 0px; left: 0px; z-index: 100;"></asp:Label>
             
                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" style="z-index: 1; left: 0px; top: 4px; position: absolute; width: 269px; " 
            BackColor="Transparent" Font-Size="10pt" ForeColor="White" GridLines="None" Height="35px" PageSize="1" ShowHeader="False" CellPadding="0" EnablePersistedSelection="True" SelectedRowStyle-BackColor="Transparent" SelectedRowStyle-ForeColor="Transparent">
            <Columns>
               
                <asp:TemplateField ConvertEmptyStringToNull="False" ShowHeader="False" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                         
                        
                         <iframe src='<%# new Uri(Eval("Imagefile").ToString()) %>'  width="30"  height="30" ></iframe>
                        <asp:Label ID="Label22" runat="server" Text='<%# Bind("UserName") %>' style="position: relative; top:0px; left:0px;" Font-Names="arial" Font-Size="8" ForeColor="#0000CC"></asp:Label>
                         <asp:Label ID="Labe33" runat="server" Text='<%# Bind("SurName") %>' style="position: relative; top:0px; left:40px;" Font-Size="8" Font-Names="arial" ForeColor="#0000CC"></asp:Label>
                         <asp:Button ID="Button20" runat="server" Text="Add Friend" Font-Names="Arial" Font-Size="9" ForeColor="#999999" style="z-index: 1; left: 100px; top: 0px; position: relative" 
                    BackColor="Transparent" BorderStyle="None" ToolTip="Add Friend" OnClick="Button20_Click" />
                    
                                    
                   </ItemTemplate>
                     
                </asp:TemplateField>

                
                

                
            </Columns>
            <RowStyle Height="5px" />
                        <SelectedRowStyle BackColor="Transparent" />
        </asp:GridView>    
                    
             </asp:Panel>
        
        
        
    </form>
</body>
</html>
