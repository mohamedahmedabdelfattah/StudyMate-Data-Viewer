using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Drawing;

public partial class _Default : System.Web.UI.Page 
{
    //Global Variables
    string dblocation;
    
    string conString ;//= @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=dblocation";
    OleDbConnection conn = new OleDbConnection();
    
    void Query(string function)
    {
        OleDbCommand command = new OleDbCommand();

        conn.ConnectionString = conString;
        command.Connection = conn;

        OleDbParameter param_subject = new OleDbParameter("@Subject", OleDbType.VarChar);
        param_subject.Direction = ParameterDirection.Input;
        param_subject.Value = txtSubject.Text;
        command.Parameters.Add(param_subject);

        OleDbParameter param_year = new OleDbParameter("@Year", OleDbType.VarChar);
        param_year.Direction = ParameterDirection.Input;
        param_year.Value = txtYear.Text;
        command.Parameters.Add(param_year);

        OleDbParameter param_type = new OleDbParameter("@Type", OleDbType.VarChar);
        param_type.Direction = ParameterDirection.Input;
        param_type.Value = radioType.SelectedValue;
        command.Parameters.Add(param_type);

        OleDbParameter param_link = new OleDbParameter("@Link", OleDbType.VarChar);
        param_link.Direction = ParameterDirection.Input;
        param_link.Value = txtLink.Text;
        command.Parameters.Add(param_link);

        command.CommandText = function;

        conn.Open();
        command.ExecuteNonQuery();
        conn.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        dblocation = Request.PhysicalApplicationPath + "Data.mdb";
        conString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+dblocation;

        txtdb.Text = dblocation;
        DataView.Visible = false;
        btnclearview.Enabled = false;
    }

    protected void radioType_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtnote.Text = radioType.SelectedValue;

        if (radioType.SelectedIndex == 0)
            radioType.SelectedValue = "Lecture";
        else
            if(radioType.SelectedIndex == 1)
                radioType.SelectedValue = "Lab";
    }

    protected void btnfill_Click(object sender, EventArgs e)
    {
        if (btnRetrieve.Enabled == false)
        {
            DataView.Visible = true;
            btnclearview.Enabled = true;
        }

        txtSubject.Text = "Computer Network";
        txtYear.Text = "Fourth";
        txtLink.Text = "www.wikipedia.com/computer_network";
        radioType.SelectedValue = "Lecture";
        txtnote.Text = "";
    }

    protected void DataView_Sorted(object sender, EventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }

    protected void DataView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;
    }
    
    protected void btnClear_Click(object sender, EventArgs e)
    {
        if (btnRetrieve.Enabled == false)
        {
            DataView.Visible = true;
            btnclearview.Enabled = true;
        }

        txtnote.Text = "";
        txtLink.Text = "";
        txtSubject.Text = "";
        txtYear.Text = "";
        radioType.ClearSelection();
    }
    
    protected void btnclearview_Click(object sender, EventArgs e)
    {
        DataView.Dispose();
        DataView.Visible = false;
        btnRetrieve.Enabled = true;
        btnclearview.Enabled = false;
    }

    protected void btnRetrieve_Click(object sender, EventArgs e)
    {
        DataView.Visible = true;
        btnRetrieve.Enabled = false;
        btnclearview.Enabled = true;

        //To Retrieve Data Manualy
        /*
        string conString = @"Provider=Microsoft.JET.OLEDB.4.0;" + @"data source=" + dblocation;
        OleDbConnection conn = new OleDbConnection(conString);
        conn.Open();
        DataSet ds = new DataSet();
        OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT * FROM List", conn);
        adapter.Fill(ds);
        conn.Close();
        DataView.DataSource = ds;
        DataView.DataBind();
        */
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnRetrieve.Enabled == false)
        {
            DataView.Visible = true;
            btnclearview.Enabled = true;
        }

        dblocation = Request.PhysicalApplicationPath + "Data.mdb";

        if (txtSubject.Text == "" || txtYear.Text == "" || txtLink.Text == "" || radioType.SelectedValue == "")
        {
            txtnote.ForeColor = System.Drawing.Color.Red;
            txtnote.Text = "All Fields Must Be Filled";
        }
        else
        {
            Query("INSERT INTO [List] ([Subject], [Year], [Type], [Link]) VALUES (@Subject,@Year,@Type,@Link);");
            
            DataView.Visible = true;
            btnRetrieve.Enabled = false;
            btnclearview.Enabled = true;

            txtnote.ForeColor = System.Drawing.Color.Lime;
            txtnote.Text = "Operation Completed Successfully";
        }
    }
}