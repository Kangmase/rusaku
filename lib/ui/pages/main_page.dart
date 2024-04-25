part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.chat_outlined,
                  text: 'Chats',
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  text: 'Shops',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedPage,
              onTabChange: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: ProductPage(),
                ),
                Center(
                  child: Text('Chats'),
                ),
                Center(
                  child: Text('Shops'),
                ),
                Center(
                  child: ProfilePage(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
