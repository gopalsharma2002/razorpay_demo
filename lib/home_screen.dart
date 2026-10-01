import 'package:flutter/material.dart';

import 'checkout_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            // =====================================================
            // APP BAR
            // =====================================================

            SliverAppBar(
              backgroundColor: const Color(0xFFF6F8FB),
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,

              title: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF14213D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Demo',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF14213D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Airpay Integration',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7A8499),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF8F0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 7,
                        color: Color(0xFF1FA463),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'SANDBOX',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1FA463),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // =====================================================
            // BODY
            // =====================================================

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),

              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [

                    // -------------------------------------------------
                    // WELCOME TEXT
                    // -------------------------------------------------

                    const Text(
                      'Complete your purchase',
                      style: TextStyle(
                        fontSize: 27,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF14213D),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Securely purchase your plan using our payment gateway.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Color(0xFF727D91),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // PRODUCT IMAGE
                    // -------------------------------------------------

                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        children: [

                          Image.network(
                            'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1000&q=85',
                            height: 210,
                            width: double.infinity,
                            fit: BoxFit.cover,

                            errorBuilder: (
                                context,
                                error,
                                stackTrace,
                                ) {
                              return Container(
                                height: 210,
                                color: const Color(0xFFE8ECF2),
                                child: const Center(
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 55,
                                    color: Color(0xFF9AA4B5),
                                  ),
                                ),
                              );
                            },
                          ),

                          Positioned(
                            top: 14,
                            left: 14,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 11,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.94),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 15,
                                    color: Color(0xFFF5A623),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Popular Plan',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF263248),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    // -------------------------------------------------
                    // PRODUCT TITLE
                    // -------------------------------------------------

                    const Text(
                      'Premium Access',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF14213D),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'One month premium subscription',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7A8499),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // -------------------------------------------------
                    // PRICE
                    // -------------------------------------------------

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '₹ 10',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF14213D),
                          ),
                        ),

                        const SizedBox(width: 7),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            '/ month',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // -------------------------------------------------
                    // FEATURES CARD
                    // -------------------------------------------------

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFE7EBF1),
                        ),
                      ),
                      child: Column(
                        children: [

                          _feature(
                            Icons.check_circle_rounded,
                            'Full premium access',
                          ),

                          const SizedBox(height: 14),

                          _feature(
                            Icons.check_circle_rounded,
                            'Instant payment confirmation',
                          ),

                          const SizedBox(height: 14),

                          _feature(
                            Icons.check_circle_rounded,
                            'Secure Airpay checkout',
                          ),

                          const SizedBox(height: 14),

                          _feature(
                            Icons.check_circle_rounded,
                            '24/7 access',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------------------------------------------------
                    // SECURE PAYMENT INFO
                    // -------------------------------------------------

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF5FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [

                          Icon(
                            Icons.lock_outline_rounded,
                            color: Color(0xFF356AE6),
                            size: 21,
                          ),

                          SizedBox(width: 11),

                          Expanded(
                            child: Text(
                              'Your payment is securely processed through Airpay.',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Color(0xFF45617F),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // BUY NOW BUTTON
                    // -------------------------------------------------

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen(),));
                          // TODO:
                          // Navigate to Checkout Screen
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF14213D),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: 10),

                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 13),

                    const Center(
                      child: Text(
                        'You will be redirected to secure checkout',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8B95A7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // FEATURE WIDGET
  // ===============================================================

  static Widget _feature(
      IconData icon,
      String title,
      ) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Color(0xFF1FA463),
          size: 20,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF354052),
            ),
          ),
        ),
      ],
    );
  }
}