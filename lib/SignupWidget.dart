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
  final TextEditingController _firstNameController =
  TextEditingController();
  final TextEditingController _lastNameController =
  TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> signUp() async {
    try {
      // Validate all fields are not empty
      if (_emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _companyNameController.text.isEmpty ||
          _domainController.text.isEmpty ||
          _dobController.text.isEmpty ||
          _phoneNumberController.text.isEmpty) {
        showSnackbar('All fields are required');
        return;
      }



      // Validate email format
      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
        showSnackbar('Email format is incorrect');
        return;
      }

      // Validate password length
      if (_passwordController.text.length < 6) {
        showSnackbar('Password must be at least 6 characters');
        return;
      }
      if ( _phoneNumberController.text.length !=8 ) {
        showSnackbar('phone number must be 8 numbers');
        return;
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
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
        'dob': _dobController.text,
        'phoneNumber': _phoneNumberController.text,
      });

      // Navigate to the company home page
      Navigator.of(context).pushReplacementNamed('/company_home');
    } catch (e) {
      print('Error during HR representative sign up: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HR Representative Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                SizedBox(height: 10),
                TextFieldContainer(
                 child:TextFormField(
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
                  controller: _dobController,
                  onTap: () => _selectDate(context), // Open date picker on tap
                  readOnly: true, // Make the text field read-only
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.indigo[700],
                    ),
                    hintText: 'Date of Birth',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFieldContainer(
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.indigo[700],
                    ),
                    hintText: 'Phone Number( 8 Numbers)',
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
  final TextEditingController _firstNameController =
  TextEditingController();
  final TextEditingController _lastNameController =
  TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController =
  TextEditingController();
  final TextEditingController _passwordController =
  TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> signUp() async {

  try {
  // Validate all fields are not empty
  if (_emailController.text.isEmpty ||
  _passwordController.text.isEmpty ||
  _firstNameController.text.isEmpty ||
  _lastNameController.text.isEmpty ||
  _dobController.text.isEmpty ||
  _phoneNumberController.text.isEmpty) {
  showSnackbar('All fields are required');
  return;
  }

  // Validate email format
  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
  showSnackbar('Email format is incorrect');
  return;
  }

  // Validate password length
  if (_passwordController.text.length < 6) {
  showSnackbar('Password must be at least 6 characters');
  return;
  }

  if ( _phoneNumberController.text.length !=8 ) {
    showSnackbar('phone number must be 8 numbers');
    return;
  }


  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  email: _emailController.text.trim(),
  password: _passwordController.text,
  );

  User? user = userCredential.user;

  // Add job seeker information to Firestore
  await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
  'uid': user.uid,
  'email': _emailController.text.trim(),
  'type': 'job_seeker',
  'firstName': _firstNameController.text,
  'lastName': _lastNameController.text,
  'dob': _dobController.text,
  'phoneNumber': _phoneNumberController.text,
  });

  // Navigate to the home page
  Navigator.of(context).pushReplacementNamed('/home');
  } catch (e) {
  print('Error during job seeker sign up: $e');
  }
  }
  void showSnackbar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
  content: Text(message),
  duration: Duration(seconds: 5),
  ),
  );
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Seeker Sign Up'),
      ),
      body: SingleChildScrollView(
    child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              SizedBox(height: 10),
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
                controller: _dobController,
                onTap: () => _selectDate(context), // Open date picker on tap
                readOnly: true, // Make the text field read-only
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'Date of Birth',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.indigo[700],
                  ),
                  hintText: 'Phone Number(8 numbers)',
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
