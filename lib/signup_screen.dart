import 'package:flutter/material.dart';
import 'home_screen.dart';  // Make sure to import the home_screen.dart file
import 'login_screen.dart';  // Make sure to import the home_screen.dart file

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30),
                Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: 'Get to know about all the GDG events\n'),
                        TextSpan(text: 'simply by creating a new account'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                _buildTextField('Enter Your Username'),
                SizedBox(height: 15),
                _buildTextField('Enter Your Email'),
                SizedBox(height: 15),
                _buildTextField('Enter Your Phone Number'),
                SizedBox(height: 15),
                _buildTextField('Enter Your Password', isPassword: true),
                SizedBox(height: 25),
                ElevatedButton(
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or With', style: TextStyle(color: Colors.grey[700])),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label: Text('Signup with Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 15),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[700],
                    side: BorderSide(color: Colors.grey),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://cdn.iconscout.com/icon/free/png-256/google-160-189824.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text('Sign up with Google'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an account?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[700]),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[500]!),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: isPassword
            ? Icon(Icons.visibility_off, color: Colors.grey[400])
            : null,
      ),
    );
  }
}