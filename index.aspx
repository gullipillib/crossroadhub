<%@ Page Language="C#" AutoEventWireup="true" Debug="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>



<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {

            
        }
        
    }



    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton1.Checked = false;
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton2.Checked = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlDataSource1.SelectCommand = "SELECT UserId, Email, Password FROM UserTable where Email = '" + TextBox1.Text + "'";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();

        if (dt.Rows.Count != 0)
        {

            email = dt.Rows[0].Field<string>("Email"); //usethis to get field value
            password = dt.Rows[0].Field<string>("Password"); //usethis to get field value
            Session["usercountervalue"] = dt.Rows[0].Field<string>("UserId"); //usethis to get field value
            
            if (email == TextBox1.Text && password == TextBox2.Text)
            {
                Response.Redirect("actual.aspx");
            }
            else
            {
                Label17.Text = "Check your LogIn details. Request for passwords is through email.";
            }
        }
        else 
        {
            Label17.Text = "Check your LogIn details. Request for passwords is through email.";
        }
        
    }

    string email = "";
    string password = "";
    string usercountervalue = "";
    string UserId = "";

    protected void Button2_Click(object sender, EventArgs e)
    {

        SqlDataSource2.SelectCommand = "SELECT CounterValue FROM UserCounterTable";
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();

        if (dt.Rows.Count == 0)
        {
            usercountervalue = "1";
        }
        else if (dt.Rows.Count != 0)
        {
            SqlDataSource2.SelectCommand = "SELECT CounterValue FROM UserCounterTable";
            dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            dt = new DataTable();
            dt = dv.ToTable();
            usercountervalue = dt.Rows[0].Field<string>("CounterValue"); //usethis to get field value
            usercountervalue = Convert.ToString(Convert.ToInt32(usercountervalue) + 1);
            Session["usercountervalue"] = usercountervalue;
        }

        
        if (TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox6.Text != "" && TextBox5.Text == TextBox6.Text && TextBox7.Text != "" && TextBox8.Text != "" && RadioButton1.Checked == true || RadioButton2.Checked == true)
        {

            SqlDataSource1.SelectCommand = "SELECT Email FROM UserTable where Email = '" + TextBox5.Text + "'";
            dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            dt = new DataTable();
            dt = dv.ToTable();
            if (dt.Rows.Count != 0)
            {
                email = dt.Rows[0].Field<string>("Email"); //usethis to get field value
            }
            if (dt.Rows.Count == 0)
            {
                SqlDataSource1.InsertCommand = "INSERT INTO UserTable(UserId, UserName, SurName, Email, Password, Verified, Active, Address, Phone, LoggedIn, Friends, Imagefile,BirthDay) Values ('" + usercountervalue + "', '" + TextBox3.Text + "',  '" + TextBox4.Text + "',  '" + TextBox5.Text + "',   '" + TextBox7.Text + "', 'no', 'yes', 'no' , ' ' , ' ' ,  'yes', ' ',    '" + TextBox8.Text + "' )";
                SqlDataSource1.Insert();
                Label17.Text = "Account Created Successfully. LogIn Now";
                SqlDataSource2.InsertCommand = "INSERT INTO UserCounterTable(CounterValue) Values ('" + usercountervalue + "')";
                SqlDataSource2.Insert();
            }
            else 
            {
                Label17.Text = "Email is already registered";
            }
            
        }
        else
        {
            Label17.Text = "check your information";
        }
    }

    
</script>



<html>
<head>
    <title>Cross Road Hub</title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 766px; top: 39px; position: absolute; width: 134px; height: 27px; right: 316px;"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 977px; top: 39px; position: absolute; width: 134px; height: 26px;" TextMode="Password"></asp:TextBox>

        <asp:Label ID="Label5" runat="server" Font-Size="10pt" ForeColor="White" Style="z-index: 1; left: 768px; top: 21px; position: absolute; width: 44px" Text="Email"></asp:Label>
        <asp:Label ID="Label6" runat="server" Font-Size="10pt" ForeColor="White" Style="z-index: 1; left: 980px; top: 21px; position: absolute; width: 109px" Text="Password"></asp:Label>

        <asp:Label ID="Label1" runat="server" BackColor="#000099" Style="position: absolute; height: 91px; width: 1459px; top: 0px; left: 0px; z-index: -1;"></asp:Label>
        <asp:Label ID="Label2" runat="server" BackColor="Transparent" Style="z-index: 1; position: absolute; height: 58px; width: 428px; top: 18px; left: 82px; margin-bottom: 0px; right: 714px;"
            ForeColor="White" Font-Bold="True" Font-Names="Highlight LET" Font-Size="40pt">Cross Road Hub</asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="20pt" Style="top: 103px; left: 876px; position: absolute; height: 36px; width: 242px" Text="Create an account"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Names="Arial" Font-Size="15pt" Style="top: 146px; left: 880px; position: absolute; height: 36px; width: 103px" Text="It's free"></asp:Label>
        <asp:Label ID="Label7" runat="server" BackColor="#99CCFF" Style="height: 497px; width: 1459px;"></asp:Label>
        <asp:Label ID="Label16" runat="server" Font-Names="Arial" Font-Size="24pt" Style="top: 133px; left: 56px; position: absolute; height: 70px; width: 242px" Text="Connecting all Truth Seekers"></asp:Label>
        <asp:Button ID="Button1" runat="server" Style="cursor: pointer; top: 42px; left: 1132px; position: absolute; height: 26px; width: 56px" Text="Log In" BackColor="#0066FF" ForeColor="White" 
            OnClick="Button1_Click" />
        <asp:Label ID="Label17" runat="server" Font-Names="Arial" Font-Size="9pt" Style="top: 138px; left: 970px; position: absolute; height: 23px; width: 239px" ForeColor="#339933"></asp:Label>

        <asp:RadioButton ID="RadioButton1" runat="server" Style="z-index: 1; left: 792px; top: 512px; position: absolute; width: 55px; right: 381px;" Text="Male"
            OnCheckedChanged="RadioButton1_CheckedChanged" />


        <asp:Label ID="Label10" runat="server" BackColor="#99CCFF" Style="position: absolute; height: 488px; width: 1459px; top: 95px; left: -23px; z-index: -1;"></asp:Label>

        <asp:Image ID="Image2" runat="server" Style="top: 226px; left: 10px; position: absolute; width: 724px; height: 300px" ImageUrl="images/logo.jpg" />
        <asp:Label ID="Label9" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 775px; top: 174px; position: absolute; width: 109px" Text="Name"></asp:Label>
        <asp:Label ID="Label11" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 1038px; top: 174px; position: absolute; width: 109px" Text="Surname"></asp:Label>
        <asp:Label ID="Label12" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 775px; top: 258px; position: absolute; width: 109px" Text="Email"></asp:Label>
        <asp:Label ID="Label13" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 770px; top: 328px; position: absolute; width: 109px" Text="Re-enter Email"></asp:Label>
        <asp:Label ID="Label14" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 771px; top: 395px; position: absolute; width: 109px" Text="New password"></asp:Label>
        <asp:Label ID="Label15" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 762px; top: 465px; position: absolute; width: 84px; height: 29px; margin-bottom: 0px;"
            Text="Birthday(dd/mm/yyyy)"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 766px; top: 199px; position: absolute; height: 27px; right: 263px; width: 187px;"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" Style="z-index: 1; left: 1036px; top: 199px; position: absolute; height: 27px; right: 46px;"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" Style="z-index: 1; left: 766px; top: 279px; position: absolute; width: 134px; height: 27px; right: 316px;"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" Style="z-index: 1; left: 766px; top: 349px; position: absolute; width: 134px; height: 27px; right: 316px;"></asp:TextBox>
        <asp:TextBox ID="TextBox7" runat="server" Style="z-index: 1; left: 766px; top: 415px; position: absolute; width: 134px; height: 27px; right: 316px;"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" Style="z-index: 1; left: 856px; top: 465px; position: absolute; width: 134px; height: 27px; right: 96px;"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="7pt" Style="top: 546px; left: 700px; position: absolute; height: 36px;"
            Text="By clicking Create an account, you agree to our Terms and that you have read our Data Policy, including our Cookie Use"></asp:Label>
        <asp:RadioButton ID="RadioButton2" runat="server" OnCheckedChanged="RadioButton2_CheckedChanged" Style="z-index: 1; left: 946px; top: 512px; position: absolute; width: 82px;" Text="Female" />
        <asp:Button ID="Button2" runat="server" Style="cursor: pointer; top: 458px; left: 1012px; position: absolute; height: 50px; width: 200px" Text="Create Account" BackColor="#009933" ForeColor="White"
            Font-Size="12pt" OnClick="Button2_Click" />

        <asp:Label ID="Label18" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 0px; top: 587px; position: absolute; width: 238px" Text="Cross Road Hub @ 2016"></asp:Label>
        <asp:Label ID="Label19" runat="server" Font-Size="10pt" ForeColor="Black" Style="z-index: 1; left: 960px; top: 590px; position: absolute; width: 270px" Text="Contact : crossroadhub@hotmail.com"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\crossroadhub.mdf;Integrated Security=True;Connect Timeout=30"
            SelectCommand="SELECT * FROM [UserTable]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\crossroadhub.mdf;Integrated Security=True;Connect Timeout=30"
            SelectCommand="SELECT * FROM [UserCounterTable]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

    </form>
</body>
</html>
