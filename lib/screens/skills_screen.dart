import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

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
              'Skills & Expertise',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'Here are some of the technologies and tools I work with',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 48),
            MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              itemCount: _skills.length,
              itemBuilder: (context, index) {
                return _buildSkillCard(
                  context,
                  _skills[index],
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
              'Skills & Expertise',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'Here are some of the technologies and tools I work with',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _skills.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildSkillCard(
                  context,
                  _skills[index],
                  delay: (index * 200).ms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    Map<String, dynamic> skill,
    {required Duration delay}
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              skill['icon'] as IconData,
              color: AppTheme.primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            skill['title'] as String,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            skill['description'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.lightTextColor,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (skill['technologies'] as List<String>).map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tech,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay).moveY(delay: delay);
  }

  static final List<Map<String, dynamic>> _skills = [
    {
      'title': 'Mobile Development',
      'description': 'Building beautiful and performant cross-platform mobile applications.',
      'icon': FontAwesomeIcons.mobile,
      'technologies': ['Flutter', 'Dart', 'Android', 'iOS', 'React Native'],
    },
    {
      'title': 'Frontend Development',
      'description': 'Creating responsive and interactive web applications.',
      'icon': FontAwesomeIcons.code,
      'technologies': ['HTML', 'CSS', 'JavaScript', 'React', 'Vue.js'],
    },
    {
      'title': 'Backend Development',
      'description': 'Developing robust and scalable server-side applications.',
      'icon': FontAwesomeIcons.server,
      'technologies': ['Node.js', 'Python', 'Java', 'SQL', 'MongoDB'],
    },
    {
      'title': 'Cloud Services',
      'description': 'Working with cloud platforms and services.',
      'icon': FontAwesomeIcons.cloud,
      'technologies': ['AWS', 'Firebase', 'Google Cloud', 'Azure'],
    },
    {
      'title': 'UI/UX Design',
      'description': 'Designing intuitive and user-friendly interfaces.',
      'icon': FontAwesomeIcons.pencil,
      'technologies': ['Figma', 'Adobe XD', 'Sketch', 'Prototyping'],
    },
    {
      'title': 'DevOps',
      'description': 'Implementing CI/CD pipelines and deployment automation.',
      'icon': FontAwesomeIcons.gears,
      'technologies': ['Docker', 'Jenkins', 'Git', 'GitHub Actions'],
    },
  ];
} 