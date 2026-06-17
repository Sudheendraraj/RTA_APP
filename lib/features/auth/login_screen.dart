import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/loading_overlay.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_notifier.dart';
import '../../core/constants/app_constants.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _captchaController = TextEditingController();
  bool _rememberMe = true;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    if (_captchaController.text.trim().toLowerCase() != 'rta2026') {
      setState(() {
        _errorMessage = 'Please enter the correct captcha.';
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final controller = ref.read(authNotifierProvider.notifier);
      await controller.login(
        _usernameController.text.trim(),
        _passwordController.text,
        _rememberMe,
      );
      if (mounted) {
        context.go(AppRoutes.dashboard);
      }
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F5D55), Color(0xFF0A5048)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.8, -0.8),
                    radius: 1.2,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1040),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.18),
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            SizedBox(
                              width: 140,
                              child: _buildPortraitCard(
                                label: 'Sri A. Revanth Reddy',
                                subtitle: "Hon'ble Chief Minister",
                                assetPath: 'assets/images/revanth.png',
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 260,
                                maxWidth: 520,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'VIEAS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Vehicle Identification and Enforcement Automation System',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: _buildPortraitCard(
                                label: 'Sri Ponnam Prabhakar',
                                subtitle: "Hon'ble Minister for Transport",
                                assetPath: 'assets/images/ponnam.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.14),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 32,
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 36,
                            horizontal: 44,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'RTA Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Government of Telangana Transport Department',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 30),
                              if (_errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _usernameController,
                                      decoration: _buildLoginInputDecoration(
                                        hintText: 'Username',
                                        icon: Icons.person,
                                      ),
                                      validator: (value) =>
                                          value?.isEmpty == true
                                          ? 'Enter username'
                                          : null,
                                    ),
                                    const SizedBox(height: 18),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: _buildLoginInputDecoration(
                                        hintText: 'Password',
                                        icon: Icons.lock,
                                      ),
                                      validator: (value) =>
                                          value?.isEmpty == true
                                          ? 'Enter password'
                                          : null,
                                    ),
                                    const SizedBox(height: 18),
                                    TextFormField(
                                      controller: _captchaController,
                                      decoration: _buildLoginInputDecoration(
                                        hintText: 'Captcha (enter rta2026)',
                                        icon: Icons.shield,
                                      ),
                                      validator: (value) =>
                                          value?.isEmpty == true
                                          ? 'Enter captcha'
                                          : null,
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) => setState(
                                            () => _rememberMe = value ?? true,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          fillColor: WidgetStateProperty.all(
                                            Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Remember Me',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: _login,
                                        child: const Text('Login'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static InputDecoration _buildLoginInputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon, color: Colors.white70),
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 0.14),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Colors.white70, width: 1.5),
      ),
      hintStyle: const TextStyle(color: Colors.white70),
      labelStyle: const TextStyle(color: Colors.white70),
    );
  }

  Widget _buildPortraitCard({
    required String label,
    required String subtitle,
    String? assetPath,
  }) {
    return Column(
      children: [
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.18),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipOval(
            child: assetPath != null
                ? Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: 76,
                    height: 76,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.person,
                      color: Color(0xFF0B7166),
                      size: 38,
                    ),
                  )
                : const Icon(Icons.person, color: Color(0xFF0B7166), size: 38),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
