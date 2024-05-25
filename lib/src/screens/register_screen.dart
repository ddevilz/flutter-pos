import 'package:flutter/material.dart';
import '../models/users.model.dart';
import '../services/database.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userTypeController =
      TextEditingController(); // Additional field for user type
  final MySQLService _mysqlService = MySQLService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true, // This should be true for passwords
          ),
          TextField(
            controller: _userTypeController,
            decoration: InputDecoration(labelText: 'User Type'),
          ),
          ElevatedButton(
            onPressed: () => _registerUser(context),
            child: Text('Register'),
          ),
        ],
      ),
    );
  }

  void _registerUser(BuildContext context) async {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _userTypeController.text.isEmpty) {
      _showDialog(context, 'Error', 'Please fill all fields.');
      return;
    }
    try {
      User newUser = User(
        utype: _userTypeController.text,
        user: _usernameController.text,
        pass: _passwordController.text,
        last: DateTime.now().toString(),
      );
      await _mysqlService.addUser(newUser);
      _showDialog(context, 'Success', 'User registered successfully!');
    } catch (e) {
      _showDialog(context, 'Error', 'Failed to register user: $e');
    }
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
