# 🔮 QueryCraft - AI-Powered SQL Generator

Natural Language to SQL conversion powered by **LangChain** and **Groq's Llama 3.3 70B**.

## ✨ Features

- 🤖 **AI-Powered SQL Generation** - Convert natural language to SQL using Groq's ultra-fast LLM
- 📤 **Dataset Upload** - Upload CSV, Excel, JSON, TSV files and automatically create database tables
- 📊 **Smart Visualizations** - Auto-generate charts from query results
- 🔄 **Real-time Query Execution** - Execute generated SQL and see results instantly
- 🎨 **Modern Web Interface** - Beautiful, responsive UI with drag-and-drop file uploads
- 🐳 **Docker Ready** - Full Docker and Docker Compose support

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose
- Groq API Key (get it from [console.groq.com](https://console.groq.com))

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/querycraft.git
cd querycraft
```

2. **Create `.env` file:**
```bash
cp .env.example .env
```

Edit `.env` and add your Groq API key:
```
GROQ_API_KEY=your_groq_api_key_here
```

3. **Start with Docker Compose:**
```bash
docker-compose up --build
```

4. **Access the application:**
- Web Interface: http://localhost:8000
- API Docs: http://localhost:8000/docs

## 📖 Usage

### Upload Dataset

1. Click the "Upload Dataset" tab
2. Drag and drop your CSV/Excel file or click to browse
3. Enter a table name
4. Click "Upload & Create Table"

### Query Your Data

1. Go to the "Query" tab
2. Type your question in natural language (e.g., "Show me total sales by region")
3. Click "Generate SQL"
4. View the generated SQL, results, and visualizations

### Example Questions

- "Show me all data from the sales table"
- "What are the top 5 products by revenue?"
- "Show me total sales by region"
- "What is the average sale amount?"
- "Show me sales from last month"

## 🔧 API Endpoints

### Core Endpoints

- `GET /` - Web interface
- `GET /health` - Health check
- `GET /api/schema` - Get database schema
- `GET /api/tables` - List all tables
- `POST /api/query` - Execute natural language query
- `POST /api/upload` - Upload dataset file
- `DELETE /api/table/{table_name}` - Delete table

### Query API Example

```bash
curl -X POST http://localhost:8000/api/query \
  -H "Content-Type: application/json" \
  -d '{
    "question": "Show me total sales by region",
    "execute": true,
    "visualize": true
  }'
```

### Upload API Example

```bash
curl -X POST http://localhost:8000/api/upload \
  -F "file=@sales_data.csv" \
  -F "table_name=sales"
```

## 🏗️ Architecture

```
querycraft/
├── app/
│   ├── __init__.py
│   ├── main.py                 # FastAPI application
│   ├── database.py             # Database operations
│   ├── langchain_service.py    # LangChain + Groq integration
│   ├── dataset_handler.py      # File upload handler
│   └── templates/
│       └── index.html          # Web interface
├── uploads/                    # Uploaded files
├── data/                       # Data storage
├── logs/                       # Application logs
├── docker-compose.yml
├── Dockerfile
├── requirements.txt
├── init_db.sql                # Sample database
└── .env                       # Configuration
```

## 🛠️ Configuration

### Environment Variables

```bash
# Database
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=querycraft_user
MYSQL_PASSWORD=querycraft_pass
MYSQL_DATABASE=querycraft_db

# Groq API
GROQ_API_KEY=your_key_here
GROQ_MODEL=llama-3.3-70b-versatile

# Application
DEBUG=True
MAX_UPLOAD_SIZE=10485760  # 10MB
```

### Supported File Formats

- CSV (`.csv`)
- Excel (`.xlsx`, `.xls`)
- JSON (`.json`)
- TSV (`.tsv`)

Max file size: 10MB

## 🔍 Development

### Run without Docker

1. **Install dependencies:**
```bash
pip install -r requirements.txt
```

2. **Set up MySQL database:**
```bash
mysql -u root -p < init_db.sql
```

3. **Run the application:**
```bash
uvicorn app.main:app --reload
```

### Run tests

```bash
pytest tests/
```

## 📊 Sample Data

The application comes with sample tables:
- `products` - Product catalog
- `customers` - Customer information
- `sales` - Sales transactions
- `orders` - Order details

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- **Groq** - Ultra-fast LLM inference
- **LangChain** - LLM application framework
- **FastAPI** - Modern web framework
- **Plotly** - Interactive visualizations

## 📧 Support

For issues and questions, please create an issue on GitHub.

---

Built with ❤️ using Groq's Llama 3.3 70B