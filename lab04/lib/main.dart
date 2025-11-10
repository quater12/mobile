import 'package:flutter/material.dart';
import './sign_in_screen.dart';
import './reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number 5 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePag(title: '32-ICT Boryslaw'),
    );
  }
}

const double _size = 50.0;
const Color _bgColor = Colors.red;
const Color _borderColor = Colors.black;
const double _borderWidth = 4.0;
const double _borderRadius = 10.0;

class MyHomePag extends StatefulWidget {
  const MyHomePag({super.key, required this.title});

  final String title;

  @override
  State<MyHomePag> createState() => _MyHomePagState();
}

class _MyHomePagState extends State<MyHomePag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'Go to Sign In',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.lock_reset),
            tooltip: 'Reset Password',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildFive(),
      ),
    );
  }

  List<Widget> _buildFive() {
    return [
      _buildFullLine(),   // Top
      _buildLeftSide(),
      _buildFullLine(),   // Middle
      _buildRightSide(),
      _buildFullLine(),
    ];
  }

  Widget _buildFullLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  Widget _buildLeftSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildEmpty(),
      ],
    );
  }

  Widget _buildRightSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}
