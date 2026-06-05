import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Super Admin', 'role': 'Super Admin', 'status': 'Active'},
      {'name': 'RTA Admin', 'role': 'RTA Administrator', 'status': 'Active'},
      {
        'name': 'Enforcement Officer',
        'role': 'Enforcement Officer',
        'status': 'Active',
      },
      {
        'name': 'Checkpost Officer',
        'role': 'Checkpost Officer',
        'status': 'Suspended',
      },
      {'name': 'Supervisor', 'role': 'Supervisor', 'status': 'Active'},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Users',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      title: Text(user['name']!),
                      subtitle: Text(user['role']!),
                      trailing: Chip(label: Text(user['status']!)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
