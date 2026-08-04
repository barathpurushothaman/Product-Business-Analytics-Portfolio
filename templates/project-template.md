# Project Template

Use this template to create every new project in the **Product & Business Analytics Portfolio**.

Each project follows a structured, phase-based methodology that mirrors how analytics initiatives are executed in professional environments.

---

# Project Folder Structure

```text
project-xx/
│
├── README.md
│
├── assets/
├── dataset/
│
├── phase-01-project-planning/
│
├── phase-02-database-design/
│
├── phase-03-data-exploration/
│
├── phase-04-business-analysis/
│
├── phase-05-dashboard-development/
│
└── phase-06-business-case-study/
```

---

# Phase Overview

| Phase | Objective |
|--------|-----------|
| Phase 01 | Understand the business problem and the available data |
| Phase 02 | Design and build the analytical database |
| Phase 03 | Explore and validate the data |
| Phase 04 | Answer business questions using analysis |
| Phase 05 | Build dashboards and visualizations |
| Phase 06 | Present findings as a business case study |

---

# Phase 01 – Project Planning

## Objective

Understand the business domain, identify stakeholders, define business questions, and document the available data.

### Suggested Contents

```text
phase-01-project-planning/
│
├── README.md
├── dataset_inventory.md
├── data_dictionary.md
├── entity_relationships.md
└── business_questions.md
```

### Deliverables

- Dataset Inventory
- Data Dictionary
- Entity Relationship Documentation
- Business Questions

---

# Phase 02 – Database Design

## Objective

Transform raw data into a structured relational database.

### Suggested Contents

```text
phase-02-database-design/
│
├── README.md
│
├── sql/
│   ├── ddl/
│   ├── dml/
│   └── constraints.sql
│
├── validation/
│
└── screenshots/
```

### Deliverables

- Database Schema
- SQL Scripts
- Validation Queries
- Database Documentation

---

# Phase 03 – Data Exploration

## Objective

Understand the quality and characteristics of the dataset before performing business analysis.

### Suggested Contents

```text
phase-03-data-exploration/
│
├── README.md
├── sql/
├── findings.md
└── screenshots/
```

### Deliverables

- Exploratory SQL
- Data Quality Assessment
- Initial Findings

---

# Phase 04 – Business Analysis

## Objective

Answer business questions and generate actionable insights.

### Suggested Contents

```text
phase-04-business-analysis/
│
├── README.md
├── sql/
├── reports/
├── screenshots/
└── insights.md
```

### Deliverables

- Business Analysis SQL
- KPIs
- Insights
- Recommendations

---

# Phase 05 – Dashboard Development

## Objective

Communicate insights through interactive dashboards.

### Suggested Contents

```text
phase-05-dashboard-development/
│
├── README.md
├── powerbi/
├── screenshots/
└── documentation.md
```

### Deliverables

- Dashboard
- Dashboard Documentation
- Dashboard Screenshots

---

# Phase 06 – Business Case Study

## Objective

Present the project as a complete business case study.

### Suggested Contents

```text
phase-06-business-case-study/
│
├── README.md
├── executive_summary.md
├── final_report.md
└── presentation/
```

### Deliverables

- Executive Summary
- Final Report
- Business Recommendations
- Presentation

---

# Project Workflow

Every project should progress through the following lifecycle.

```text
Business Problem
        ↓
Business Context
        ↓
Stakeholders
        ↓
Business Questions
        ↓
Dataset Understanding
        ↓
Database Design
        ↓
Data Exploration
        ↓
Business Analysis
        ↓
Dashboard Development
        ↓
Business Recommendations
        ↓
Business Impact
```

---

# Git Workflow

Each major milestone should end with a Git commit.

Examples:

```
docs: complete project planning

feat(database): create customer and order tables

feat(sql): complete exploratory analysis

feat(dashboard): build executive dashboard

docs: complete business case study
```

---

# Repository Standards

- Use descriptive file names.
- Keep documentation close to the phase in which it was created.
- Separate SQL by purpose where appropriate.
- Document assumptions.
- Support recommendations with evidence.
- Keep README files updated throughout the project.
- Commit changes frequently using meaningful commit messages.

---

# Success Criteria

A completed project should allow a visitor to understand:

- The business problem
- The analytical approach
- The technical implementation
- The business insights
- The recommendations
- The overall business impact

without requiring additional explanation.
