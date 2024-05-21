import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> seats = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Seat Selection'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(10, (index) {
                return SeatButton(
                    index: index,
                    isSelected: seats[index],
                    onPressed: () {
                      setState(() {
                        seats[index] = !seats[index];
                      });
                    },
                    key: const Key('index'));
              }),
            ),
          ),
          ElevatedButton(
            child: const Text('Book Selected Seats'),
            onPressed: () {
              // TODO: Implement booking logic
            },
          ),
        ],
      ),
    );
  }
}

class SeatButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;

  const SeatButton({
    required Key key,
    required this.index,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Seat $index'),
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Colors.green : Colors.grey)),
    );
  }
}
