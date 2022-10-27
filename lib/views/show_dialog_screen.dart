import 'package:flutter/material.dart';
import 'package:kucc_flutter/model/local_contact.dart';
import 'package:kucc_flutter/services/local_contacts_service.dart';

class ShowDialogScreen extends StatefulWidget {
  const ShowDialogScreen({Key? key}) : super(key: key);

  @override
  State<ShowDialogScreen> createState() => _ShowDialogScreenState();
}

class _ShowDialogScreenState extends State<ShowDialogScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _spinAnimation;
  late TextEditingController _dialogTextController;

  final List<LocalContact> contacts = <LocalContact>[
    LocalContact(name: 'Keo'),
    LocalContact(name: 'Taewung'),
  ];

  @override
  void initState() {
    _addLocalContacts();
    _dialogTextController = TextEditingController();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animController.repeat(reverse: false);
    _spinAnimation =
        CurvedAnimation(parent: _animController, curve: Curves.linear);

    super.initState();
  }

  @override
  void dispose() {
    _dialogTextController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _addLocalContacts() async {
    var localContacts = await LocalContactsService.getLocalContacts();
    if (localContacts != null) {
      setState(() {
        contacts.addAll(localContacts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HW2')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.perm_contact_calendar_sharp),
            title: Text(contacts[index].name),
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: showSpinningDialog(context),
      ),
    );
  }

  void _addContact(LocalContact contact) {
    setState(() {
      contacts.add(contact);
    });
    LocalContactsService.addContact(contact);
  }

  void Function() showSpinningDialog(BuildContext context, ) {
    return () {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Card(
                child: Container(
                  width: width * 0.8,
                  height: height * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: RotationTransition(
                            turns: _spinAnimation,
                            child: FlutterLogo(size: 0.5 * width)),
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
                      SizedBox(height: 80, child: TextField(
                        controller: _dialogTextController,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(40, 40),
                          ),
                              child: Text('싫은'),),
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);

                            if (_dialogTextController.text != '') {
                              _addContact(LocalContact(
                                  name: _dialogTextController.text,
                                  familyName: _dialogTextController.text,
                                  givenName: _dialogTextController.text,
                              ));
                            }
                          }, child: Text('좋은')),
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
