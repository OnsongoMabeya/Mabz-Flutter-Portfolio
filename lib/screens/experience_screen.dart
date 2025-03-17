import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
              'Work Experience',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'My professional journey so far',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 48),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _experiences.length,
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              itemBuilder: (context, index) {
                return _buildExperienceCard(
                  context,
                  _experiences[index],
                  isFirst: index == 0,
                  isLast: index == _experiences.length - 1,
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
              'Work Experience',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'My professional journey so far',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _experiences.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return _buildExperienceCard(
                  context,
                  _experiences[index],
                  isFirst: index == 0,
                  isLast: index == _experiences.length - 1,
                  delay: (index * 200).ms,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    Map<String, dynamic> experience,
    {
      required bool isFirst,
      required bool isLast,
      required Duration delay,
    }
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 100,
                color: AppTheme.primaryColor.withOpacity(0.2),
              ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience['role'] as String,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            experience['company'] as String,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppTheme.secondaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      experience['duration'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.lightTextColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    (experience['responsibilities'] as List<String>).length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(
                            child: Text(
                              experience['responsibilities'][index] as String,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.lightTextColor,
                                    height: 1.5,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (experience['technologies'] as List<String>).map((tech) {
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
          ),
        ),
      ],
    ).animate().fadeIn(delay: delay).moveX(delay: delay);
  }

  static final List<Map<String, dynamic>> _experiences = [
    {
      'role': 'Senior Software Engineer',
      'company': 'Tech Company X',
      'duration': '2022 - Present',
      'responsibilities': [
        'Led a team of 5 developers in building a large-scale e-commerce platform using Flutter and Firebase.',
        'Implemented CI/CD pipelines that reduced deployment time by 60%.',
        'Mentored junior developers and conducted code reviews.',
        'Optimized app performance resulting in a 40% reduction in load times.',
      ],
      'technologies': ['Flutter', 'Firebase', 'CI/CD', 'Team Leadership'],
    },
    {
      'role': 'Mobile Developer',
      'company': 'Startup Y',
      'duration': '2020 - 2022',
      'responsibilities': [
        'Developed and maintained multiple mobile applications using Flutter.',
        'Integrated third-party APIs and implemented real-time features.',
        'Collaborated with design team to implement pixel-perfect UI.',
        'Reduced app size by 30% through code optimization.',
      ],
      'technologies': ['Flutter', 'REST APIs', 'UI/UX', 'Git'],
    },
    {
      'role': 'Junior Developer',
      'company': 'Software Corp Z',
      'duration': '2018 - 2020',
      'responsibilities': [
        'Assisted in developing mobile applications using Flutter and React Native.',
        'Fixed bugs and implemented new features in existing applications.',
        'Participated in daily stand-ups and sprint planning meetings.',
        'Wrote unit tests and documentation.',
      ],
      'technologies': ['Flutter', 'React Native', 'Unit Testing', 'Agile'],
    },
  ];
} 