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
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Connect to MongoDB 
            var client = new MongoClient("mongodb://localhost:27017");

            // Get the database
            var database = client.GetDatabase("InsertRetrieveData_UniCash");

            // Get the collection named "userinfo" from the database
            var collection = database.GetCollection<BsonDocument>("userinfo");

            // Retrieve all documents from the collection
            var documents = collection.Find(new BsonDocument()).ToList();

            // Create a new DataTable to hold the retrieved data
            var dataTable = new DataTable();

            // Iterate through each document
            foreach (var document in documents)
            {
                // Create a new row in the DataTable
                var row = dataTable.NewRow();

                // Iterate through each element in the document
                foreach (var element in document.Elements)
                {
                    // Check if the column already exists in the DataTable, if not, add
                    if (!dataTable.Columns.Contains(element.Name))
                    {
                        dataTable.Columns.Add(element.Name);
                    }
                    // Set the value of the row for the corresponding column
                    row[element.Name] = element.Value.ToString();
                }
                // Add row to the table
                dataTable.Rows.Add(row);
            }
            studentGridView.DataSource = dataTable;
            studentGridView.DataBind();
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            var connectionString = "mongodb://localhost:27017";
            var client = new MongoClient(connectionString);
            IMongoDatabase db = client.GetDatabase("InsertRetrieveData_UniCash");
            var collection = db.GetCollection<BsonDocument>("userinfo");

            // Create a new BsonDocument to hold the data to be inserted
            var insertdata = new BsonDocument
            {
                // Field-values 
                { "Student ID", studentIDNumTextbox.Text },
                { "School ID", schoolIDNumTextbox.Text},
                { "Parent ID", parentIDNumTextbox.Text},
                { "First Name", firstNameTextbox.Text},
                { "Last Name", lastNameTextbox.Text},
                { "Age", ageTextbox.Text},
                { "Contact Number", contactNumTextbox.Text}
            };

            // Insert the document into the collection
            collection.InsertOne(insertdata);

            // Display a success message
            lblMsg.Text = "Data Inserted Into Database.";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
    }
}