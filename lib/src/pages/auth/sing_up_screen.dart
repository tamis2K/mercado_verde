import 'package:flutter/material.dart';
import 'package:mercado_verde/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mercado_verde/src/pages/common_widgets/custom_text_fild.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});


  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]') },
  );


  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]') },
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),

                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextFild(icon: Icons.email, label: 'Email'),
                        const CustomTextFild(
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                        ),
                        const CustomTextFild(icon: Icons.person, label: 'Nome'),
                        CustomTextFild(
                            icon: Icons.phone, label: 'Celular', inputFormatters: [phoneFormatter],),
                        CustomTextFild(
                            icon: Icons.file_copy, label: 'CPF', inputFormatters: [cpfFormatter],),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
