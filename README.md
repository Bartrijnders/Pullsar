§# PullSar

PullSar is a personal productivity application built with Oracle APEX and PL/SQL, designed to help you focus on what matters each day.

It combines **daily check-ins**, **quick capture for tasks/ideas/notes**, and **end-of-day reflections** into one fast, mobile-friendly interface. Weekly dashboards provide insight into your energy levels, priorities, and momentum.

## ✨ Features

- **Daily Check-In**: Select your energy level and define up to 3 MITs (Most Important Tasks).
- **Quick Capture**: Add tasks, ideas, and notes in seconds — no modal windows, no friction.
- **Flexible Priorities & Statuses**: Driven by configurable lookup tables (no hardcoded enums).
- **End-of-Day Review**: Mark completions, move tasks forward, and log daily wins/lessons.
- **Weekly Overview**: Visual trends for energy, completion rates, and frequent tags.
- **Tagging**: Organize entries with tags for better search and review.
- **Mobile-Friendly**: Optimized layouts for quick entries on the go.

---

## 🖥 Technology Stack

- **Frontend & App Framework**: [Oracle APEX](https://apex.oracle.com/)
- **Database**: Oracle Autonomous Database (Always Free tier on OCI)
- **Backend Logic**: PL/SQL packages and triggers
- **Version Control**: Git + GitHub (split APEX exports, migration-first SQL scripts)
- **Deployment Tools**: SQLcl scripts for export/import

---

## 📂 Repository Structure
```
pullsar/
├─ apex/ # Split APEX exports (app pages, shared components, etc.)
├─ db/
│ ├─ schema/ # Tables, views, seed data
│ ├─ packages/ # PL/SQL package specs & bodies
│ ├─ triggers/ # Database triggers
│ └─ scripts/ # Deployment scripts (run_all.sql, drop_all.sql)
├─ scripts/ # Export/import helpers for APEX & DB
└─ README.md
```

---

## 🚀 Getting Started

### 1. Prerequisites
- Oracle Cloud **Always Free Autonomous Database** with APEX enabled  
  *(or any Oracle DB 19c+ with APEX installed)*
- [SQLcl](https://www.oracle.com/database/technologies/appdev/sqlcl.html) installed locally
- Git

### 2. Clone the Repository
```bash
git clone https://github.com/<your-username>/pullsar.git
cd pullsar
