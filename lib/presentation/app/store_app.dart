import 'package:flutter/material.dart';
import 'package:test/core/network/network_status_wrapper.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      home: NetworkStatusWrapper(
        child: Scaffold(
          appBar: AppBar(title: const Text('Store App')),
          body: const Center(child: Text('🏪 Welcome to Store App')),
        ),
      ),
    );
  }
}
