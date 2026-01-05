import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/providers/providers.dart';
import 'presentation/pages/auth/login_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/widgets/loading_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT IR Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthGuard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthGuard extends ConsumerWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (token) {
        if (token != null && token.isNotEmpty) {
          return const HomePage();
        }
        return const LoginPage();
      },
      loading: () => const Scaffold(
        body: LoadingWidget(message: 'Loading...'),
      ),
      error: (error, stack) => const LoginPage(),
    );
  }
}
