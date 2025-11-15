"""
E-Commerce Sales Analysis
Author: Kona Omeshwar Reddy
Internship Project - Data Analytics
"""

import pandas as pd

# 1) Load Dataset
df = pd.read_csv("Ecommerce_Large_Data.csv")

# 2) Preview
print("=== Preview ===")
print(df.head())

print("\n=== Info ===")
print(df.info())

# 3) Missing Value Check
print("\n=== Missing Values ===")
print(df.isnull().sum())

# 4) Total Revenue
total_revenue = df["Total_Amount"].sum()
print(f"\nTotal Revenue: ₹{total_revenue}")

# 5) Category-wise Revenue
print("\n=== Revenue by Category ===")
print(df.groupby("Category")["Total_Amount"].sum())

# 6) Top 10 Products
print("\n=== Top 10 Products ===")
print(
    df.groupby("Product")["Total_Amount"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

# 7) Monthly Trend
df["Order_Date"] = pd.to_datetime(df["Order_Date"], errors="coerce", dayfirst=True)
df = df.dropna(subset=["Order_Date"])
df["Month"] = df["Order_Date"].dt.to_period("M")

print("\n=== Monthly Sales Trend ===")
print(df.groupby("Month")["Total_Amount"].sum())
