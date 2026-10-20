import 'package:flutter/material.dart';

import 'hola_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "category": "CONECTA",
      "title": "Recupera\ntu tiempo",
      "description": "Olvídate del caos. Con Jaxi, encuentra lo que necesitas, agenda y organiza tu día fácilmente.",
    },
    {
      "category": "ORGANIZA",
      "title": "Un solo lugar,\ntodas tus tareas",
      "description": "Gestiona tus pendientes, recibe recordatorios y mantén el control de lo que importa.",
    },
    {
      "category": "SIEMPRE CONTIGO",
      "title": "Tu bienestar,\nnuestra prioridad",
      "description": "Cuida de ti y de los tuyos. Jaxi te acompaña con seguridad, privacidad y un espacio diseñado para ti.",
    },
  ];

  void _irAHolaScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HolaScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF150F3A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon_foreground.png',
                        width: 42,
                        height: 42,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 36,
                            ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Jaxi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: _irAHolaScreen,
                    child: const Text(
                      'Omitir',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  category: onboardingData[index]["category"]!,
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == onboardingData.length - 1) {
                          _irAHolaScreen();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B61FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == onboardingData.length - 1
                                ? "Comenzar"
                                : "Siguiente",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: _irAHolaScreen,
                    child: const Text(
                      '¿Ya tienes cuenta? Inicia sesión',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.category,
    required this.title,
    required this.description,
  });

  final String category, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 1),
          Center(
            child: Image.asset(
              'assets/icon_foreground.png',
              height: 130,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.auto_awesome,
                size: 90,
                color: Color(0xFF7B61FF),
              ),
            ),
          ),
          const Spacer(flex: 2),
          Text(
            category,
            style: const TextStyle(
              color: Color(0xFF7B61FF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
