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
    public partial class School : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = database.GetCollection<BsonDocument>("schoolinfo");
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
            schoolGridView.DataSource = dataTable;
            schoolGridView.DataBind();
        }

        protected void submitButton1_Click(object sender, EventArgs e)
        {
            var connectionString = "mongodb://localhost:27017";
            var client = new MongoClient(connectionString);
            IMongoDatabase db = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = db.GetCollection<BsonDocument>("schoolinfo");
            var insertdata = new BsonDocument
            {
                { "School ID", schoolIDNumTextbox.Text},
                { "School Name", schoolNameTextbox.Text},
                { "School Email", schoolEmailTextbox.Text},
                { "School Contact Number", schoolContactNumTextbox.Text},
                { "School Address", schoolAddressTextbox.Text}
            };
            collection.InsertOne(insertdata);
            lblMsg1.Text = "Data Inserted Into Database.";
            lblMsg1.ForeColor = System.Drawing.Color.Green;
        }
    }
}