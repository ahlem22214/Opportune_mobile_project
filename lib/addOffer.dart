import 'package:flutter/material.dart';
import 'jobList.dart';

class AddOffer extends StatelessWidget {
  const AddOffer({Key? key}) : super(key: key);
  static const routeName = '/new offer';

  @override
  // add the company logo on top of the page
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            // Your logo image
            const Image(
              image: AssetImage('assets/logo.png'),
              width: 200.0,
              height: 100.0,
            ),
            const SizedBox(height: 20),
            //add text below
            const Text(
              "ADD A NEW OFFER",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 5, 66, 115),
                fontWeight: FontWeight.w600,
                letterSpacing: 5.0,
                wordSpacing: 10.0,
              ),
            ),
             const SizedBox(height: 20),

             //create form
             Form(
            child: Column(
            children: <Widget>[
           // First set of Text and TextFormField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Title
                 const Text(
                      'Job Title',
                      style: TextStyle(
                      fontSize: 20,
                       color: Color.fromARGB(255, 6, 68, 119),
                      fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 8), // Adjust the spacing as needed

                      // Container with TextFormField
                       Container(
                            width: 600,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                                 ),
                            child: TextFormField(
                            decoration: const InputDecoration(
                            hintText: 'Enter your job title',
                            border: InputBorder.none, // Remove the default border
                                ),
                            ),
                                ),
                                    ],
                              ),

                        const SizedBox(height: 16),

                      // Second set of Text and TextFormField
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           // Title
                          const Text(
                         'Sector',
                          style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 6, 68, 119),
                          fontWeight: FontWeight.bold,
                            ),
                              ),
                            const SizedBox(height: 8), // Adjust the spacing as needed

                        // Container with TextFormField
                          Container(
                          width: 600,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                                  ),
                          child: TextFormField(
                          decoration: const InputDecoration(
                          hintText: 'Specify your sector',
                          border: InputBorder.none, // Remove the default border
                          ),
                                  ),
                          ),

    
                            ],
                                    ),

                          const SizedBox(height: 16),
                        // Third set of Text and TextFormField
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            // Title
                            const Text(
                            'Duration',
                            style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 6, 68, 119),
                            fontWeight: FontWeight.bold,
                            ),
                            ),
                            const SizedBox(height: 8), // Adjust the spacing as needed
                            // Container with TextFormField
                            Container(
                            width: 600,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextFormField(
                            decoration: const InputDecoration(
                            hintText: 'Specify duration',
                            border: InputBorder.none, // Remove the default border
                                                              ),
                                                ),
                                     ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          // Forth set of Text and TextFormField
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            // Title
                            const Text(
                            'Number of offers',
                            style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 6, 68, 119),
                            fontWeight: FontWeight.bold,
                            ),
                            ),
                            const SizedBox(height: 8), // Adjust the spacing as needed

                            // Container with TextFormField
                            Container(
                            width: 600,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Specify number of offers available',
                                border: InputBorder.none, // Remove the default border
                              ),
                            ),
                          ),
                        ],
                      ),

                            const SizedBox(height: 16),
                          // Fifth set of Text and TextFormField
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            // Title
                          const Text(
                                'Requirements',
                                style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 6, 68, 119),
                                fontWeight: FontWeight.bold,
                                ),
                                ),
                                const SizedBox(height: 8), // Adjust the spacing as needed

                                  // Container with TextFormField
                                Container(
                                width: 600,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                decoration: const InputDecoration(
                                hintText: 'Enter requirements',
                                border: InputBorder.none, // Remove the default border
                                ),
                                maxLines: null, // Allow multiple lines
                                textInputAction: TextInputAction.newline,
                                ),
                              ),
                              ],
                                ),

                            const SizedBox(height: 16),
                            // Sixth set of Text and TextFormField
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              // Title
                              const Text(
                              'The link of the form',
                              style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 6, 68, 119),
                              fontWeight: FontWeight.bold,
                              ),
                              ),
                              const SizedBox(height: 8), // Adjust the spacing as needed

                                // Container with TextFormField
                              Container(
                              width: 600,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextFormField(
                              decoration: const InputDecoration(
                              hintText: 'Insert link here',
                              border: InputBorder.none, // Remove the default border
                              ),
                            ),
                          ),
                        ],
                            ),
                                ],
                              ),
                            ),

                        // create a bottom below
                        const SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => JobList(), // Replace YourNewPage with the actual page widget
                            ),
                            );
                            // Add your button's action here
                            },
                        style: ElevatedButton.styleFrom(
                        fixedSize: const Size(10, 10),
                
                          backgroundColor: const Color.fromARGB(255, 5, 68, 120), // Change this to the desired color
                            ),
                          child: const Text(
                            'POST',
                            style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20 ,
                            ),
                            ),
                          ),     
       
            // ...
          ],
        ),
      ),
    );
  }
}
