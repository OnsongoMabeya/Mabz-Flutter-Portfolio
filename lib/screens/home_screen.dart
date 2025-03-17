import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, I\'m',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).animate().fadeIn(delay: 200.ms).moveX(),
                const SizedBox(height: 8),
                Text(
                  'John Onsongo',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ).animate().fadeIn(delay: 400.ms).moveX(),
                const SizedBox(height: 16),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppTheme.secondaryColor,
                      ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Software Developer',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Flutter Expert',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX Enthusiast',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Passionate about creating beautiful and functional applications that solve real-world problems.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.lightTextColor,
                        height: 1.5,
                      ),
                ).animate().fadeIn(delay: 600.ms).moveX(),
                const SizedBox(height: 32),
                Row(
                  children: [
                    _buildSocialButton(
                      icon: FontAwesomeIcons.github,
                      url: 'https://github.com/yourusername',
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      icon: FontAwesomeIcons.linkedin,
                      url: 'https://linkedin.com/in/yourusername',
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      icon: FontAwesomeIcons.twitter,
                      url: 'https://twitter.com/yourusername',
                    ),
                  ],
                ).animate().fadeIn(delay: 800.ms),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Download CV'),
                ).animate().fadeIn(delay: 1000.ms).moveX(),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text('Your Image Here'),
              ),
            ).animate().scale(delay: 400.ms),
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
            Text(
              'Hello, I\'m',
              style: Theme.of(context).textTheme.headlineSmall,
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 8),
            Text(
              'John Onsongo',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 400.ms).moveX(),
            const SizedBox(height: 16),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppTheme.secondaryColor,
                  ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Software Developer',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Flutter Expert',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'UI/UX Enthusiast',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text('Your Image Here'),
              ),
            ).animate().scale(delay: 400.ms),
            const SizedBox(height: 24),
            Text(
              'Passionate about creating beautiful and functional applications that solve real-world problems.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                    height: 1.5,
                  ),
            ).animate().fadeIn(delay: 600.ms).moveX(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/yourusername',
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: 'https://linkedin.com/in/yourusername',
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: FontAwesomeIcons.twitter,
                  url: 'https://twitter.com/yourusername',
                ),
              ],
            ).animate().fadeIn(delay: 800.ms),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Download CV'),
              ).animate().fadeIn(delay: 1000.ms).moveX(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
  }) {
    return IconButton(
      icon: FaIcon(icon),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      color: AppTheme.primaryColor,
    );
  }
} 