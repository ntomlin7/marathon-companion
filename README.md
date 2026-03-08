# Marathon Companion App

![CI](https://github.com/ntomlin7/marathon-companion/actions/workflows/ci.yml/badge.svg)
![License](https://img.shields.io/badge/license-MIT-blue)

A companion application for **Bungie's Marathon** that provides players with access to game data such as items, gear, and builds through a searchable database.

The goal of this project is to create a clean and scalable backend for exploring Marathon game data while leaving room for future frontend and community-driven tools.

---

# Tech Stack

## Backend

- Node.js
- Express
- PostgreSQL

## Tooling

- ESLint
- Prettier
- GitHub Actions

---

# Project Structure

```text
marathon-companion
│
├── server
│   ├── src
│   │   └── server.js
│   │
│   ├── scripts
│   │   └── schema.sql
│   │
│   ├── package.json
│   ├── eslint.config.mjs
│   ├── .prettierrc
│   └── .prettierignore
│
├── docs
└── README.md
```

The backend server lives inside the `server` directory.

---

# Requirements

Before running the project, ensure the following are installed:

- **Node.js 18+**
- **PostgreSQL 15+**

---

# Getting Started

## 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

---

## 2. Install backend dependencies

```bash
cd server
npm install
```

---

## 3. Configure environment variables

Create a `.env` file using the provided example.

### Mac / Linux

```bash
cp .env.example .env
```

### Windows (PowerShell)

```powershell
copy .env.example .env
```

Update the values for your local environment.

---

## 4. Database setup

Ensure PostgreSQL is running.

Create the database:

```bash
createdb marathon
```

Run the schema file:

```bash
psql -U postgres -d marathon -f scripts/schema.sql
```

This initializes the database schema used by the backend.

---

## 5. Start the server

```bash
npm start
```

The server will start on the port defined in your `.env`.

---

## Development Mode

For development, run the server with automatic restarts:

```bash
npm run dev
```

This uses **nodemon** to reload the server when files change.

---

# Development Scripts

| Command                | Description                          |
| ---------------------- | ------------------------------------ |
| `npm start`            | Start the server                     |
| `npm run dev`          | Start server with automatic restarts |
| `npm run lint`         | Run ESLint                           |
| `npm run format`       | Format files using Prettier          |
| `npm run format:check` | Check formatting (used in CI)        |

---

# Code Quality

This project enforces consistent code style using:

- **ESLint** – JavaScript linting
- **Prettier** – automatic code formatting
- **GitHub Actions** – automated lint and formatting checks

Formatting is automatically applied according to the project's Prettier configuration.

---

# Environment Variables

| Variable     | Description                  |
| ------------ | ---------------------------- |
| PORT         | Port the application runs on |
| DATABASE_URL | PostgreSQL connection string |

---

# Roadmap

Planned features and improvements for the project:

## Backend

- Item database population
- Item stats and modifiers
- API endpoints for game data
- Search and filtering support

## Frontend

- Web interface for browsing items
- Build / loadout planning tools
- Item comparison features

## Future Ideas

- Community build sharing
- Map and extraction data
- Public API for third-party tools

---

# Development Notes

- The project structure is **still evolving**.
- Database data will initially be populated manually until an official API becomes available.
- The architecture is designed to remain flexible as new game data becomes available.

---

# License

MIT
