import 'package:flutter/material.dart';
import 'package:mercado_verde/src/config/app_data.dart' as appData;
import 'package:mercado_verde/src/pages/common_widgets/custom_text_fild.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Perfil do usuário',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomTextFild(
              readOnly: true,
              initialValue: appData.user.email,
              icon: Icons.email,
              label: 'Email'),

          // Nome
          CustomTextFild(
              readOnly: true,
              initialValue: appData.user.nome,
              icon: Icons.person,
              label: 'Nome'),

          // Celular
          CustomTextFild(
              readOnly: true,
              initialValue: appData.user.phone,
              icon: Icons.phone,
              label: 'Celular'),

          // CPF
          CustomTextFild(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          // Botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Autualizar senha',
                  style: TextStyle(color: Colors.green)),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Titulo
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Senha atual
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock,
                      label: 'Senha atual',
                    ),
                    // Nova senha
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                    ),
                    // Comfirmar nova senha
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: 'Comfirmar nova senha',
                    ),

                    // Botão para atualizar a senha
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
