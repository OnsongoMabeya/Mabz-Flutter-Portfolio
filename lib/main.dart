import 'package:flutter/material.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/screens/about_screen.dart';
import 'package:mabz_portfolio/screens/contact_screen.dart';
import 'package:mabz_portfolio/screens/experience_screen.dart';
import 'package:mabz_portfolio/screens/home_screen.dart';
import 'package:mabz_portfolio/screens/projects_screen.dart';
import 'package:mabz_portfolio/screens/skills_screen.dart';
import 'package:mabz_portfolio/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Onsongo - Portfolio',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: _buildSelectedScreen(),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Text(
                'MABZ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            _buildDrawerItem('Home', 0),
            _buildDrawerItem('About', 1),
            _buildDrawerItem('Skills', 2),
            _buildDrawerItem('Projects', 3),
            _buildDrawerItem('Experience', 4),
            _buildDrawerItem('Contact', 5),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AboutScreen();
      case 2:
        return const SkillsScreen();
      case 3:
        return const ProjectsScreen();
      case 4:
        return const ExperienceScreen();
      case 5:
        return const ContactScreen();
      default:
        return const HomeScreen();
    }
  }

  Widget _buildDrawerItem(String title, int index) {
    return ListTile(
      title: Text(title),
      selected: _selectedIndex == index,
      onTap: () {
        setState(() {
          _selectedIndex = index;
          Navigator.pop(context);
        });
      },
    );
  }
}
