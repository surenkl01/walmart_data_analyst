# Walmart Data Analysis: End-to-End SQL + Python Project P-9

## Project Overview

<img width="1536" height="1024" alt="walmart_pipeline" src="https://github.com/user-attachments/assets/9083d551-aa4c-4493-bed2-afde374accc5" />




This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL)
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command below to download datasets directly into your project:
        ```bash
        kaggle datasets download -d <dataset-path>
        ```

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales dataset.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python
     ```
   - **Loading Data**: Read the dataset into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct initial data exploration to understand data distribution, column names, data types, and potential issues.
   - **Analysis**: Use `.info()`, `.describe()`, and `.head()` to get a quick overview of the dataset.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate records.
   - **Handle Missing Values**: Drop or fill missing values based on business relevance.
   - **Fix Data Types**: Convert columns to proper data types (e.g., dates to `datetime`, prices to `float`).
   - **Currency Formatting**: Clean and standardize currency columns.
   - **Validation**: Verify the cleaned data for consistency and accuracy.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction using:
     ```
     total_amount = unit_price × quantity
     ```
   - **Enhancement**: This simplifies SQL aggregation and revenue analysis.

### 8. Load Data into MySQL
   - **Database Connection**: Use `sqlalchemy` and `mysql-connector-python` to connect to MySQL.
   - **Table Creation**: Automatically create tables and insert cleaned data using Python.
   - **Verification**: Run sample SQL queries to confirm successful data loading.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **SQL Topics Covered**:
     - GROUP BY
     - Aggregation Functions
     - Window Functions
     - Date Functions
   - **Business Questions Answered**:
     - Revenue trends across branches and categories
     - Best-selling product categories
     - Sales performance by time, city, and payment method
     - Peak sales periods and customer buying patterns
     - Profit margin analysis by branch and category
   - **Documentation**: Each query includes objectives, logic, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain clear documentation using Markdown or Jupyter Notebooks.
   - **Project Publishing**: Publish the project on GitHub, including:
     - `README.md`
     - SQL query scripts
     - Python scripts / notebooks
     - Instructions to access the dataset

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`,
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- data/                     # Raw data and transformed data
|-- sql_queries/              # SQL scripts for analysis and queries
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
