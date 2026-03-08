# Marathon Companion App

A companion application for **Bungie's Marathon** that provides players with access to game data such as items, gear, and builds through a searchable database.

**Project Status:** Early development.
The project structure and features are still evolving.

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 2. Install dependencies

```bash
npm install
```

### 3. Configure environment variables

Create a `.env` file using the provided example:

**Mac/Linux**

```bash
cp .env.example .env
```

**Windows (PowerShell)**

```powershell
copy .env.example .env
```

Update the values as needed for your local environment.

### 4. Database setup

This project requires a running PostgreSQL instance (for now).

Create a database named `marathon`, then run the schema file:

```bash
psql -U postgres -d marathon -f scripts/schema.sql
```


---

### 5. Start the application

```bash
npm start
```

### Development mode (optional)

For development, you can run the server with automatic restarts using `nodemon`:

```bash
npm run dev
```

---

## Environment Variables

| Variable     | Description                  |
| ------------ | ---------------------------- |
| PORT         | Port the application runs on |
| DATABASE_URL | PostgreSQL connection string |

---

## Development Notes

* Project structure is currently **in progress** and may change.
* Additional documentation will be added as the backend and database are implemented.

---

## License

MIT
