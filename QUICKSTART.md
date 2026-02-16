# 🚀 QueryCraft Quick Start Guide

Get up and running in 5 minutes!

## Step 1: Get Groq API Key

1. Go to [console.groq.com](https://console.groq.com)
2. Sign up or log in
3. Create an API key
4. Copy your API key

## Step 2: Setup

```bash
# Clone the repository
git clone https://github.com/yourusername/querycraft.git
cd querycraft

# Create .env file
cp .env.example .env

# Edit .env and add your Groq API key
nano .env  # or use your favorite editor
```

Add this line to `.env`:
```
GROQ_API_KEY=gsk_your_actual_key_here
```

## Step 3: Start the Application

### Option A: Using Docker (Recommended)

```bash
docker-compose up --build
```

### Option B: Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Start MySQL (if not using Docker)
# Make sure MySQL is running on localhost:3306

# Initialize database
mysql -u root -p < init_db.sql

# Start the application
uvicorn app.main:app --reload
```

## Step 4: Access the Application

Open your browser and go to:
- **Web Interface**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs

## Step 5: Try It Out!

### Upload a Dataset

1. Click **"Upload Dataset"** tab
2. Drag and drop a CSV or Excel file
3. Enter a table name (e.g., "my_sales")
4. Click **"Upload & Create Table"**

### Query Your Data

1. Go to **"Query"** tab
2. Ask a question:
   - "Show me all data from my_sales"
   - "What are the top 5 items by value?"
   - "Show me total sales by category"
3. Click **"Generate SQL"**
4. View results and visualizations!

## 🎯 Example Dataset

Try uploading this sample CSV:

```csv
product,category,price,quantity,region
Laptop,Electronics,1200,5,West
Mouse,Electronics,25,20,East
Desk,Furniture,350,3,North
Chair,Furniture,200,8,South
Monitor,Electronics,300,10,West
```

Save as `sales.csv` and upload it!

## 🔧 Troubleshooting

### "Database connection failed"
- Make sure MySQL is running
- Check your database credentials in `.env`

### "Groq service not initialized"
- Verify your GROQ_API_KEY in `.env`
- Make sure the API key is valid

### "Port 8000 already in use"
```bash
# Change port in docker-compose.yml or use:
uvicorn app.main:app --port 8001
```

## 📚 Next Steps

- Read the full [README.md](README.md)
- Check out [API documentation](http://localhost:8000/docs)
- Try the example queries
- Upload your own datasets!

## 💡 Tips

1. **Table names**: Use lowercase letters, numbers, and underscores only
2. **File size**: Keep files under 10MB for best performance
3. **Questions**: Be specific - mention table names and columns when possible
4. **Visualizations**: Work best with numeric data and categories

## 🆘 Need Help?

- Check the logs in `logs/` directory
- Review error messages in the web interface
- Create an issue on GitHub

Happy querying! 🎉