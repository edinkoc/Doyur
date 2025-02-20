import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black, // Set the background color
        elevation: 0,
          title: const Text(
            'My Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: CircleAvatar(
              maxRadius: 65,
              backgroundImage: AssetImage("assets/image/edinkoc.jpeg"),
              backgroundColor: Colors.transparent, // Set background color to transparent
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Edin Koç",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Text(
            "@edinkoc",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 1, right: 1),
            child: Text(
              "Welcome to your profile. Manage your account settings, orders, and more.",
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Coupon Section",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Get 10% off your next purchase with this coupon!",
            style: TextStyle(fontSize: 16),
          ),
            SizedBox(height: 30),
            _buildProfileCard(
              icon: Icons.history,
              title: 'Order History',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
              },
            ),
            _buildProfileCard(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            _buildProfileCard(
              icon: Icons.location_on,
              title: 'Shipping Addresses',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressManagementPage()));
              },
            ),
            _buildProfileCard(
              icon: Icons.payment,
              title: 'Payment Methods',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodsPage()));
              },
            ),
            _buildProfileCard(
              icon: Icons.settings,
              title: 'Account Settings',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
              },
            ),
            _buildProfileCard(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Implement logout functionality
                // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          _buildProfileCard(
            icon: Icons.phone_iphone_outlined,
            title: '+905321675436',
            onTap: () {
              // Implement logout functionality
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          _buildProfileCard(
            icon: Icons.email,
            title: 'edinnkocc@hotmail.com',
            onTap: () {
              // Implement logout functionality
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          _buildProfileCard(
            icon: Icons.location_on_rounded,
            title: 'Turkey',
            onTap: () {
              // Implement logout functionality
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }
}
