📊 Executive Financial Dashboard – Education Domain - [Live Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZjQwZWZiYmQtYjFjNS00YjQ0LTgwNTMtYjBiMjk2OGQ3ZjcxIiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9)


# Overview

This project focuses on building an Executive Financial Dashboard to monitor and analyze the financial performance of an education-based organization across multiple business units.

The goal is to transform complex, raw operational data into clear, actionable insights that support strategic decision-making.

# Objectives


Provide a unified financial view across business units
Track key metrics like Revenue, Profit, and YoY Growth
Identify performance gaps and profitability issues
Enable data-driven decision-making for executives


# Architecture & Approach

This project follows a simplified end-to-end analytics workflow:

-- Source Database (200+ Tables)
          
-- SQL Transformation Layer (Views)
          
-- Star Schema (Fact & Dimension Tables)
           
-- Power BI Semantic Model
         
-- Executive Dashboard

# Data Modeling

To make the data analytics-ready:

Designed a Star Schema with:
Fact Tables:
Fact_Invoice
Fact_Payment
Fact_FinanceTransaction
Fact_TermBooking
Dimension Tables:
Dim_BusinessUnit
Dim_Enterprise
Dim_Org
Dim_Account
Dim_TaxRate

Built a SQL-based transformation layer using Views to:
Join multiple operational tables,
Clean and structure data,
Standardize fields for reporting.

# ETL Approach

Instead of using traditional ETL tools (like SSIS), this project uses a SQL-first approach:

Extract → Data sourced from relational database
Transform → Handled within SQL Views (joins, aggregations, structuring)
Load → Power BI connects directly to the transformed views

This approach simulates a lightweight ELT pipeline.

# Dashboard Features
-- KPI indicators with variance (YoY %)

-- Revenue, Profit, and Margin analysis

-- Business Unit performance comparison

-- Trend analysis over time

-- Interactive metric selection (toggle-based visuals)

-- Executive-friendly design using IBCS-style principles

# Data Note (Important)

The original dataset provided for this project contained masked and non-meaningful values, which limited its ability to generate realistic business insights.

To address this:

AI-generated synthetic data was used
Synthetic data was carefully designed to:
Mimic real-world financial patterns
Preserve relationships between entities
Enable meaningful trend and variance analysis

This ensures the dashboard demonstrates realistic business scenarios while maintaining data privacy.

# Key Insights

Revenue growth does not always translate to profitability

Certain business units underperform consistently

Discount-heavy strategies can negatively impact margins

High-performing units provide opportunities for scaling best practices

# Recommendations

Improve profitability in underperforming business units

Review pricing and discount strategies

Replicate successful practices from high-performing units

Use the dashboard for regular performance reviews

# Tools & Technologies

**SQL Server** (Views, Data Modeling)

**Power BI** (Data Modeling & Visualization

**Synthetic Data Generation** (for demo purposes)

# Disclaimer

This project is built for learning and demonstration purposes only.
All sensitive data has been replaced with synthetic data to ensure privacy and compliance.
