import 'package:flutter/material.dart';
import 'package:mercado_verde/src/config/app_data.dart' as appData;
import 'package:mercado_verde/src/pages/orders/components/order_title.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Pedidos', style: TextStyle(color: Colors.white),),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10,), 
        itemBuilder: (_, index) => OrderTile(order: appData.orders[index]),
        
        itemCount: appData.orders.length,
      ),
    );
  }
}