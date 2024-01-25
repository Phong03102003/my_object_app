import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int _value;
  MyObject(
    this._value,
  );
  // Phương thức tăng giá trị
  void increment() {
    _value++;
  }

  // Phương thức giảm giá trị
  void decrement() {
    _value--;
  }

  int get() {
    return _value;
  }

  // Phương thức trả về giá trị hiện tại
  set value(int value) {
    this.value = value;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyObject? _myObject;
  String? title;

  @override
  void initState() {
    super.initState();
    _myObject = MyObject(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Giá trị: ${_myObject?._value ?? 0}',
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _myObject?.decrement();
                      setState(() {});
                    },
                    child: const Text('Giảm'),
                  ),
                  const SizedBox(width: 10), // Thêm khoảng cách giữa các nút
                  OutlinedButton(
                    onPressed: () {
                      _myObject?.increment();
                      setState(() {});
                    },
                    child: const Text('Tăng'),
                  ),

                  const SizedBox(width: 10), // Thêm khoảng cách giữa các nút
                  OutlinedButton(
                    onPressed: () {
                      _myObject?._value = 10; // Gọi phương thức set _value
                      setState(() {});
                    },
                    child: const Icon(Icons.restart_alt),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
