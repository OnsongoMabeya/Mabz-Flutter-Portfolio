import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: _buildMobileLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Projects',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'Here are some of my notable projects',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                return _buildProjectCard(
                  context,
                  _projects[index],
                  delay: (index * 200).ms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Projects',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'Here are some of my notable projects',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _projects.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return _buildProjectCard(
                  context,
                  _projects[index],
                  delay: (index * 200).ms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    Map<String, dynamic> project,
    {required Duration delay}
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                project['image'] as String,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title'] as String,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project['description'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        if (project['github'] != null)
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              final url = project['github'] as String;
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              }
                            },
                          ),
                        if (project['live'] != null) ...[
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.link,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              final url = project['live'] as String;
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              }
                            },
                          ),
                        ],
                        const Spacer(),
                        ...List.generate(
                          (project['technologies'] as List<String>).length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Chip(
                              label: Text(
                                project['technologies'][index] as String,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.primaryColor,
                                    ),
                              ),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: delay).moveY(delay: delay);
  }

  static final List<Map<String, dynamic>> _projects = [
    {
      'title': 'E-Commerce App',
      'description': 'A full-featured e-commerce application built with Flutter and Firebase.',
      'image': 'https://picsum.photos/800/600',
      'github': 'https://github.com/yourusername/ecommerce-app',
      'live': 'https://ecommerce-app.com',
      'technologies': ['Flutter', 'Firebase', 'Stripe'],
    },
    {
      'title': 'Task Management',
      'description': 'A beautiful and intuitive task management application.',
      'image': 'https://picsum.photos/800/601',
      'github': 'https://github.com/yourusername/task-app',
      'technologies': ['Flutter', 'SQLite', 'Provider'],
    },
    {
      'title': 'Weather App',
      'description': 'A weather application with beautiful animations and real-time updates.',
      'image': 'https://picsum.photos/800/602',
      'github': 'https://github.com/yourusername/weather-app',
      'live': 'https://weather-app.com',
      'technologies': ['Flutter', 'OpenWeather API'],
    },
    {
      'title': 'Social Media App',
      'description': 'A social media platform with real-time messaging and posts.',
      'image': 'https://picsum.photos/800/603',
      'github': 'https://github.com/yourusername/social-app',
      'technologies': ['Flutter', 'Firebase', 'GetX'],
    },
  ];
} 