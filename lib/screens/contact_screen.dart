import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mabz_portfolio/constants/app_theme.dart';
import 'package:mabz_portfolio/widgets/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get in Touch',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ).animate().fadeIn(delay: 200.ms).moveX(),
                  const SizedBox(height: 16),
                  Text(
                    'Let\'s work together on your next project',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.lightTextColor,
                        ),
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: 48),
                  _buildContactForm(context),
                ],
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactInfo(
                    context,
                    'Email',
                    'your.email@example.com',
                    FontAwesomeIcons.envelope,
                    'mailto:your.email@example.com',
                    delay: 600.ms,
                  ),
                  const SizedBox(height: 32),
                  _buildContactInfo(
                    context,
                    'Phone',
                    '+1 234 567 890',
                    FontAwesomeIcons.phone,
                    'tel:+1234567890',
                    delay: 800.ms,
                  ),
                  const SizedBox(height: 32),
                  _buildContactInfo(
                    context,
                    'Location',
                    'City, Country',
                    FontAwesomeIcons.locationDot,
                    null,
                    delay: 1000.ms,
                  ),
                  const SizedBox(height: 48),
                  _buildSocialLinks(context),
                ],
              ),
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
              'Get in Touch',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 200.ms).moveX(),
            const SizedBox(height: 16),
            Text(
              'Let\'s work together on your next project',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 32),
            _buildContactForm(context),
            const SizedBox(height: 48),
            _buildContactInfo(
              context,
              'Email',
              'your.email@example.com',
              FontAwesomeIcons.envelope,
              'mailto:your.email@example.com',
              delay: 600.ms,
            ),
            const SizedBox(height: 24),
            _buildContactInfo(
              context,
              'Phone',
              '+1 234 567 890',
              FontAwesomeIcons.phone,
              'tel:+1234567890',
              delay: 800.ms,
            ),
            const SizedBox(height: 24),
            _buildContactInfo(
              context,
              'Location',
              'City, Country',
              FontAwesomeIcons.locationDot,
              null,
              delay: 1000.ms,
            ),
            const SizedBox(height: 32),
            _buildSocialLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ).animate().fadeIn(delay: 400.ms).moveY(delay: 400.ms),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ).animate().fadeIn(delay: 500.ms).moveY(delay: 500.ms),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ).animate().fadeIn(delay: 600.ms).moveY(delay: 600.ms),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement form submission
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message sent successfully!'),
                  ),
                );
              }
            },
            child: const Text('Send Message'),
          ).animate().fadeIn(delay: 700.ms).moveY(delay: 700.ms),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    String? url,
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
      child: InkWell(
        onTap: url == null ? null : () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(
                icon,
                color: AppTheme.primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.lightTextColor,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: delay).moveX(delay: delay);
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Me',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/yourusername',
              delay: 1200.ms,
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: 'https://linkedin.com/in/yourusername',
              delay: 1400.ms,
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              icon: FontAwesomeIcons.twitter,
              url: 'https://twitter.com/yourusername',
              delay: 1600.ms,
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 1200.ms);
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
    required Duration delay,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: FaIcon(icon),
        onPressed: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        color: AppTheme.primaryColor,
      ),
    ).animate().scale(delay: delay);
  }
} 