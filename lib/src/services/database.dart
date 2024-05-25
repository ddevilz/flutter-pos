import 'package:mysql1/mysql1.dart';
import 'package:bcrypt/bcrypt.dart';
import '../models/users.model.dart';

class MySQLService {
  final ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'Mysql@123',
    db: 'data',
  );

  Future<MySqlConnection> _getConnection() async {
    return await MySqlConnection.connect(settings);
  }

  Future<void> addUser(User user) async {
    if ((user.user.isEmpty) ||
        (user.pass.isEmpty) ||
        (user.utype == null || user.utype!.isEmpty) ||
        (user.last.isEmpty)) {
      throw Exception("All fields must be filled.");
    }

    final conn = await _getConnection();
    try {
      String hashedPassword = BCrypt.hashpw(user.pass, BCrypt.gensalt());
      print(
          'Inserting user: utype: ${user.utype}, user: ${user.user}, pass: ${hashedPassword}, last: ${user.last}');
      
      var result = await conn.query(
          "INSERT INTO users (utype, user, pass, last) VALUES (?, ?, ?, ?)",
          [user.utype, user.user, hashedPassword, user.last]);
          
      if (result.affectedRows != 1) {
        throw Exception("Failed to insert the user into the database.");
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('Database operation failed.');
    } finally {
      await conn.close();
    }
  }

  Future<User?> loginUser(String username, String password) async {
    final conn = await _getConnection();
    try {
      var results =
          await conn.query('SELECT * FROM users WHERE user = ?', [username]);

      if (results.isEmpty) {
        return null; // User not found
      }

      for (var row in results) {
        print('Fetched row: ${row.fields}');

        bool validPassword = BCrypt.checkpw(password, row['pass']);
        if (validPassword) {
          return User(
              utype: row['utype'],
              user: row['user'],
              pass: row['pass'],
              last: row['last']);
        }
      }
      return null; // Password did not match
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('Database operation failed.');
    } finally {
      await conn.close();
    }
  }

  Future<void> logoutUser() async {
    // Handle logout logic, possibly clearing session data or tokens
  }
}
