import 'package:ai_clean_energy_operations_app/models/user.dart';
import 'package:ai_clean_energy_operations_app/services/auth_service.dart';
import 'package:ai_clean_energy_operations_app/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userStore = Get.find<UserStore>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  // 处理登录逻辑
  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('用户名和密码不能为空')),
      );
      return;
    }
    //
    final res = await login(AuthLoginVO(username: username, password: password));
    if(res.code == 0) {
      await userStore.saveUser(res.data);
      ToastUtils.showSuccess("登录成功");
      // 跳转到 /home
      Get.offAllNamed('/');
    }else{
      ToastUtils.showError(res.message);
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('宣威智慧收运平台'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Add app bar color
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content horizontally
            children: [
              const Icon(Icons.lock_outline, size: 100, color: Colors.white),
              const SizedBox(height: 32.0),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: '密码',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),onPressed: ()=>setState(()=>_obscurePassword = !_obscurePassword))
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: _handleLogin,
                child: const Text('登录'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
