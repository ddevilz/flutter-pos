import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../models/users.model.dart';
import '../services/database.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final MySQLService _mysqlService = MySQLService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: <Widget>[
          TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username')),
          TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password')),
          ElevatedButton(
              onPressed: () async {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  _showDialog(context, 'Error',
                      'Please enter both username and password.');
                  return;
                }
                User? user = await _mysqlService.loginUser(
                    _usernameController.text, _passwordController.text);
                if (user != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                } else {
                  // Show error
                  _showDialog(
                      context, 'Login Failed', 'Invalid username or password.');
                }
              },
              child: Text('Login'))
        ],
      ),
    );
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
