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
    public partial class Parent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = database.GetCollection<BsonDocument>("parentinfo");
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
            parentGridView.DataSource = dataTable;
            parentGridView.DataBind();
        }

        protected void submitButton2_Click(object sender, EventArgs e)
        {
            var connectionString = "mongodb://localhost:27017";
            var client = new MongoClient(connectionString);
            IMongoDatabase db = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = db.GetCollection<BsonDocument>("parentinfo");
            var insertdata = new BsonDocument
            {
                { "Parent ID", parentIDNumTextbox.Text},
                { "First Name", parentFNameTextbox.Text},
                { "Last Name", parentLNameTextbox.Text},
                { "Age", parentAgeTextbox.Text},
                { "Contact Number", parentContactNumTextbox.Text}
            };
            collection.InsertOne(insertdata);
            lblMsg2.Text = "Data Inserted Into Database.";
            lblMsg2.ForeColor = System.Drawing.Color.Green;
        }
    }
}