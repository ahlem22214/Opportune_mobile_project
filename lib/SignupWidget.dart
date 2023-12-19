import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select User Type:',
            style: TextStyle(
              fontSize: 17,
              color: Colors.indigo[700],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/job_seeker_signup');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[700],
                  // minimumSize: Size(180, 45),
                ),
                child: Text(
                  'Job Seeker',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/hr_signup');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[700],
                  // minimumSize: Size(180, 45),
                ),
                child: Text(
                  'HR Representative',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HrRepresentativeSignupScreen extends StatefulWidget {
  @override
  _HrRepresentativeSignupScreenState createState() =>
      _HrRepresentativeSignupScreenState();
}

class _HrRepresentativeSignupScreenState
    extends State<HrRepresentativeSignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      User? user = userCredential.user;

      // Add HR representative information to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set({
        'uid': user.uid,
        'email': _emailController.text.trim(),
        'type': 'hr_representative',
        'companyName': _companyNameController.text,
        'domain': _domainController.text,
      });

      // Navigate to the company home page
      Navigator.of(context).pushReplacementNamed('/company_home');
    } catch (e) {
      print('Error during HR representative sign up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HR Representative Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldContainer(
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'John.jone@gmail.com',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'At least 6 characters',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.business,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'Company Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _domainController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.domain,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'Domain',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                minimumSize: Size(500, 45),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobSeekerSignupScreen extends StatefulWidget {
  @override
  _JobSeekerSignupScreenState createState() =>
      _JobSeekerSignupScreenState();
}

class _JobSeekerSignupScreenState
    extends State<JobSeekerSignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController =
  TextEditingController();
  final TextEditingController _passwordController =
  TextEditingController();
  final TextEditingController _firstNameController =
  TextEditingController();
  final TextEditingController _lastNameController =
  TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      User? user = userCredential.user;

      // Add job seeker information to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set({
        'uid': user.uid,
        'email': _emailController.text.trim(),
        'type': 'job_seeker',
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
      });

      // Navigate to the home page
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      print('Error during job seeker sign up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Seeker Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldContainer(
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'John.jone@gmail.com',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'At least 6 characters',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'First Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'Last Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                minimumSize: Size(500, 45),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
