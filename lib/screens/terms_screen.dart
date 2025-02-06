import 'package:flutter/material.dart';

import '../widgets/svg_button.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8 + MediaQuery.of(context).viewPadding.top),
          Row(
            children: [
              const SizedBox(width: 16),
              SvgButton(
                asset: 'assets/back.svg',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'w700',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16 + 58),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Text(
                  'Lorem ipsum',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'w700',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Dolor sit amet, consectetur adipiscing elit. Suspendisse tempus auctor nisi, eu mollis dui porttitor id. Suspendisse eget dapibus ligula. Integer vel eros urna. Curabitur magna dolor, viverra in bibendum sed, maximus ut neque. Quisque dapibus sagittis erat, venenatis finibus orci laoreet vitae. Curabitur et fermentum neque. Pellentesque non ligula id nunc sagittis egestas quis et purus. Dolor sit amet, consectetur adipiscing elit. Suspendisse tempus auctor nisi, eu mollis dui porttitor id. Suspendisse eget dapibus ligula. Integer vel eros urna. Curabitur magna dolor, viverra in bibendum sed, maximus ut neque. Quisque dapibus sagittis erat, venenatis finibus orci laoreet vitae. Curabitur et fermentum neque. Pellentesque non ligula id nunc sagittis egestas quis et purus.',
                  style: TextStyle(
                    color: Color(0xffBCBCBC),
                    fontSize: 14,
                    fontFamily: 'w600',
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
