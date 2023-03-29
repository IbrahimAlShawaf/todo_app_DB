import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widget/app_color.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      // backgroundColor: AppColors.iconColor1,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    'assets/images/splash.png',
                  )),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: AppColors.buttonColor,
            ),
            child: Text(''),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 90),
              color: Colors.white,
              child: Text(
                'To Do List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.amber.shade900,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.8,
            color: Colors.black,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // ignore: sort_child_properties_last
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.yellow.shade800,
              size: 35,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.amber.shade900,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.yellow.shade800,
              size: 35,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.amber.shade900,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pushNamed('profile');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.yellow.shade800,
              size: 35,
            ),
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.amber.shade900,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pushNamed('setting');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.yellow.shade800,
              size: 35,
            ),
            title: Text(
              'LogOut',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.amber.shade900,
              ),
            ),
            onTap: () async {
              // Update the state of the app
              // ...
              // Then close the drawer
              //SystemNavigator.pop();
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              Navigator.of(context).pushNamed('signinscreen');
            },
          ),
        ],
      ),
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project_app/constant/app_color.dart';
// import 'package:project_app/screens/my_home_page.dart';

// import '../constant/app_text.dart';

// final user = FirebaseAuth.instance.currentUser!;
// Widget MyDrawer() {
//   return Drawer(
//     backgroundColor: AppColors.iconColor1,
//     child: ListView(
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.contain,
//                 image: AssetImage('assets/images/fast-food.png')),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             color: AppColors.mainColor,
//           ),
//           child: Container(
//             child: TextWidget(
//               text: '',
//               color: AppColors.textColor3,
//               size: 18,
//               fontWeight: FontWeight.bold,
//               textalign: TextAlign.center,
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 90),
//             color: AppColors.mainColor,
//             child: TextWidget(
//               text: 'تطبيق وجبتي',
//               color: AppColors.textColor3,
//               size: 24,
//               fontWeight: FontWeight.bold,
//               textalign: TextAlign.center,
//             ),
//           ),
//         ),
//         Center(
//           child: Text(
//             'مرحبـــا',
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Center(
//             child: Text(
//           user.email!,
//           style: GoogleFonts.robotoCondensed(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         )),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: GestureDetector(
//             onTap: (() {
//               FirebaseAuth.instance.signOut();
              
//             }),
//             child: Container(
//               width: 100,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: AppColors.mainColor,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Center(
//                 child: Text(
//                   'Sign Out',
//                   style: GoogleFonts.robotoCondensed(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Divider(
//           thickness: 1,
//         ),
//         // SizedBox(
//         //   height: 10,
//         // ),
//         ListTile(
//           title: const Text('Item 1'),
//           onTap: () {},
//         ),
//         ListTile(
//           title: const Text('Item 2'),
//           onTap: () {},
//         ),
//         ListTile(
//           title: const Text('Item 3'),
//           onTap: () {},
//         ),
//         ListTile(
//           title: const Text('Item 4'),
//           onTap: () {},
//         ),
//       ],
//     ),
//   );
// }
