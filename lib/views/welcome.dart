import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, this.state}) : super(key: key);
  final int? state;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  final TextStyle _welcomeTextStyle = const TextStyle(
    fontSize: 64,
    color: Colors.white,
  );

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isOn = false;

  @override
  void initState() {
    _prepareAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      leadingWidth: 100,
      leading: Container(
        child: Row(
          children: [
            Text('Hello World'),
          ],
        ),
      ),
    ),
      body: GestureDetector(
        onTap: _toggleText,
        child: Stack(
          
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: Container(
                color: Theme.of(context).primaryColor
              ),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: Text('Hello World!', style: _welcomeTextStyle,)
            ),
          ],
        ),
      ),
    );
  }

  _prepareAnimation() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );
    _offsetAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset (2.5, 0.0)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  }

  _toggleText() {
    print('_toggleText : ${_isOn}');
    if (_isOn) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    _isOn = !_isOn;
  }
}
