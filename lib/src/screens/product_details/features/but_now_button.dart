import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({super.key});

  void _handleAddMeToQueueOrBuyNowOnPress() {
    // TODO: Goto ceheckout
    // TODO: confirm delivery address
    // TODO: confirm delivery phonenumber
    // TODO: payment
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
            bool haveMOQ = true;
            if (state.selectedProduct != null) {
              haveMOQ = state.selectedProduct!.moq > 1;
            }

            return ElevatedButton.icon(
              onPressed: _handleAddMeToQueueOrBuyNowOnPress,
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.resolveWith<Size?>(
                    (Set<WidgetState> states) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  return Size(screenWidth - 40, 40);
                }),
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    }
                    return Colors.greenAccent; // Use the component's default.
                  },
                ),
                iconColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    return const Color.fromARGB(
                        255, 26, 26, 26); // Use the component's default.
                  },
                ),
              ),
              icon: haveMOQ
                  ? const Icon(Icons.people)
                  : const Icon(Icons.shopping_bag),
              label: Text(
                haveMOQ ? 'Add me to Queue' : 'Buy now',
                style: const TextStyle(color: Colors.black),
              ),
            );
          }),
        ),
      ),
    );
  }
}
