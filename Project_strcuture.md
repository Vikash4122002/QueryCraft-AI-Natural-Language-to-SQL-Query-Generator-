# QueryCraft Project Structure

## 📁 Directory Structure

```
querycraft/
├── app/                        # Application code
│   ├── __init__.py            # Package initialization
│   ├── main.py                # FastAPI application & routes
│   ├── database.py            # Database operations & utilities
│   ├── langchain_service.py   # LangChain + Groq integration
│   ├── dataset_handler.py     # File upload & processing
│   └── templates/
│       └── index.html         # Web interface
│
├── uploads/                    # User uploaded files
│   └── .gitkeep
│
├── data/                       # Data storage
│   └── .gitkeep
│
├── logs/                       # Application logs
│   └── .gitkeep
│
├── docker-compose.yml          # Docker Compose configuration
├── Dockerfile                  # Docker build instructions
├── requirements.txt            # Python dependencies
├── init_db.sql                # Database initialization
├── .env.example               # Environment template
├── .gitignore                 # Git ignore rules
├── start.sh                   # Startup script
├── sample_sales.csv           # Sample dataset
├── README.md                  # Main documentation
├── QUICKSTART.md              # Quick start guide
└── PROJECT_STRUCTURE.md       # This file
```

## 🔧 Core Components

### 1. **main.py** - FastAPI Application
- HTTP endpoints and routing
- Request/response handling
- File upload management
- Error handling
- CORS middleware

**Key Endpoints:**
- `GET /` - Web interface
- `POST /api/query` - Natural language to SQL
- `POST /api/upload` - Dataset upload
- `GET /api/tables` - List database tables
- `GET /api/schema` - Database schema
- `DELETE /api/table/{name}` - Delete table

### 2. **database.py** - Database Layer
- MySQL connection management
- Query execution
- Schema introspection
- DataFrame to table conversion
- Connection pooling

**Key Functions:**
- `get_db_connection()` - Create DB connection
- `execute_query()` - Execute SQL safely
- `get_database_schema()` - Get schema info
- `create_table_from_dataframe()` - Create table from pandas DF

### 3. **langchain_service.py** - AI Integration
- Groq LLM initialization
- SQL generation from natural language
- Query explanation
- Visualization creation
- Memory management

**Key Features:**
- LangChain SQL agent
- Custom tools for schema access
- Smart chart generation
- SQL validation and cleaning

### 4. **dataset_handler.py** - File Processing
- File validation
- Multi-format support (CSV, Excel, JSON, TSV)
- Encoding detection
- Data cleaning
- Preview generation

**Supported Formats:**
- CSV (with auto-delimiter detection)
- Excel (.xlsx, .xls)
- JSON
- TSV

### 5. **index.html** - Web Interface
- Modern, responsive UI
- Drag-and-drop file upload
- Real-time query execution
- Interactive visualizations
- Tab-based navigation

**Features:**
- Query tab for natural language queries
- Upload tab for dataset management
- Tables tab for database overview
- Real-time status indicators

## 🐳 Docker Configuration

### docker-compose.yml
Services:
1. **mysql** - MySQL 8.0 database
2. **api** - FastAPI application
3. **redis** - Caching (optional)

Volumes:
- `mysql_data` - Persistent database storage
- `redis_data` - Redis persistence

Networks:
- `querycraft_network` - Bridge network for services

### Dockerfile
- Base: Python 3.11-slim
- System dependencies: gcc, mysql-dev
- Application port: 8000
- Health checks enabled

## 🔐 Environment Variables

### Database Configuration
```
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=querycraft_user
MYSQL_PASSWORD=querycraft_pass
MYSQL_DATABASE=querycraft_db
```

### Groq API
```
GROQ_API_KEY=your_key_here
GROQ_MODEL=llama-3.3-70b-versatile
```

### Application Settings
```
DEBUG=True
MAX_UPLOAD_SIZE=10485760  # 10MB
UPLOAD_DIR=./uploads
DATA_DIR=./data
```

## 📊 Database Schema

### Sample Tables (from init_db.sql)

1. **products**
   - product_id (PK)
   - product_name
   - category
   - price
   - stock_quantity
   - supplier

2. **customers**
   - customer_id (PK)
   - customer_name
   - email
   - region
   - city
   - country

3. **sales**
   - sale_id (PK)
   - customer_id (FK)
   - product_id (FK)
   - sales_person
   - region
   - quantity
   - total_amount
   - sale_date

4. **orders**
   - order_id (PK)
   - customer_id (FK)
   - order_date
   - total_amount
   - status

## 🔄 Data Flow

### Query Processing Flow
```
User Question
    ↓
FastAPI Endpoint (/api/query)
    ↓
LangChain Service
    ↓
Groq LLM (SQL Generation)
    ↓
Database Execution
    ↓
Results + Visualization
    ↓
Web Interface
```

### Upload Processing Flow
```
File Upload
    ↓
FastAPI Endpoint (/api/upload)
    ↓
Dataset Handler (Validation)
    ↓
File Reading (CSV/Excel/JSON)
    ↓
Data Cleaning
    ↓
DataFrame Creation
    ↓
Database Table Creation
    ↓
Success Response
```

## 🛠️ Technology Stack

### Backend
- **FastAPI** - Modern web framework
- **LangChain** - LLM orchestration
- **Groq** - Ultra-fast LLM inference
- **MySQL** - Relational database
- **Pandas** - Data processing
- **Plotly** - Visualizations

### Frontend
- **HTML5** - Structure
- **CSS3** - Styling
- **JavaScript** - Interactivity
- **Plotly.js** - Charts

### Infrastructure
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration
- **Redis** - Caching (optional)

## 📝 Code Style & Standards

### Python
- PEP 8 compliant
- Type hints where applicable
- Docstrings for functions
- Error handling with try-except
- Logging with loguru

### API Design
- RESTful endpoints
- JSON request/response
- Proper HTTP status codes
- CORS enabled
- Request validation with Pydantic

### Security
- SQL injection prevention
- File upload validation
- Size limits enforced
- SELECT-only queries
- Input sanitization

## 🧪 Testing

### Manual Testing
1. Health check: `curl http://localhost:8000/health`
2. Query test: Use web interface
3. Upload test: Upload sample_sales.csv
4. API test: Check /docs endpoint

### Automated Testing (Future)
- Unit tests with pytest
- Integration tests
- API endpoint tests
- Database tests

## 📚 Additional Resources

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [LangChain Documentation](https://python.langchain.com/)
- [Groq Documentation](https://console.groq.com/docs)
- [Docker Documentation](https://docs.docker.com/)

## 🔄 Version History

- **v2.0.0** - Full rewrite with LangChain + Groq
- **v1.0.0** - Initial release

## 📞 Support & Contributing

For issues, questions, or contributions:
1. Check existing documentation
2. Review logs in `logs/` directory
3. Create GitHub issue
4. Submit pull request

---

Last Updated: February 2024