import 'package:flutter/material.dart';

class ShowDialogScreen extends StatefulWidget {
  const ShowDialogScreen({Key? key}) : super(key: key);

  @override
  State<ShowDialogScreen> createState() => _ShowDialogScreenState();
}

class _ShowDialogScreenState extends State<ShowDialogScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animController;
  late Animation<double> _spinAnimation;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animController.repeat(reverse: false);
    _spinAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.linear
    );

    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('HW2')),
      floatingActionButton: FloatingActionButton(
        onPressed: showSpinningDialog(context),
      ),
    );
  }

  void Function() showSpinningDialog(BuildContext context) {
    return () {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      showDialog(context: context, builder: (context) {
        return Center(
          child: Card(
            child: Container(
              width: width * 0.8,
              height: height * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: RotationTransition(
                      turns: _spinAnimation,
                      child: FlutterLogo(size: 0.5 * width)
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                    child: Text(
                      '플\$러❤️터\n스#터@디\$\n\n즉♠︎시♤가&입',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80, child: TextField()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('싫은')),
                      ElevatedButton(onPressed: () {}, child: Text('좋은')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
    };
  }
}

