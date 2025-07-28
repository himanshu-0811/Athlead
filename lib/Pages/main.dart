import 'package:flutter/material.dart';

class Athlead extends StatelessWidget {
  const Athlead({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const AndroidCompact2(),
    );
  }
}

class AndroidCompact2 extends StatelessWidget {
  const AndroidCompact2({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, -0.7),
              end: Alignment(0.50, 1.00),
              colors: [
                Color(0xFF525832),
                Color(0xFF282A18),
                Color(0xFF1D1D1D),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 0), // leave space for fixed buttons
            child: Column(
              children: [
                // Top Logo and Avatar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Logo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Container(
                        width: width * 0.11,
                        height: width * 0.11,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                // Banner Image
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Container(
                    width: double.infinity,
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/football.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.020),

                Text(
                  'Pick your sport',
                  style: TextStyle(
                    color: const Color(0xFFEBECE6),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),

                SizedBox(height: height * 0.017),

                Wrap(
                  spacing: width * 0.05,
                  runSpacing: height * 0.03,
                  children: [
                    sportCard('assets/soccer.jpg', 'FOOTBALL', width),
                    sportCard('assets/chess.jpg', 'CHESS', width),
                    sportCard('assets/cricket.jpg', 'CRICKET', width),
                    sportCard('assets/cricket.jpg', 'CRICKET', width),
                  ],
                ),

                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),

      // Fixed Bottom Buttons
      bottomNavigationBar: Container(
        color: const Color(0xFF1D1D1D),
        padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: navButton('Join')),
            const SizedBox(width: 10),
            Expanded(child: navButton('Home')),
            const SizedBox(width: 10),
            Expanded(child: navButton('Host')),
          ],
        ),
      ),
    );
  }

  Widget sportCard(String asset, String label, double width) {
    return Container(
      width: width * 0.4,
      height: width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              asset,
              width: width * 0.4,
              height: width * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          // Centered white text directly over image (no box)
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFFEBECE6),
              fontSize: width * 0.05,
              fontFamily: 'Impact',
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget navButton(String title) {
    return ElevatedButton(
      onPressed: () {
        print('$title button pressed');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A3A3A),
        foregroundColor: const Color(0xFFEBECE6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(title),
    );
  }
}
