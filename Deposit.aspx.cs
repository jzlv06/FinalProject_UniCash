using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Collections.ObjectModel;
using System.Data;
using System.Web.DynamicData;

namespace FinalProject_UniCash
{
    public partial class Deposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = database.GetCollection<BsonDocument>("depositinfo");
            var documents = collection.Find(new BsonDocument()).ToList();
            var dataTable = new DataTable();
            foreach (var document in documents)
            {
                var row = dataTable.NewRow();
                foreach (var element in document.Elements)
                {
                    if (!dataTable.Columns.Contains(element.Name))
                    {
                        dataTable.Columns.Add(element.Name);
                    }
                    row[element.Name] = element.Value.ToString();
                }
                dataTable.Rows.Add(row);
            }
            depositGridView.DataSource = dataTable;
            depositGridView.DataBind();
        }

        protected void submitButton6_Click(object sender, EventArgs e)
        {
            var connectionString = "mongodb://localhost:27017";
            var client = new MongoClient(connectionString);
            IMongoDatabase db = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = db.GetCollection<BsonDocument>("depositinfo");
            var insertdata = new BsonDocument
            {
                { "Deposit ID", depositIDNumTextbox.Text},
                { "Parent ID", parentIDNumTextbox.Text},
                { "Student ID", studentIDNumTextbox.Text},
                { "Transaction ID", transactionIDNumTextbox.Text},
                { "Gateway ID", gatewayIDNumTextbox.Text},
                { "Deposit Amount", depositAmountTextbox.Text},
                { "Deposit Status", depositStatusTextbox.Text}
            };
            collection.InsertOne(insertdata);
            lblMsg6.Text = "Data Inserted Into Database.";
            lblMsg6.ForeColor = System.Drawing.Color.Green;
        }
    }
}