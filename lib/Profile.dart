import 'package:flutter/material.dart';
import 'Blog.dart';
import 'ToolsScreen.dart';
import 'Home_Page.dart';
import 'BottomNavBar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}


class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  // Example user data, replace with your data model or fetch from an API
  String userName = 'John Doe';
  String dateOfBirth = '01/01/1990';
  String phoneNumber = '123-456-7890';

  // Example notification and settings status
  bool isNotificationEnabled = true;
  bool isSwitchEnabled = true;
  bool isCheckboxSelected = true;

  // Default profile image URL
  String defaultImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWfQZi86lGQXqdzCSPKOAbOhCaQUBRPCexU4WUyYKB5LasBNyoynjLy_5-zg&s';

  // User-uploaded image URL (replace this with the actual user image URL)
  String userImageUrl = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          // CustomPaint to draw a semi-ellipse
          CustomPaint(
            painter: SemiEllipsePainter(),
            child: Container(
              height: 120,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFF356899), // Color for the circle avatar
                        backgroundImage: userImageUrl.isEmpty
                            ? NetworkImage(defaultImageUrl)
                            : NetworkImage(userImageUrl),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                buildDetailRow(Icons.person, 'User Name', userName),
                buildDetailRow(Icons.cake, 'Date of Birth', dateOfBirth),
                buildDetailRow(Icons.phone, 'Phone Number', phoneNumber),
                buildDetailRow(Icons.settings, 'Settings', 'Tap to edit', onTap: () {
                  // Handle settings tap
                }),
                ListTile(
                  leading: Icon(Icons.notifications, color: Color(0xFF356899)), // Color for the notification icon
                  title: Text('Activate Notifications'),
                  trailing: Switch(
                    value: isNotificationEnabled ?? false,
                    onChanged: (value) {
                      setState(() {
                        isNotificationEnabled = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.swap_horizontal_circle, color: Color(0xFF356899)), // Color for the switch icon
                  title: Text('Swap to Switch Icon'),
                  trailing: Switch(
                    value: isSwitchEnabled ?? false,
                    onChanged: (value) {
                      setState(() {
                        isSwitchEnabled = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.check_box, color: Color(0xFF356899)), // Color for the checkbox icon
                  title: Text('Checkbox'),
                  trailing: Checkbox(
                    value: isCheckboxSelected ?? false,
                    onChanged: (value) {
                      setState(() {
                        isCheckboxSelected = value ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
]
      ),
    bottomNavigationBar: BottomNavBar(
    currentIndex: _currentIndex,
    onTabTapped: (index) {
    // Handle navigation based on the tapped item
    switch (index) {
    case 0:
      Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage(isUser: true)),
    );
    break;
    case 1:
      Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => BlogPage()),
    );
    break;
    case 2:
      Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ToolsScreen()),
    );
    break;
    case 3:
      Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
    );
    break;
    }
    },
    ),

    );
  }
}



Widget buildDetailRow(IconData icon, String label, String value, {VoidCallback? onTap}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon, color: Color(0xFF356899)), // Color for the detail row icons
    title: Text(label),
    subtitle: Text(value),
  );
}


class SemiEllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF356899); // Color for the semi ellipse

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}