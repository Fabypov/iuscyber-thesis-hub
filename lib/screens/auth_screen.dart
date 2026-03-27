import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  void toggleAuth() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void simulateAuth() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLogin ? "Simulated Login Success!" : "Simulated Registration Success!"),
        backgroundColor: const Color(0xFF926FD8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF17131F),
                  Color(0xFF4B0082),
                  Color(0xFF926FD8),
                ],
              ),
            ),
          ),
          
          // Decorative Blurred Elements
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF926FD8).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFF4B0082).withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          // Blur filter for the background circles
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header Section
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                        boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.shield_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "IusCyber",
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "THESIS HUB",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF926FD8),
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Secure Academic Research Portal",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Auth Card
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email Input
                              _buildLabel("INSTITUTIONAL EMAIL"),
                              const SizedBox(height: 12),
                              _buildTextField(
                                hintText: "email@university.edu",
                                icon: Icons.mail_outline,
                              ),
                              const SizedBox(height: 20),

                              // Password Input
                              _buildLabel(isLogin ? "SECURITY KEY" : "CREATE SECURITY KEY"),
                              const SizedBox(height: 12),
                              _buildTextField(
                                hintText: "••••••••••••",
                                icon: Icons.lock_outline,
                                isPassword: true,
                              ),
                              
                              if (!isLogin) ...[
                                  const SizedBox(height: 20),
                                  _buildLabel("CONFIRM KEY"),
                                  const SizedBox(height: 12),
                                  _buildTextField(
                                      hintText: "••••••••••••",
                                      icon: Icons.lock_outline,
                                      isPassword: true,
                                  ),
                              ],

                              const SizedBox(height: 16),
                              
                              // Checkbox and Link (Login Only)
                              if (isLogin)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Checkbox(
                                              value: true,
                                              onChanged: (_) {},
                                              activeColor: const Color(0xFF926FD8),
                                              side: const BorderSide(color: Colors.grey),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Remember me",
                                            style: GoogleFonts.inter(fontSize: 12, color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Forgot Access?",
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: const Color(0xFF926FD8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),

                              const SizedBox(height: 24),

                              // Action Button
                              ElevatedButton(
                                onPressed: simulateAuth,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF926FD8),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 5,
                                  shadowColor: const Color(0xFF926FD8).withOpacity(0.25),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      isLogin ? "ACCESS HUB" : "REGISTER ACCESS",
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Toggle Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLogin ? "Need institutional credentials?" : "Already have access?",
                          style: GoogleFonts.inter(fontSize: 12, color: Colors.white54),
                        ),
                        TextButton(
                          onPressed: toggleAuth,
                          child: Text(
                            isLogin ? "Register Department Access" : "Login to Access",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFF926FD8),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 48),

                    // Footer Branding
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 1, width: 32, color: Colors.white24),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(Icons.verified_user_outlined, color: Colors.white54, size: 16),
                              SizedBox(width: 8),
                              Text(
                                "ENCRYPTED CONNECTION",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white54,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 1, width: 32, color: Colors.white24),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "ACADEMIC PARTNER 2024",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
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
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.9),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required IconData icon, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.4)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        ),
      ),
    );
  }
}
