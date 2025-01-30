# Construction_Agency
# Online Attendance Management System for Construction Agency
Welcome to the Online Attendance Management System!
This system helps track workers' attendance, calculate work hours, generate wages, and manage leave requests efficiently.

# Features
* Automatic Attendance Marking: The system marks Check-In when a worker logs in and Check-Out when they log out, automatically calculating work hours.
* Work Hours & Wages Calculation: The system calculates workers' daily work hours, considering 8 hours as standard work time, and calculates overtime wages for extra hours.
✅ Worker Panel - Personal Information: Workers can view their Worker ID, Name, Contact Number, Total Work Hours, and Daily Wage.
✅ Leave Management: Workers can request leave through the system if they are unwell or need time off, which the admin can approve or reject.
✅ Real-Time Attendance Tracking: The admin can instantly monitor workers' attendance and work hours.
✅ Report Generation:

Per-Day Report: Shows daily work hours and wages for workers.
Monthly Report: Summarizes attendance, overtime, and wages for a full month.
✅ Worker Cannot Delete Data: Workers cannot delete any data. Only the admin has the authority to manage records.
✅ Secure Database Storage: All attendance records, leave requests, and wage details are securely stored in a MySQL database.

# Technologies Used
Frontend: HTML, CSS, JavaScript
Backend: Java (Servlets & JSP)
Database: MySQL

# Setup Instructions
1. Clone the repository to your local machine:

git clone https://github.com/jadavtanvi/construction-attendance-system.git

2. Configure the MySQL database (Run the provided SQL script).
3. Deploy the application on the Tomcat Server using NetBeans.
   
# Usage
🔹 Worker Panel:

The system marks Check-In automatically when a worker logs in.
The system calculates work hours when the worker Checks Out.
Workers can view their ID, Name, Contact Number, Total Work Hours, and Daily Wage.
Workers can submit a leave request to the admin.
Workers cannot delete any records.


🔹 Admin Panel:

View workers' attendance and work hours.
Generate wages for workers.
Approve or reject leave requests.
Generate Per-Day and Monthly Reports.
Delete and manage worker records.
