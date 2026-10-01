import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_demo/razorpay/sucess_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class PaymentViewModel extends ChangeNotifier {
  final Razorpay _razorpay = Razorpay();

  bool _listenersAdded = false;
  bool isLoading=false;

  void startPayment(BuildContext context,String phone,String email) {
    isLoading=true;
    notifyListeners();
    try{
      _setupListeners(context);

      final options = {
        'key': dotenv.env['RAZORPAY_KEY']??'',
        'amount': 10,
        'currency': 'INR',
        'name': 'Razorpay Demo',
        'description': 'Test Payment',
        'prefill':{
          'contact':phone,
          'email':email,
        }
      };

      _razorpay.open(options);
    }catch(e){
      print(" razorpay error :$e");
    }
    finally{
      isLoading=false;
      notifyListeners();
    }

  }

  void _setupListeners(BuildContext context) {
    if (_listenersAdded) return;

    _listenersAdded = true;

    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        debugPrint('Payment Success');
        debugPrint('Payment ID: ${response.paymentId}');
        debugPrint('Order ID: ${response.orderId}');
        debugPrint('Signature: ${response.signature}');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentSuccessScreen(
              paymentId: response.paymentId,
            ),
          ),
        );
      },
    );

    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        debugPrint('Payment Failed');
        debugPrint('Code: ${response.code}');
        debugPrint('Message: ${response.message}');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentFailedScreen(
              message: response.message,
            ),
          ),
        );
      },
    );

    _razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        debugPrint('External Wallet');
        debugPrint('Wallet: ${response.walletName}');
      },
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}