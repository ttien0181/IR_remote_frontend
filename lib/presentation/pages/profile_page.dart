import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/data/models/user.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<User> _loadUser() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) {
      throw Exception('No user ID found');
    }
    final repo = ref.read(usersRepositoryProvider);
    return repo.getUser(userId);
  }

  Future<void> _save(User currentUser) async {
    setState(() {
      _isSaving = true;
    });
    try {
      final repo = ref.read(usersRepositoryProvider);
      await repo.updateUser(
        id: currentUser.id,
        username: _usernameController.text.trim().isEmpty
            ? currentUser.username
            : _usernameController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? currentUser.email
            : _emailController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated')),
        );
        setState(() {}); // trigger reload
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _loadUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Scaffold(
            appBar: AppBar(title: Text('Profile')),
            body: LoadingWidget(message: 'Loading profile...'),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Profile')),
            body: ErrorStateWidget(
              message: snapshot.error.toString(),
              onRetry: () => setState(() {}),
            ),
          );
        }

        final user = snapshot.data!;
        _emailController.text = user.email;
        _usernameController.text = user.username ?? '';

        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                icon: _isSaving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                onPressed: _isSaving ? null : () => _save(user),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account Info',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text('User ID: ${user.id}', style: const TextStyle(color: Colors.grey)),
                        // const SizedBox(height: 8),
                        // Text('Email verified: ${user.emailVerified ? 'Yes' : 'No'}'),
                        if (user.createdAt != null) ...[
                          const SizedBox(height: 8),
                          Text('Created: ${DateFormat('yyyy-MM-dd HH:mm').format(user.createdAt!)}'),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
