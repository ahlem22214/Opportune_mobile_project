import 'package:flutter/material.dart';
import 'Sign_up.dart';


class Signin extends StatelessWidget {
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
            Text(
              'Welcome to Oppor\'tune!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.indigo[700],
              ),
            ),
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 17,
                color: Colors.indigo[700],
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
                          hintText: '*********',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
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
                SizedBox(width: 10), // Espacement entre la case à cocher et le texte
                Text(
                  'Remember Me',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Spacer(), // Pour étendre l'espace entre le texte et le bouton
                TextButton(
                  onPressed: () {
                    // Gérer l'action "Forget Password" ici
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      color: Colors.indigo[700],
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Handle sign in action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                minimumSize: Size(500, 45),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle sign in action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
                minimumSize: Size(500, 45),
              ),
              child: Text(
                'Sign In With Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to Opportune?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo[700],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Naviguer vers SignUpPage lors du clic sur "Sign Up"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.purple[100],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
