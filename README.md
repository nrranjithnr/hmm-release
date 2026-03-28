# HMM - CLI Tool Manager

> **Semantic CLI tool management with natural language search**

A full-stack application that helps you manage, search, and organize CLI tools using natural language queries. Built with FastAPI, React, and ChromaDB vector search.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
![Python 3.11+](https://img.shields.io/badge/Python-3.11+-green.svg)
![React 18](https://img.shields.io/badge/React-18.2-blue.svg)

## ✨ Features

- 🔍 **Semantic Search** - Find commands using natural language ("list all pods" → `kubectl get pods`)
- 🎯 **Smart Tool Management** - Organize CLI tools with tags, icons, and metadata
- 📦 **Standalone Binary** - Single executable with embedded UI (~220MB)
- 🚀 **Auto Port Detection** - Automatically finds available ports
- 💾 **Asset Management** - Upload and store scripts, binaries, and configs
- 🎨 **Modern UI** - Terminal-inspired design with React + TypeScript

## 🏗️ Architecture

```
┌──────────────────────────────────────────────────────────────┐
│                        HMM Application                        │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌─────────────┐         ┌──────────────┐                    │
│  │   React UI  │◄────────┤   FastAPI    │                    │
│  │ TypeScript  │  HTTP   │   Backend    │                    │
│  │   + Vite    │ REST API│              │                    │
│  └─────────────┘         └───────┬──────┘                    │
│                                  │                            │
│                         ┌────────┴────────┐                  │
│                         │                 │                   │
│                  ┌──────▼──────┐  ┌──────▼────────┐          │
│                  │   SQLite    │  │   ChromaDB    │          │
│                  │  Database   │  │ Vector Search │          │
│                  │             │  │  Embeddings   │          │
│                  └─────────────┘  └───────────────┘          │
│                                                               │
│  Data Storage: ~/.hmm/                                         │
│  ├── db/hmm.db           (SQLite)                            │
│  ├── chroma/             (Vector embeddings)                 │
│  └── tools/              (Uploaded assets)                   │
└──────────────────────────────────────────────────────────────┘
```

## 🚀 Quick Start

### Option 1: Use Standalone Binary (Recommended)

```bash
# Download the latest release
# Or build it yourself:
make build

# Run the binary
./hmm-api/dist/hmm

# With custom port
./hmm-api/dist/hmm --port 9000

# Allow external access
./hmm-api/dist/hmm --host 0.0.0.0
```

**Binary includes:**

- ✅ Embedded React UI
- ✅ FastAPI server
- ✅ ChromaDB vector search
- ✅ All dependencies (~220MB)
- ✅ No Python installation required

### Option 2: Development Mode

```bash
# Install all dependencies
make install

# Start both API and UI dev servers
make dev
# API: http://127.0.0.1:8000
# UI:  http://127.0.0.1:5173
```

## 📁 Project Structure

```
hmm/
├── hmm-api/                # Backend (FastAPI + ChromaDB)
│   ├── app/                # FastAPI app
│   ├── alembic/            # Database migrations
│   ├── main.py             # Entry point
│   ├── hmm.spec            # PyInstaller spec
│   └── requirements.txt
├── hmm-ui/                 # Frontend (React + TypeScript)
│   ├── src/
│   ├── package.json
│   └── vite.config.ts
├── hmm-tui/                # Rust CLI/TUI + API client + TUI library
│   ├── hmm-cli/
│   ├── hmm-api-client/
│   └── hmm-tui-lib/
└── Makefile                # Root build commands
```

## 💻 Development

### Prerequisites

- **Python 3.11+** (for API)
- **Node.js 18+** (for UI)
- **Make** (for build commands)

### Full Stack Development

```bash
# Install everything
make install

# Start both servers
make dev
# API: http://127.0.0.1:8000 (auto-opens in browser)
# UI:  http://127.0.0.1:5173 (Vite dev server with HMR)

# Use custom ports
make dev API_PORT=8080 UI_PORT=3001

# Run tests
make test
```

### API Development

```bash
cd hmm-api

# Create virtual environment and install
make install

# Run API server (with auto-reload)
make run

# Run database migrations
make migrate

# Create new migration
make migrate-create

# Run tests
make test
```

### UI Development

```bash
cd hmm-ui

# Install dependencies
make install

# Start dev server (with hot reload)
make dev

# Build for production
make build

# Run a production build
npm run build
```

### Port Configuration

Ports automatically increment if already in use:

- **API default:** 8000 → 8001 → 8002...
- **UI dev default:** 5173 (Vite default)

Configure via:

- Environment variables: `API_PORT=8080 UI_PORT=3001 make dev`
- Command-line args: `./hmm-api/dist/hmm --port 9000 --host 0.0.0.0`
- Makefile: `make dev API_PORT=8080`

## 🔨 Building

### Create Standalone Binary

```bash
# Build everything (UI + API binary)
make build

# This will:
# 1. Build React UI (hmm-ui/dist/)
# 2. Bundle with PyInstaller
# 3. Create hmm-api/dist/hmm executable
```

**Binary includes:**

- FastAPI server with auto port detection
- Embedded React UI (served from memory)
- ChromaDB vector search engine
- SQLite database engine
- All Python dependencies (~220MB total)

**Run the binary:**

```bash
./hmm-api/dist/hmm

# Custom configuration
./hmm-api/dist/hmm --port 9000 --host 0.0.0.0

# See all options
./hmm-api/dist/hmm --help
```

**Binary features:**

- ✅ Single-file deployment
- ✅ No Python installation required

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## 🧭 Support

See [SUPPORT.md](SUPPORT.md).

## 🫱🏽‍🫲🏻 Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## 🔒 Security

See [SECURITY.md](SECURITY.md).

- ✅ Automatic port detection
- ✅ Opens browser automatically
- ✅ Fast startup (~5-10 seconds)

### Separate Builds

```bash
# Build only UI
make ui-build

# Build only API binary (requires UI already built)
make api-build
```

## 📊 Data Storage

All application data is stored in `~/.hmm/`:

```
~/.hmm/
├── db/
│   └── hmm.db              # SQLite database (tools, assets, tags)
├── chroma/                 # ChromaDB vector storage
│   ├── chroma.sqlite3      # ChromaDB metadata
│   └── <collection>/       # Embedding vectors
└── tools/                  # Uploaded assets
    ├── kubectl/
    │   ├── kubectl-darwin  # Binary for macOS
    │   ├── kubectl-linux   # Binary for Linux
    │   └── config.yaml     # Config files
    └── docker/
        └── cleanup.sh      # Scripts
```

**Database schema:**

- `tools` - Tool metadata, OpenCLI specs, icons
- `assets` - File metadata for uploaded binaries/scripts
- `tags` - Many-to-many relationship with tools

## 🔍 API Usage

### Semantic Search

Search for commands using natural language:

```bash
# Search for commands
curl "http://localhost:8000/api/search?q=list%20all%20kubernetes%20pods"

# Response
{
  "query": "list all kubernetes pods",
  "matches": [
    {
      "tool_name": "kubectl",
      "command_path": "/get/pods",
      "summary": "List pods in namespace",
      "score": 0.92,
      "examples": ["kubectl get pods", "kubectl get pods -n kube-system"]
    }
  ],
  "total": 1
}
```

### Tool Management

```bash
# List all tools
GET /api/tools

# Get specific tool
GET /api/tools/{id}

# Create tool
POST /api/tools
{
  "name": "kubectl",
  "display_name": "Kubernetes CLI",
  "icon": "⎈",
  "opencli_spec": {...}
}

# Update tool
PUT /api/tools/{id}

# Delete tool
DELETE /api/tools/{id}
```

### Asset Management

```bash
# Upload asset
POST /api/assets/upload/{tool_id}
Content-Type: multipart/form-data
file: <binary>

# List tool assets
GET /api/assets/{tool_id}

# Download asset
GET /api/assets/download/{asset_id}

# Delete asset
DELETE /api/assets/{asset_id}
```

**Interactive API Docs:**

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## 🛠️ Technology Stack

### Backend

- **[FastAPI](https://fastapi.tiangolo.com/)** - Modern async API framework
- **[SQLAlchemy](https://www.sqlalchemy.org/)** - ORM with async support
- **[ChromaDB](https://www.trychroma.com/)** - Vector database for semantic search
- **[LangChain](https://www.langchain.com/)** - LLM framework (embeddings)
- **[HuggingFace](https://huggingface.co/)** - `all-MiniLM-L6-v2` sentence transformer
- **[Alembic](https://alembic.sqlalchemy.org/)** - Database migration tool
- **[PyInstaller](https://pyinstaller.org/)** - Binary packaging
- **[Uvicorn](https://www.uvicorn.org/)** - ASGI server

### Frontend

- **[React 18](https://react.dev/)** - UI library
- **[TypeScript](https://www.typescriptlang.org/)** - Type-safe JavaScript
- **[Vite](https://vitejs.dev/)** - Build tool & dev server
- **[TailwindCSS](https://tailwindcss.com/)** - Utility-first CSS
- **[React Router](https://reactrouter.com/)** - Client-side routing
- **[React Error Boundary](https://www.npmjs.com/package/react-error-boundary)** - Error handling

### Database & Storage

- **SQLite** - Relational database for tool metadata
- **ChromaDB** - Vector storage for semantic search
- **File System** - Binary/script storage in `~/.hmm/tools/`

## 🎯 Use Cases

1. **CLI Tool Discovery**
   - Search tools by natural language description
   - Find commands you don't remember the syntax for
   - Discover tools you didn't know existed

2. **Command Cheat Sheets**
   - Store frequently used commands with examples
   - Organize by tags and categories
   - Quick access to complex command syntax

3. **Binary Distribution**
   - Upload platform-specific binaries
   - Manage multiple versions
   - Share tools with your team

4. **Script Library**
   - Store useful shell scripts
   - Organize maintenance scripts
   - Quick execution from UI

## 🏃 Makefile Commands

### Root Directory

```bash
make help       # Show all available commands
make install    # Install all dependencies (API + UI)
make dev        # Start both API and UI dev servers
make build      # Build standalone binary
make test       # Run all tests
make clean      # Clean build artifacts
```

### API Directory (cd hmm-api/)

```bash
make install         # Create venv and install dependencies
make run             # Start FastAPI server
make test            # Run pytest
make migrate         # Run database migrations
make migrate-create  # Create new migration
make clean           # Clean Python cache and build files
```

### UI Directory (cd hmm-ui/)

```bash
make install    # Install npm dependencies
make dev        # Start Vite dev server
make build      # Build production bundle
make preview    # Preview production build
make clean      # Clean node_modules and dist
```

## 🧪 Testing

### Backend Tests

```bash
cd hmm-api
pytest                           # Run all tests
pytest --cov=app                 # With coverage
pytest tests/test_search.py      # Specific test file
```

### Frontend Tests

```bash
cd hmm-ui
npm test                         # Run tests
npm run test:coverage            # With coverage
```

## 🐛 Troubleshooting

### Binary doesn't start

**Issue:** Database initialization error

```bash
# Solution: Remove existing database
rm -rf ~/.hmm/db/
./hmm-api/dist/hmm
```

**Issue:** Port already in use

```bash
# Solution: Use custom port
./hmm-api/dist/hmm --port 9000
```

### UI not loading in binary

**Issue:** Blank page when accessing http://localhost:8000

```bash
# Check if UI was built before creating binary
ls -la ui/dist/

# If empty, rebuild:
cd hmm-ui && npm run build && cd ..
make api-build
```

### ChromaDB errors

**Issue:** Vector search not working

```bash
# Solution: Reset ChromaDB
rm -rf ~/.hmm/chroma/
# Restart application (will re-index automatically)
```

### Development server CORS errors

**Issue:** API requests fail from UI dev server

- Check that API is running on http://localhost:8000
- CORS is configured for localhost:5173 (Vite default)
- See `hmm-api/app/main.py` CORS configuration

## 📚 Documentation

- **[API Documentation](hmm-api/README.md)** - Backend architecture, endpoints, and deployment
- **[UI Documentation](hmm-ui/README.md)** - Frontend development and component guide
- **[Binary Usage Guide](BINARY_USAGE.md)** - How to run the standalone binary _(if exists)_
- **[Port Configuration](PORT_CONFIGURATION.md)** - Port and host configuration _(if exists)_

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow existing code style
- Add tests for new features
- Update documentation as needed
- Run tests before submitting PR

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

- **ChromaDB** for vector search capabilities
- **FastAPI** for the excellent async API framework
- **HuggingFace** for the sentence-transformers model
- **React** team for the amazing UI library

## 📬 Contact

For questions or support, please open an issue on GitHub.

---

**Built with ❤️ for developers who love the terminal**
