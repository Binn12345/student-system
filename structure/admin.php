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



           


           /sms-system
│
├── /assets
│   ├── /css
│   ├── /js
│   ├── /images
│   └── /icons
│
├── /config
│   ├── database.php        # DB connection
│   └── config.php          # App settings
│
├── /core                   # Core system files
│   ├── Controller.php
│   ├── Model.php
│   ├── Router.php
│   └── Auth.php
│
├── /includes               # Shared UI parts
│   ├── header.php
│   ├── sidebar.php
│   ├── footer.php
│   └── navbar.php
│
├── /modules                # FEATURE-BASED (matches sidebar)
│   │
│   ├── /dashboard
│   │   ├── index.php
│   │   └── dashboard.js
│   │
│   ├── /user_management
│   │   ├── index.php
│   │   ├── create.php
│   │   ├── edit.php
│   │   ├── userController.php
│   │   └── userModel.php
│   │
│   ├── /student_management
│   │   ├── index.php
│   │   ├── profile.php
│   │   ├── studentController.php
│   │   └── studentModel.php
│   │
│   ├── /academic_setup
│   │   ├── classes.php
│   │   ├── sections.php
│   │   ├── academicController.php
│   │   └── academicModel.php
│   │
│   ├── /subjects_curriculum
│   │   ├── subjects.php
│   │   ├── curriculum.php
│   │   ├── subjectController.php
│   │   └── subjectModel.php
│   │
│   ├── /faculty
│   │   ├── index.php
│   │   ├── profile.php
│   │   ├── facultyController.php
│   │   └── facultyModel.php
│   │
│   ├── /enrollment
│   │   ├── index.php
│   │   ├── enrollmentController.php
│   │   └── enrollmentModel.php
│   │
│   ├── /fees_payments
│   │   ├── fees.php
│   │   ├── payments.php
│   │   ├── billingController.php
│   │   └── billingModel.php
│   │
│   ├── /reports
│   │   ├── index.php
│   │   ├── reportController.php
│   │   └── reportModel.php
│   │
│   ├── /announcements
│   │   ├── index.php
│   │   ├── announcementController.php
│   │   └── announcementModel.php
│   │
│   ├── /audit_logs
│   │   ├── index.php
│   │   ├── auditController.php
│   │   └── auditModel.php
│   │
│   └── /backup_restore
│       ├── backup.php
│       ├── restore.php
│       ├── backupController.php
│       └── backupModel.php
│
├── /routes
│   └── web.php             # Simple routing (GET/POST handlers)
│
├── /storage
│   ├── /logs
│   └── /backups
│
├── /vendor                 # If you use Composer (optional)
│
├── index.php               # Entry point (router loads modules)
└── .htaccess              # Clean URLs