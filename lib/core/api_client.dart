import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:loginradius_example/utils/mapper.dart';
import '../utils/responseman.dart';

class ApiAccess extends StatefulWidget {
  const ApiAccess({Key? key}) : super(key: key);

  @override
  State<ApiAccess> createState() => _ApiAccessState();
}



class _ApiAccessState extends State<ApiAccess> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _uController = TextEditingController();
  final _vController = TextEditingController();
  final _wController = TextEditingController();
  final _xController = TextEditingController();
  final _yController = TextEditingController();
  final _zController = TextEditingController();

  bool _isLoading = false;

  // ignore: prefer_typing_uninitialized_variables
  late var response;

  get textControllerFields => {"name", "class"};

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _uController.dispose();
    _vController.dispose();
    _wController.dispose();
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  Future<void> _save(String url) async {
    setState(() {
      _isLoading = true;
    });

    response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(toJson(textControllerFields)),
    );

    createStatusCode(response, context);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _update(String url) async {
    setState(() {
      _isLoading = true;
    });

    response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(toJson(textControllerFields)),
    );

    updateStatusCode(response, context);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _delete(String url) async {
    setState(() {
      _isLoading = true;
    });

    response = await http.delete(
      Uri.parse(url),
    );

    deleteStatusCode(response, context);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _get(String url) async {
    setState(() {
      _isLoading = true;
    });

    response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      fromJson(user, textControllerFields);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error getting record')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VATICAN EXPRESS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      _save("");
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _update("");
                    },
                    child: const Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _delete("");
                    },
                    child: const Text('Delete'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _get("");
                    },
                    child: const Text('View'),
                  ),
                ],
              ),
              if (_isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
