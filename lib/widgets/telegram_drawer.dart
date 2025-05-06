import 'package:flutter/material.dart';
import 'drawer_item.dart';

class TelegramDrawer extends StatelessWidget {
  const TelegramDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildHeader(context),
          const SizedBox(height: 8),
          _buildProfileItem(context),
          const Divider(height: 1),
          _buildWalletItem(context),
          const Divider(height: 1),
          ..._buildMainMenuItems(context),
          const Divider(height: 1),
          _buildNightModeItem(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                'https://randomuser.me/api/portraits/men/1.jpg',
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rihana Ahmed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '+251 92 280 8040',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.blue),
      title: const Text('My Profile'),
      onTap: () => _navigateTo(context, 'My Profile'),
    );
  }

  Widget _buildWalletItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_balance_wallet, color: Colors.blue),
      title: const Text('Wallet'),
      onTap: () => _navigateTo(context, 'Wallet'),
    );
  }

  Widget _buildNightModeItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.nightlight_round, color: Colors.blue),
      title: const Text('Night Mode'),
      trailing: Switch(
        value: false,
        onChanged: (value) {},
      ),
      onTap: () {},
    );
  }

  List<Widget> _buildMainMenuItems(BuildContext context) {
    return [
      DrawerItem(
        icon: Icons.group_add,
        title: 'New Group',
        onTap: () => _navigateTo(context, 'New Group'),
      ),
      DrawerItem(
        icon: Icons.campaign,
        title: 'New Channel',
        onTap: () => _navigateTo(context, 'New Channel'),
      ),
      DrawerItem(
        icon: Icons.contacts,
        title: 'Contacts',
        onTap: () => _navigateTo(context, 'Contacts'),
      ),
      DrawerItem(
        icon: Icons.call,
        title: 'Calls',
        onTap: () => _navigateTo(context, 'Calls'),
      ),
      DrawerItem(
        icon: Icons.bookmark_border,
        title: 'Saved Messages',
        onTap: () => _navigateTo(context, 'Saved Messages'),
      ),
      DrawerItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: () => _navigateTo(context, 'Settings'),
      ),
    ];
  }

  void _navigateTo(BuildContext context, String screenName) {
    Navigator.pop(context); // Close the drawer
    // In a real app, you would navigate to different screens
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Navigating to $screenName'),
        content: const Text('In a real app, this would open a new screen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}