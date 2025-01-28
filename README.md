# Databases 2 Final Exam Repository

This repository contains all the files and scripts I created for my **Databases 2** final exam. The exam was designed to test advanced SQL skills, including creating functions, procedures, triggers, and packages while following specific requirements. Below, you will find an overview of the tasks, objectives, and SQL techniques applied.

## Table of Contents
- [Overview](#overview)
- [Project Objectives](#project-objectives)
- [Contents](#contents)
- [Skills Demonstrated](#skills-demonstrated)
- [Instructions](#instructions)
- [Notes](#notes)

## Overview
This project contains SQL scripts and documentation showcasing my ability to work with databases. The tasks included creating functions, procedures, and triggers, as well as managing database packages. The work was split into two parts: **written exercises** and **practical SQL implementation** using Oracle SQL tools.

### Context
- **Class**: Databases 2
- **Topic**: SQL Functions, Procedures, Triggers, and Packages
- **Purpose**: To demonstrate proficiency in solving real-world database problems and performing advanced SQL operations.

---

## Project Objectives
The exam was divided into two parts, covering the following objectives:

### Part 1: On Paper (40 Minutes)
1. Create a **function** (`your_name_f1`) to calculate the value of inventory using the formula:


2. Create a **procedure** (`your_name_p1`) to:
- INSERT or UPDATE records in the `inventory` table.
- Handle errors for negative quantities during INSERT operations.
- Display confirmation messages and use the function `your_name_f1` to display inventory values.

---

### Part 2: Practical SQL Implementation (120 Minutes)
1. Create a **function** (`your_name_find_value`) to calculate inventory values.
2. Create a **procedure** (`your_name_p1`) to INSERT or UPDATE inventory records with error handling.
3. Create a **procedure** to:
- Display all columns of the `item` table except `item_image`.
- Under each item, display related inventory data.
4. Create an **audit table** (`audit_inventory`) to track changes in the `inventory` table.
5. Create a **trigger** to record old inventory data into the `audit_inventory` table on updates.
6. Create a **package specification** and **package body** (`your_name_final`) containing all functions and procedures.
7. Execute and test all procedures, functions, and the package.

---

## Contents
The repository includes the following files:
- **Part 1 Documentation**: Written SQL logic and explanations for the on-paper exam.
- **SQL Scripts**:
- `create_function.sql`: Contains the function to calculate inventory values.
- `create_procedure.sql`: Contains the procedures for managing inventory and displaying item-related data.
- `create_trigger.sql`: Contains the trigger for auditing the `inventory` table.
- `create_package.sql`: Contains the package specification and body.
- **Test Scripts**:
- Scripts to test all functions, procedures, and the package execution.
- **Output Screenshots**:
- Screenshots of the SQL commands executed and their results in the terminal.
- **README.md**: This documentation file.

---

## Skills Demonstrated
In this project, I demonstrated the following SQL skills:
- Creating and using **functions** to perform calculations.
- Designing **procedures** for data manipulation with error handling.
- Writing **triggers** to capture data changes in audit tables.
- Creating **packages** to encapsulate database logic.
- Managing **tables** and working with relational data.
- Implementing **error handling** and displaying meaningful output messages.

---

## Instructions
1. Clone this repository to your local environment:
```bash
git clone https://github.com/yourusername/databases2-final.git


### Next Steps:
1. Replace `your_name` with your actual name in all references (e.g., `john_doe_f1`).
2. Add actual filenames for your scripts and screenshots.
3. If you don’t have screenshots yet, take them after running the scripts and update the README file paths.

---

## Notes

If you encounter any issues running the scripts, make sure to:

Use the appropriate user schema in your Oracle SQL environment.
Adjust table or column names in the scripts if they differ from your database setup.
Check for dependencies, such as user privileges for creating packages and triggers.
