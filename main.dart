import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// For the To do task hint: consider defining the widget and name of the tabs here
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3','Tab 4'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
// hint for the to do task:Considering creating the different for different tabs
       Container(
        decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tab 1: Styled Text Widget',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Alert Dialog'),
                          content: const Text(' Fortress is cool.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show Alert Dialog'),
                  ),
                ],
              ),
            ),
          ),

              Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.lightBlueAccent,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                         'assets/images/fortress.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 16),

                 
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
         // TAB 3 
          Container(
            color: Colors.orangeAccent, 
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Button pressed in ${tabs[2]} tab!'),
                    ),
                  );
                },
                child: const Text('Click me'),
              ),
            ),
          ),

          // TAB 4 
          Container(
            color: Colors.purpleAccent, 
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
               
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('Who is Fortress?'),
                    subtitle: Text('Fortress is a tech girlie.'),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('More about Fortress(me)'),
                    subtitle: Text('I am a content creator'),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('Item 3'),
                    subtitle: Text('Cards group related info nicely'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
    );
  }
}
          
      

