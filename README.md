# 🛠️ remove-pop-broker.com

This PowerShell script removes **malicious scheduled tasks and autorun entries** that cause annoying browser pop-ups like `https://www.pop-broker.com`, `localsys.win`, or similar adware sites.

Are you experiencing any of the following?

- Your browser opens `pop-broker.com` automatically every few hours.
- Task Scheduler has strange entries like:
  - `GoogleUpdateDaily`
  - `UpdaterChromeApp`
- Registry points to `.ico`, `.vbs`, or unknown `.bat` files.
- Random sites open when starting your PC.

These are signs of **task scheduler malware or adware**.

This script helps by:

- ✅ Deleting known malicious Task Scheduler entries  
- ✅ Cleaning up suspicious `Run` registry entries  
- ✅ Removing `.ico`, `.vbs`, `.bat` files from the Temp folder  
- ✅ Safe to run on Windows 10 and Windows 11  

---

## 🚀 How to Use

### 1. Clone or download this repository

```bash
git clone https://github.com/YOUR-USERNAME/remove-pop-broker.com.git
cd remove-pop-broker.com
```

### 2. Run the PowerShell script as Administrator

```powershell
powershell -ExecutionPolicy Bypass -File .\Remove-MaliciousTasks.ps1
```

### 3. Restart your computer after the script completes

---

## 💣 What This Script Removes

**Task Scheduler entries:**

- `\GoogleUpdateDaily`
- `\GoogleUpdateWeekly`
- `\UpdaterChromeApp`
- `\UpdaterChromeApp2`

**Registry autorun entries containing:**

- `pop-broker`
- `localsys`
- `.ico`, `.vbs`, `.bat` references

**Suspicious files inside the Temp folder:**

- `temp_cleanup.ico`
- Hidden `.vbs` or `.bat` files

---

## 🧼 Recommended After Cleanup

- 🛡️ Scan your PC using [Malwarebytes Free](https://www.malwarebytes.com/)
- 🔍 Check your browser shortcuts (Chrome/Edge) to remove hidden redirect URLs
- 🧩 Remove unknown or suspicious browser extensions
- 💻 Use [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) by Sysinternals to inspect startup programs

---

## 📄 License

This project is released under the **MIT License**.  
Free to use, modify, and share.

---

## ⭐ Support This Project

If this helped you remove pop-up malware like `pop-broker.com`, please give this repo a ⭐ star!  
Feel free to contribute by reporting issues or submitting pull requests.
