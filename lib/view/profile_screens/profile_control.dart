import 'package:flutter/material.dart';
import 'package:reskill_x/view/profile_screens/profile_screen.dart';

final homeKey = GlobalKey<NavigatorState>();

class ProfileControl extends StatelessWidget {
  const ProfileControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Navigator(
        key: homeKey,
        initialRoute: ProfileScreen.route,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case ProfileScreen.route:
              builder = (BuildContext _) => ProfileScreen();
              break;
            default:
              builder = (BuildContext _) => ProfileScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
