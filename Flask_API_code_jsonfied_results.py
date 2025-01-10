# Import dependencies
from flask import Flask, jsonify, request
import sqlite3 # New library
import pandas as pd



# Create an app
app = Flask(__name__)



# Define a path to the SQLite database
DB_PATH = 'Crime_Hate_Stats.sqlite'



# Set a function to fetch data from SQLite
def fetch_data(query):
    try:
        conn = sqlite3.connect(DB_PATH)
        df = pd.read_sql_query(query, conn)
        conn.close()
        return df
    except Exception as e:
        print(f"Error fetching data: {e}")
        return pd.DataFrame()



# Set routes for reading and filtring data into tables

#HateStats table
@app.route('/api/HateStats', methods=['GET'])
def get_hate_stats():
    year = request.args.get('year')  
    location = request.args.get('location')
    hate_crime = request.args.get('Hate_Crime')

    # Base SQL query 
    query = "SELECT * FROM HateStats"

    # Build WHERE clause
    filters = []
    if year:
        filters.append(f"Year = {year}")
    if location:
        filters.append(f"location LIKE '%{location}%'")
    if hate_crime:
        filters.append(f"Hate_Crime LIKE '%{hate_crime}%'")

    # Append filters to query
    if filters:
        query += " WHERE " + " AND ".join(filters)

    # Fetch and return data
    data = fetch_data(query)
    if not data.empty:
        return jsonify(data.to_dict(orient='records'))
    else:
        return jsonify({"message": "No data found for the given filters"}), 404

# CrimeRates table
@app.route('/api/CrimeRates', methods=['GET'])
def get_crime_rates():
    Year = request.args.get('Year') 
    Cities = request.args.get('Cities') 
    Violation = request.args.get('Violation')
    Statistics = request.args.get('Statistics') 

    # Base SQL query 
    query = "SELECT * FROM CrimeRates"

    # Build WHERE clause
    filters = []
    if Year:
        filters.append(f"Year = {Year}")
    if Cities:
        filters.append(f"Cities LIKE '%{Cities}%'")
    if Violation:
        filters.append(f"Violation LIKE '%{Violation}%'")
    if Statistics:
        filters.append(f"Statistics LIKE '%{Statistics}%'")

    # Append filters to query
    if filters:
        query += " WHERE " + " AND ".join(filters)

    # Fetch and return data
    data = fetch_data(query)
    if not data.empty:
        return jsonify(data.to_dict(orient='records'))
    else:
        return jsonify({"message": "No data found for the given filters"}), 404


# CrimeStats table
@app.route('/api/CrimeStats', methods=['GET'])
def get_crime_Statspyth():
    Year = request.args.get('Year') 
    Cities = request.args.get('Cities') 
    Violation = request.args.get('Violation')
    location_year = request.args.get('location_year')

    # Base SQL query 
    query = "SELECT * FROM CrimeStats"

    # Build WHERE clause
    filters = []
    if Year:
        filters.append(f"Year = {Year}")
    if Cities:
        filters.append(f"Cities LIKE '%{Cities}%'")
    if Violation:
        filters.append(f"Violation LIKE '%{Violation}%'")
    if location_year:
        filters.append(f"location_year LIKE '%{location_year}%'")

    # Append filters to query
    if filters:
        query += " WHERE " + " AND ".join(filters)

    # Fetch and return data
    data = fetch_data(query)
    if not data.empty:
        return jsonify(data.to_dict(orient='records'))
    else:
        return jsonify({"message": "No data found for the given filters"}), 404



# Home route
@app.route('/')
def home():
    return "Welcome to the API! For optional filters, use /api/HateStats, /api/CrimeStats or or /api/CrimeRates."


# Start the Flask app
if __name__ == '__main__':
    app.run(debug=True)
