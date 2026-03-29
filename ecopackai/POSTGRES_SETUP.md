# PostgreSQL Setup Guide for EcoPackAI

## Step 1: Download PostgreSQL

1. Visit: https://www.postgresql.org/download/windows/
2. Click on **"Download the installer"** for the latest version (PostgreSQL 15 or higher recommended)
3. Choose the appropriate version (usually x86-64 for most systems)

---

## Step 2: Install PostgreSQL on Windows

### 2.1 Run the Installer
1. Double-click the downloaded `.exe` file
2. Click **Next** to begin installation

### 2.2 Select Installation Directory
- Default: `C:\Program Files\PostgreSQL\15` (or your version)
- Click **Next**

### 2.3 Select Components
Ensure the following are checked:
- ✓ PostgreSQL Server
- ✓ pgAdmin 4 (GUI tool)
- ✓ Stack Builder
- ✓ Command Line Tools

Click **Next**

### 2.4 Choose Data Directory
- Default: `C:\Program Files\PostgreSQL\15\data`
- Click **Next**

### 2.5 Set Superuser Password
**Important:** Set a strong password for the `postgres` user (you'll need this later)
- Enter password in **Password** field
- Confirm in **Re-enter password** field
- **Example:** `Postgres123!` (use a secure password!)
- Click **Next**

### 2.6 Set Port Number
- Default Port: **5432** (keep this as default)
- Click **Next**

### 2.7 Select Locale
- Default: Locale
- Click **Next**

### 2.8 Review Summary
- Click **Next** to begin installation
- Wait for installation to complete (may take 5-10 minutes)

### 2.9 Finish Installation
- Uncheck "Stack Builder" if you don't need it
- Click **Finish**

---

## Step 3: Verify PostgreSQL Installation

### 3.1 Check if PostgreSQL is Running
**Windows:**
- Press `Win + R`, type `services.msc`, press Enter
- Look for **postgresql-x64-15** (or your version)
- Status should show **Running**

### 3.2 Verify via Command Line
Open **PowerShell** or **Command Prompt** and run:
```bash
psql --version
```

If installed correctly, you'll see:
```
psql (PostgreSQL) 15.x
```

---

## Step 4: Connect to PostgreSQL

### 4.1 Using psql (Command Line Tool)
Open **PowerShell** or **Command Prompt**:

```bash
psql -U postgres
```

You'll be prompted for the password you set during installation. Enter it.

You should see the PostgreSQL prompt:
```
postgres=#
```

### 4.2 Using pgAdmin (GUI Tool)
1. Open **pgAdmin 4** from Start Menu
2. Enter the master password (set during installation)
3. In the left sidebar, right-click **Servers** → **Create** → **Server**
4. Name it `EcoPackAI`
5. Connection tab: `localhost`, Port: `5432`, Username: `postgres`
6. Click **Save**

---

## Step 5: Create EcoPackAI Database

### 5.1 Using psql (Command Line)

**Step 1:** Connect to PostgreSQL
```bash
psql -U postgres
```

**Step 2:** Create a new database
```sql
CREATE DATABASE ecopackai;
```

**Step 3:** Verify creation
```sql
\l
```

You should see `ecopackai` in the list.

**Step 4:** Connect to the new database
```sql
\c ecopackai
```

You should see:
```
You are now connected to database "ecopackai" as user "postgres".
```

**Step 5:** Exit psql
```sql
\q
```

### 5.2 Using pgAdmin (GUI Tool)

1. Right-click **Databases** → **Create** → **Database**
2. Name: `ecopackai`
3. Click **Save**

---

## Step 6: Create Application User (Recommended)

Instead of using the `postgres` superuser for your application, create a dedicated user.

### 6.1 Using psql
```bash
psql -U postgres
```

**Create a new user:**
```sql
CREATE USER ecopack_user WITH PASSWORD 'SecurePassword123!';
```

**Grant privileges:**
```sql
GRANT ALL PRIVILEGES ON DATABASE ecopackai TO ecopack_user;
```

**Exit:**
```sql
\q
```

---

## Step 7: Update Backend Configuration

### 7.1 Edit Database Connection String
Navigate to: `backend/src/models/database.py`

Update the connection string with one of these options:

**Option 1: Using postgres superuser**
```python
DATABASE_URL = "postgresql://postgres:Postgres123!@localhost:5432/ecopackai"
```

**Option 2: Using dedicated user (recommended)**
```python
DATABASE_URL = "postgresql://ecopack_user:SecurePassword123!@localhost:5432/ecopackai"
```

**Format:** `postgresql://username:password@host:port/database`

---

## Step 8: Test the Connection

### 8.1 Test with psql
```bash
psql -U ecopack_user -d ecopackai -h localhost
```

You should connect successfully to the database.

### 8.2 Test with Python (from backend directory)

Create a test script `test_db.py`:
```python
import psycopg2

try:
    conn = psycopg2.connect(
        database="ecopackai",
        user="ecopack_user",
        password="SecurePassword123!",
        host="localhost",
        port="5432"
    )
    
    cur = conn.cursor()
    cur.execute("SELECT version();")
    db_version = cur.fetchone()
    print("Database version:", db_version)
    
    cur.close()
    conn.close()
    print("✓ Connection successful!")
    
except (Exception, psycopg2.DatabaseError) as error:
    print("✗ Error:", error)
```

Run it:
```bash
python test_db.py
```

---

## Common Connection Issues & Solutions

### Issue 1: "psql: command not found"
**Solution:** Add PostgreSQL to PATH
1. Press `Win + R`, type `systempropertiesadvanced`, press Enter
2. Click **Environment Variables**
3. Under "System variables", find or create `PATH`
4. Add: `C:\Program Files\PostgreSQL\15\bin`
5. Restart terminal

### Issue 2: "Password authentication failed"
**Solution:** Verify password
1. Reset password in pgAdmin or command line:
   ```sql
   ALTER USER ecopack_user WITH PASSWORD 'NewPassword123!';
   ```
2. Update connection string in `backend/src/models/database.py`

### Issue 3: "Could not connect to server"
**Solution:** Ensure PostgreSQL is running
```bash
# Check service status
Get-Service postgresql-x64-15

# Start service if stopped
Start-Service postgresql-x64-15
```

### Issue 4: "Database does not exist"
**Solution:** Create the database
```bash
psql -U postgres -c "CREATE DATABASE ecopackai;"
```

### Issue 5: "Port 5432 already in use"
**Solution:** Either change port or stop conflicting service
```bash
# Find what's using port 5432
netstat -ano | findstr :5432

# Kill the process (replace PID with actual number)
taskkill /PID <PID> /F
```

---

## Connection String Examples

| User Type | Connection String |
|-----------|---|
| Superuser | `postgresql://postgres:password@localhost:5432/ecopackai` |
| App User | `postgresql://ecopack_user:password@localhost:5432/ecopackai` |
| Remote Server | `postgresql://user:password@192.168.1.100:5432/ecopackai` |
| With SSL | `postgresql://user:password@localhost:5432/ecopackai?sslmode=require` |

---

## Useful psql Commands

```sql
\l                           -- List all databases
\du                          -- List all users
\c database_name             -- Connect to a database
\dt                          -- List all tables
\d table_name                -- Describe table structure
\e                           -- Open editor
\q                           -- Quit psql
```

---

## Next Steps

1. ✅ Install and verify PostgreSQL
2. ✅ Create `ecopackai` database
3. ✅ Create `ecopack_user` (optional but recommended)
4. ✅ Update `backend/src/models/database.py` with connection string
5. ✅ Test connection using the test script
6. ✅ Run backend: `python src/app.py`

---

## Backup & Restore (Important!)

### Backup Database
```bash
pg_dump -U ecopack_user ecopackai > ecopackai_backup.sql
```

### Restore Database
```bash
psql -U ecopack_user -d ecopackai -f ecopackai_backup.sql
```

---

## Additional Resources

- PostgreSQL Official Docs: https://www.postgresql.org/docs/
- pgAdmin Docs: https://www.pgadmin.org/docs/
- Connection Strings: https://www.postgresql.org/docs/current/libpq-connect-connstring.html

---

**PostgreSQL is ready! 🚀**
