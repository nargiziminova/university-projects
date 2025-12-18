CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    signup_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS activity_log (
    log_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    activity_type VARCHAR(20),
    value INT,
    activity_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
import sqlite3
from datetime import datetime

class DatabaseManager:
    def __init__(self, db_name="university_project.db"):
        self.db_name = db_name

    def connect(self):
        return sqlite3.connect(self.db_name)

    def init_db(self):
        with self.connect() as conn:
            cursor = conn.cursor()
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS users (
                    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT NOT NULL UNIQUE,
                    signup_date TEXT,
                    country TEXT
                )
            ''')
            conn.commit()

    def add_user(self, username, country):
        try:
            with self.connect() as conn:
                cursor = conn.cursor()
                date_now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                cursor.execute(
                    "INSERT INTO users (username, signup_date, country) VALUES (?, ?, ?)",
                    (username, date_now, country)
                )
        except sqlite3.IntegrityError:
            pass

    def get_all_users(self):
        with self.connect() as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM users")
            return cursor.fetchall()

if __name__ == "__main__":
    db = DatabaseManager()
    db.init_db()
    
    db.add_user("Alice_Python", "Poland")
    db.add_user("Bob_Dev", "Germany")

    users = db.get_all_users()
    for user in users:
        print(user)
