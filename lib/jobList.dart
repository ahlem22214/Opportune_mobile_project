import 'package:flutter/material.dart';
import 'customShape.dart';
import 'addOffer.dart';

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  //create the upper bar 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 5, 68, 120),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Text(
              "BUSINESS ACCOUNT",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 9, 97, 169),
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                wordSpacing: 10.0,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
            const Image(
              image: AssetImage('assets/logo.png'),
              width: 200.0,
              height: 100.0,
            ),

            //create boxes contain
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                children: [
                  buildJobContainer(
                    "Data Scientist",
                    'Analyzes complex data for insights and predictive models....',
                    "See more",
                    "08/11/2023",
                    "https://media.istockphoto.com/id/1364317541/photo/data-scientists-hand-of-programmer-touching-and-analyzing-development-at-various-information.jpg?s=1024x1024&w=is&k=20&c=0LJ_XGEmgYHishExWKpzEfCGq1Fk6_6tZSxYRe_PQn4=",
                  ),
                  buildJobContainer(
                    "Mobile Developer",
                    'Designs smartphone apps for usability.....',
                    "See more",
                    "08/11/2023",
                    "https://appinventiv.com/wp-content/uploads/sites/1/2017/06/Effective-Ways-to-Choose-the-Best-Mobile-App-Developer.jpg",
                  ),
                  buildJobContainer(
                    "Data Analysis",
                    "Examines data for patterns and decisions......",
                    "See more",
                    "08/11/2023",
                    "https://www.techrepublic.com/wp-content/uploads/2015/09/dataanalysisistockrobuart.jpg",
                  ),
                  buildJobContainer(
                    "Web Developer",
                    "Builds and maintains websites for functionality.....",
                    "See more",
                    "08/11/2023",
                    "https://thumbs.dreamstime.com/b/web-development-coding-programming-internet-technology-business-concept-web-development-coding-programming-internet-technology-121903546.jpg",
                  ),
                  // Add more job details as needed
                ],
              ),
            ),

            //add bottom
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddOffer(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 5, 68, 120),
              ),
              child: const Text(
                'ADD A NEW OFFER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobContainer(String title, String description, String view, String date, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      view,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
      ],
    ),
  );
}
}