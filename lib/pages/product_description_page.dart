import 'package:fishnetlk/model/product/product.dart';
import 'package:fishnetlk/pages/card_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../core/widgets/round_icon_button.dart';
import '../features/chat/presentation/screens/seller_chat_screen.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image ?? '',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(product.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(product.description ?? '',
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.5
                    ),
                  ),
                ),
                product.category == "Boats & machinery"?Text(''):Expanded(
                  child: Column(
                    children: [
                      const Text('Contact with Seller', style: TextStyle(color: Colors.blue),),
                      const SizedBox(height: 10,),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SellerChatScreen(),
                              ),
                            );
                          },
                          child: const RoundIconButton(
                            icon: FontAwesomeIcons.facebookMessenger,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Rs: ${product.price ?? ''}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 3,
              decoration: product.category == "Boats & machinery"?InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  labelText: 'Enter your Contacting Address'
              ):InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                labelText: 'Enter your Billing Address'
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green
                ),
                child: product.category == "Boats & machinery"? Text(
                  'Contact with seller',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ): Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>  product.category == "Boats & machinery"?SellerChatScreen():CardFormScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
