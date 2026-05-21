# Better Life Hospital

Java Swing hospital management application backed by MySQL.

## Requirements

- JDK 8 or newer
- MySQL or MariaDB server
- Optional: phpMyAdmin for importing the SQL dump

XAMPP is not required. The project includes the required Java libraries in `lib/`.

## Database Setup

Create and import the database from `betterlifehospital.sql`.

Using phpMyAdmin:

1. Open phpMyAdmin.
2. Go to the Import tab.
3. Select `betterlifehospital.sql`.
4. Run the import.

Using the MySQL CLI:

```powershell
mysql -u root -p < betterlifehospital.sql
```

The app defaults to:

- Database: `betterlifehospital`
- Host: `localhost`
- Port: `3306`
- User: `root`
- Password: `root`

To use different credentials, set environment variables before running:

```powershell
$env:BLH_DB_USER = "root"
$env:BLH_DB_PASSWORD = "your-password"
$env:BLH_DB_URL = "jdbc:mysql://localhost:3306/betterlifehospital?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
```

## Run

From the project root:

```powershell
.\scripts\run.ps1
```

To build only:

```powershell
.\scripts\build.ps1
```

## Sample Login

- Username: `mostafiz`
- Password: `12345`
- User type: `Admin`
