import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_demo/razorpay/payment_viewmodel.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // ============================================================
  // FORM CONTROLLERS
  // ============================================================

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // ============================================================
  // FORM KEY
  // ============================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ============================================================
  // PRODUCT DATA
  // ============================================================

  final String productName = 'Premium Access';
  final double productPrice = 10.00;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8FB),
        elevation: 0,
        scrolledUnderElevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF14213D),
          ),
        ),

        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Color(0xFF14213D),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Form(
        key: _formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // HEADING
              // ==================================================

              const Text(
                'Complete your details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF14213D),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Enter your details to continue with the payment.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Color(0xFF7A8499),
                ),
              ),

              const SizedBox(height: 25),

              // ==================================================
              // CUSTOMER INFORMATION TITLE
              // ==================================================

              const Text(
                'Customer Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF263248),
                ),
              ),

              const SizedBox(height: 15),

              // ==================================================
              // NAME
              // ==================================================

              _buildLabel('Full Name'),

              const SizedBox(height: 8),

              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,

                decoration: _inputDecoration(
                  hintText: 'Enter your full name',
                  icon: Icons.person_outline_rounded,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // ==================================================
              // EMAIL
              // ==================================================

              _buildLabel('Email Address'),

              const SizedBox(height: 8),

              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,

                decoration: _inputDecoration(
                  hintText: 'Enter your email',
                  icon: Icons.email_outlined,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final emailRegex = RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  );

                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // ==================================================
              // PHONE
              // ==================================================

              _buildLabel('Phone Number'),

              const SizedBox(height: 8),

              TextFormField(
                controller: phoneController,

                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,

                maxLength: 10,

                decoration: _inputDecoration(
                  hintText: 'Enter 10-digit phone number',
                  icon: Icons.phone_outlined,
                ).copyWith(
                  counterText: '',
                  prefixText: '+91  ',
                  prefixStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF354052),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }

                  if (value.trim().length != 10) {
                    return 'Please enter a valid 10-digit number';
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                    return 'Only numbers are allowed';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 28),

              // ==================================================
              // ORDER SUMMARY
              // ==================================================

              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF263248),
                ),
              ),

              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE5E9F0),
                  ),
                ),

                child: Column(
                  children: [

                    // Product
                    Row(
                      children: [

                        Container(
                          height: 48,
                          width: 48,

                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF2F8),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.workspace_premium_rounded,
                            color: Color(0xFF14213D),
                            size: 25,
                          ),
                        ),

                        const SizedBox(width: 13),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                productName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF263248),
                                ),
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                '1 month subscription',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8993A5),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          '₹${productPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF14213D),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Divider(
                      color: Color(0xFFE8EBF0),
                      height: 1,
                    ),

                    const SizedBox(height: 16),

                    // Subtotal
                    _priceRow(
                      title: 'Subtotal',
                      amount: '₹${productPrice.toStringAsFixed(0)}',
                    ),

                    const SizedBox(height: 10),

                    // Payment gateway fee
                    _priceRow(
                      title: 'Payment Gateway Fee',
                      amount: '₹0',
                    ),

                    const SizedBox(height: 15),

                    const Divider(
                      color: Color(0xFFE8EBF0),
                      height: 1,
                    ),

                    const SizedBox(height: 15),

                    // Total
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        const Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF263248),
                          ),
                        ),

                        Text(
                          '₹${productPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF14213D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ==================================================
              // SECURITY INFO
              // ==================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: const Color(0xFFEEF5FF),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Icon(
                      Icons.lock_outline_rounded,
                      color: Color(0xFF356AE6),
                      size: 21,
                    ),

                    SizedBox(width: 11),

                    Expanded(
                      child: Text(
                        'Your payment details are securely processed through Airpay.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.45,
                          color: Color(0xFF45617F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ==================================================
              // PAY BUTTON
              // ==================================================

              SizedBox(
                width: double.infinity,
                height: 56,

                child: Consumer<PaymentViewModel>(
                  builder: (context, vm, child) =>
                   ElevatedButton(
                    // onPressed: isLoading ? null : _onPayPressed,
                    onPressed: () {
                      _onPayPressed(vm);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF14213D),
                      foregroundColor: Colors.white,
                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: vm.isLoading
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                        : Text('Pay ₹${productPrice.toStringAsFixed(0)}'),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  'Secure checkout powered by Razorpay',
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
    );
  }

  // ============================================================
  // PAY BUTTON
  // ============================================================
  void _onPayPressed(PaymentViewModel vm) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    vm.startPayment(context,emailController.text.trim(),phoneController.text.trim());
  }


  InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,

      hintStyle: const TextStyle(
        fontSize: 13,
        color: Color(0xFFA0A8B7),
      ),

      prefixIcon: Icon(
        icon,
        size: 20,
        color: const Color(0xFF7B879A),
      ),

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFE3E7EE),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFE3E7EE),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFF14213D),
          width: 1.4,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.4,
        ),
      ),
    );
  }

  // ============================================================
  // LABEL
  // ============================================================

  Widget _buildLabel(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF354052),
      ),
    );
  }

  // ============================================================
  // PRICE ROW
  // ============================================================

  Widget _priceRow({
    required String title,
    required String amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF7A8499),
          ),
        ),

        Text(
          amount,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF354052),
          ),
        ),
      ],
    );
  }
}