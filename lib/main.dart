import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';
import '../../providers/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'screens/common/splash_screen.dart';
import 'screens/common/role_selection_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auditor/auditor_dashboard.dart';
import 'screens/contractor/contractor_dashboard.dart';
import 'screens/admin/admin_dashboard.dart';

void main() {
  runApp(const RoadLensApp());
}

class RoadLensApp extends StatelessWidget {
  const RoadLensApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'RoadLens',
        theme: AppTheme.getLightTheme(),
        darkTheme: AppTheme.getDarkTheme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          AppRoutes.splash: (context) => SplashScreen(),
          AppRoutes.roleSelection: (context) => RoleSelectionScreen(),
          AppRoutes.login: (context) => LoginScreen(),
          AppRoutes.auditorDashboard: (context) => AuditorDashboard(),
          AppRoutes.contractorDashboard: (context) => ContractorDashboard(),
          AppRoutes.adminDashboard: (context) => AdminDashboard(),
        },
        onGenerateRoute: (settings) {
          // Handle dynamic routes if needed
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('Route not found: ${settings.name}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
