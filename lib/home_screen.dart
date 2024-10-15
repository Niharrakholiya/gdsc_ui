import 'package:flutter/material.dart';
import 'main.dart';  // for EventCard class

class HomeScreen extends StatelessWidget {
  final List<EventCard> eventCards = [
    EventCard(
      title: 'DU Hacks Winning Prize',
      description: 'Discover how winning a hackathon can catapult your career and wallet.',
      date: '10/05/2024',
      imagePath: 'assets/images/gdsc image.jpeg',
    ),
    EventCard(
      title: 'How To Win',
      description: 'Learn strategies and tips for success in hackathons.',
      date: '12/05/2024',
      imagePath: 'assets/images/gdsc image.jpeg',
    ),
    EventCard(
      title: 'Hackathon Preparation',
      description: 'Get ready for your next hackathon with these essential tips.',
      date: '15/05/2024',
      imagePath: 'assets/images/gdsc image.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text('UserName', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7, // Make drawer narrower
          color: Colors.blue,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20), // Move elements up
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                _buildDrawerItem(Icons.home, 'Home', isSelected: true),
                _buildDrawerItem(Icons.person, 'Profile'),
                _buildDrawerItem(Icons.group, 'About Us'),
                Divider(color: Colors.blue[200], thickness: 0.5),
                _buildDrawerItem(Icons.bookmark, 'Bookmark'),
                _buildDrawerItem(Icons.notifications, 'Notification'),
                _buildDrawerItem(Icons.message, 'Message'),
                Divider(color: Colors.blue[200], thickness: 0.5),
                _buildDrawerItem(Icons.settings, 'Setting'),
                _buildDrawerItem(Icons.help, 'Help'),
                _buildDrawerItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with new icon
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Upcoming Events, Workshop',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Add some space between TextField and Icon
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              // Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildChip('Hackathon', isSelected: true),
                    _buildChip('Web'),
                    _buildChip('Mobile'),
                    _buildChip('Events'),
                  ],
                ),
              ),
              // DUHacks 4.0 Updates
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('DUHacks 4.0 Updates',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('See more', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              // Event cards
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: eventCards.length,
                  itemBuilder: (context, index) {
                    return _buildEventCard(eventCards[index]);
                  },
                ),
              ),
              // Past Events
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Past Events',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('See more', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              _buildPastEvent('DU Hacks 1.0', '2022'),
              _buildPastEvent('DU Hacks 2.0', '2023'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 16), // Add right margin
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.blue : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        dense: true, // Make the ListTile more compact
        visualDensity: VisualDensity(horizontal: 0, vertical: -2), // Further reduce vertical space
        onTap: () {
          // Handle drawer item tap
        },
      ),
    );
  }
  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildPastEvent(String title, String year) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/gdsc image.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text('Organized in $year'),
      trailing: Icon(Icons.chevron_right),
    );
  }


  Widget _buildBottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.blue),
          Icon(Icons.calendar_today_outlined, color: Colors.grey),
          Icon(Icons.settings_outlined, color: Colors.grey),
          Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildEventCard(EventCard card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 250, // Set a fixed height for the card
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  card.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        card.description,
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Posted On ${card.date}',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


