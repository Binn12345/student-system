Admin
 ├── Dashboard
 ├── User Management
 ├── Student Management
 ├── Academic Setup
 ├── Subjects & Curriculum
 ├── Faculty
 ├── Enrollment
 ├── Fees & Payments
 ├── Reports
 ├── Announcements
 ├── System Settings
 ├── Audit Logs
 └── Backup & Restore

 admin/
 └── users/
      ├── index.php        ← main table + UI
      ├── create.php       ← modal/form handler (AJAX)
      ├── edit.php         ← fetch + update form
      ├── delete.php       ← soft delete
      ├── reset.php        ← reset password
      └── ajax/
           ├── user_list.php
           ├── user_save.php
           ├── user_update.php
           └── user_delete.php



           