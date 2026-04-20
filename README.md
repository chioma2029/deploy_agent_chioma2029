# Student Attendance Tracker Project

##  Overview

This project provides a **Bash automation script** that sets up a complete workspace for a Student Attendance Tracker system.

The script acts as a **Project Factory**, meaning it:

* Creates the required directory structure
* Organizes all necessary files
* Allows dynamic configuration of attendance thresholds
* Handles interruptions safely using system signals
* Validates the environment before completion

---

##  Demonstrative vidoe link below
https://1drv.ms/v/c/f2c48ed86e77fc2a/IQBGz3viuvOtTaHLCvP-fw-UAQo9mWvu3bW0hBtYIX1zKa4?e=h6pgGY


---

##  Project Structure

After running the script, the following structure is created:

```
attendance_tracker_<project_name>/
│
├── attendance_checker.py
│
├── Helpers/
│   ├── assets.csv
│   └── config.json
│
└── reports/
    └── reports.log
```

###  Description of Components

* **attendance_checker.py**

  * Main Python application that processes attendance data

* **Helpers/**

  * `assets.csv`: Contains student attendance records
  * `config.json`: Stores system configuration (thresholds, settings)

* **reports/**

  * `reports.log`: Stores generated attendance reports

---

##  How the Script Works

### 1. User Input

The script begins by asking the user for a project name:

```
Enter project name:
```

This name is used to create a unique project folder:

```
attendance_tracker_<project_name>
```

---

### 2. Directory Creation

The script creates the required folders using:

```
mkdir -p
```

This ensures:

* Directories are created safely
* No errors occur if they already exist

---

### 3. File Organization

The script moves files into their correct locations:

* Python file → main directory
* CSV & JSON → Helpers folder
* Log file → reports folder

---

### 4. Dynamic Configuration (sed)

The user is asked:

```
Do you want to update thresholds? (yes/no):
```

If **yes**, the script:

* Accepts new values for:

  * Warning threshold
  * Failure threshold
* Updates `config.json` using `sed`

Example:

Before:

```
"warning": 75
```

After:

```
"warning": 80
```

---

### 5. Environment Validation

The script checks if Python is installed:

```
python3 --version
```

* If installed → success message
* If not → warning message

---

### 6. Signal Handling (Trap)

The script handles user interruption (`Ctrl + C`) using:

```
trap ... SIGINT
```

If interrupted:

1. The current project directory is archived into:

   ```
   attendance_tracker_<name>_archive.tar.gz
   ```
2. The incomplete project folder is deleted
3. The script exits safely

---

##  Key Concepts Used

### 🔹 Bash Scripting

Used to automate setup tasks

### 🔹 `read`

Captures user input from the terminal

### 🔹 `mkdir -p`

Creates directories safely without errors

### 🔹 `mv`

Moves files into correct locations

### 🔹 `sed`

Edits configuration files dynamically

### 🔹 `trap`

Handles system signals like `Ctrl + C`

### 🔹 File Testing `[ -f ]`

Ensures files exist before operations

---

##  How to Run the Script

### Step 1: Make script executable

```
chmod +x setup_project.sh
```

### Step 2: Run the script

```
./setup_project.sh
```

---

## Example Run

```
Enter project name: class1
Do you want to update thresholds? (yes/no): yes
Enter warning threshold: 80
Enter failure threshold: 60
Python3 is installed
```

---

## Notes

* Ensure required files exist before running:

  * `attendance_checker.py`
  * `assets.csv`
  * `config.json`
  * `reports.log`

* The script assumes these files are in the current directory

* Archive files are created only when interruption occurs

---

## 🚀 Conclusion

This project demonstrates how shell scripting can be used to:

* Automate repetitive setup tasks
* Manage project structure efficiently
* Allow flexible configuration
* Handle unexpected interruptions safely

It reflects real-world practices in system setup, DevOps, and automation.

---

## Author

Chioma
