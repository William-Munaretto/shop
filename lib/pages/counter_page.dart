import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context)!.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(provider.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                provider.inc();
              });
              provider.value;
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider.dec();
              });

              provider.value;
            },
            icon: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
