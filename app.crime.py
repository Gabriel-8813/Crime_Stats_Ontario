from flask import Flask, jsonify, request, render_template
import sqlite3
import pandas as pd

app = Flask(__name__)

# Path to your SQLite database
DB_PATH = 'Crime_Hate_Stats.sqlite'

# Function to connect to SQLite and fetch data
def fetch_data(query):
    try:
        conn = sqlite3.connect(DB_PATH)  # Connect to SQLite
        df = pd.read_sql_query(query, conn)  # Execute query
        conn.close()
        return df
    except Exception as e:
        print(f"Error fetching data: {e}")
        return pd.DataFrame()  # Return empty DataFrame on error

# API endpoint to get filtered hate stats
@app.route('/api/HateStats', methods=['GET'])
def get_hate_stats():
    # Get query parameters (e.g., /api/HateStats?year=2021)
    year = request.args.get('year')  # Query parameter for year
    location = request.args.get('location')  # Optional query parameter for location

    # Base SQL query
    query = "SELECT * FROM HateStats output"  # Replace with your actual table name

    # Build WHERE clause for filters
    filters = []
    if year:
        filters.append(f"Year = {year}")
    if location:
        filters.append(f"location LIKE '%{location}%'")  # Use LIKE for partial matches

    # Add filters to query
    if filters:
        query += " WHERE " + " AND ".join(filters)

    # Fetch data using the constructed query
    data = fetch_data(query)

    # Return the data as JSON
    if not data.empty:
        return jsonify(data.to_dict(orient='records'))
    else:
        return jsonify({"message": "No data found for the given filters"}), 404

# Route to return all data from the table
@app.route('/')
def home():
    return render_template('index.html')
    # return "Welcome to the Crime Hate Stats API! Visit /api/CrimeStats to get data."

@app.route('/api/CrimeStats', methods=['GET'])
def get_crime_stats():
    # SQL query to fetch all data from the crime_stats table
    query = "SELECT * FROM CrimeStats output;"  # Replace with your table name
    data = fetch_data(query)
    # Convert DataFrame to JSON
    return jsonify(data.to_dict(orient='records'))

# Start the Flask app
if __name__ == '__main__':
    app.run(debug=True)










