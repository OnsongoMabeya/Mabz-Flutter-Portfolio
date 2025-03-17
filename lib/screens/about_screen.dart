import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: _buildMobileLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text('Your Professional Image Here'),
              ),
            ).animate().scale(delay: 200.ms),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ).animate().fadeIn(delay: 400.ms).moveX(),
                const SizedBox(height: 24),
                _buildAboutSection(
                  context,
                  'Background',
                  'I am a passionate software developer with expertise in Flutter, mobile app development, and web technologies. With a strong foundation in computer science and years of hands-on experience, I specialize in creating beautiful, functional, and user-friendly applications.',
                ).animate().fadeIn(delay: 600.ms),
                const SizedBox(height: 24),
                _buildAboutSection(
                  context,
                  'Education',
                  'Bachelor of Science in Computer Science\nUniversity Name, 20XX - 20XX',
                ).animate().fadeIn(delay: 800.ms),
                const SizedBox(height: 24),
                _buildAboutSection(
                  context,
                  'Interests',
                  '• Mobile App Development\n• UI/UX Design\n• Cloud Computing\n• Machine Learning',
                ).animate().fadeIn(delay: 1000.ms),
              ],
            ),
          ),
        ],
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
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text('Your Professional Image Here'),
              ),
            ).animate().scale(delay: 200.ms),
            const SizedBox(height: 40),
            Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 400.ms).moveX(),
            const SizedBox(height: 24),
            _buildAboutSection(
              context,
              'Background',
              'I am a passionate software developer with expertise in Flutter, mobile app development, and web technologies. With a strong foundation in computer science and years of hands-on experience, I specialize in creating beautiful, functional, and user-friendly applications.',
            ).animate().fadeIn(delay: 600.ms),
            const SizedBox(height: 24),
            _buildAboutSection(
              context,
              'Education',
              'Bachelor of Science in Computer Science\nUniversity Name, 20XX - 20XX',
            ).animate().fadeIn(delay: 800.ms),
            const SizedBox(height: 24),
            _buildAboutSection(
              context,
              'Interests',
              '• Mobile App Development\n• UI/UX Design\n• Cloud Computing\n• Machine Learning',
            ).animate().fadeIn(delay: 1000.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.secondaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.lightTextColor,
                height: 1.6,
              ),
        ),
      ],
    );
  }
} 