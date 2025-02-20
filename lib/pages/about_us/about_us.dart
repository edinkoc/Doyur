import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.blueGrey, // Customize the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image/png011.png'), 
              radius: 75,
            ),
            SizedBox(height: 20),
            Text(
              'Our Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Welcome to the future of shopping, where the world is your marketplace, and every product is just a click away!\n Dont miss out on this revolution in online shopping. Join us on E-Commerce Maps and embark on a shopping journey like no other.\n Your next favorite find is just around the corner or across the globe!Ready to map your way to retail paradise?\n Start exploring today!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Meet the Team',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TeamMemberCard(
              name: 'Edin Koç',
              role: 'CEO',
              image: 'assets/image/edinkoc.jpeg',
            ),
            TeamMemberCard(
              name: 'Edin Koç',
              role: 'Designer',
              image: 'assets/image/edinkoc.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String image;

  TeamMemberCard({required this.name, required this.role, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Text(role),
      ),
    );
  }
}
