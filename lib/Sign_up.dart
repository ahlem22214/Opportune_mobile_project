import 'package:flutter/material.dart';
import 'Home_Page.dart'; // Import UserHomePage if you have it
import 'Company_Home.dart'; // Import CompanyHomePage if you have it

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isUser = true; // Default to user signup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Create An account',
              style: TextStyle(
                fontSize: 24,
                color: Colors.indigo[700],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Icon(
                      Icons.account_circle, // Icône pour le profil
                      color: Colors.indigo[700],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'John jone',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Icon(
                      Icons.mail, // Icône pour l'email
                      color: Colors.indigo[700],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'John.jone@gmail.com',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Icon(
                      Icons.lock, // Icône pour le mot de passe
                      color: Colors.indigo[700],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        obscureText: true, // Masque le texte pour le mot de passe
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Icon(
                      Icons.lock, // Icône pour le mot de passe
                      color: Colors.indigo[700],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        obscureText: true, // Masque le texte pour le mot de passe
                        decoration: InputDecoration(
                          hintText: 'Repeat Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Gérer le clic sur "User" ici
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // Espacement entre le cadre et le texte
                      Text(
                        'User',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.indigo[700],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Gérer le clic sur "Company" ici
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // Espacement entre le cadre et le texte
                      Text(
                        'Company',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.indigo[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign in action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                minimumSize: Size(500, 45),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Already have an account ? ',
              style: TextStyle(
                color:Colors.grey,
                fontSize: 14,
            ),
            ),
            InkWell(
              onTap: () {
                // Revenir à la page de connexion (loginPage) lors du clic sur "Sign In"
                Navigator.pop(context);
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple[100],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
