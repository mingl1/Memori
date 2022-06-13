import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notez/main.dart';

class signInWidget extends StatefulWidget {
  final Function() onClickedSignIn;
  const signInWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<signInWidget> createState() => _signInWidgetState();
}

class _signInWidgetState extends State<signInWidget> {
  // bool maleSelected = false;

  // bool femaleSelected = false;

  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFa687ad), Color(0xFF7c86ac)])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF948fbc), Color(0xFFa191bc)]),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 3,
                              color: Colors.black12)
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(200),
                            bottomRight: Radius.circular(200))),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25, left: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Memori',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFa996bb),
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(1, 1),
                                      blurRadius: 5)
                                ]),
                          ),
                          // Text(
                          //   ' Register',
                          //   style: TextStyle(
                          //       fontSize: 30,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.pink.shade600,
                          //       shadows: [
                          //         Shadow(
                          //             color: Colors.black45,
                          //             offset: Offset(1, 1),
                          //             blurRadius: 5)
                          //       ]),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                //   child: TextField(
                //     controller: nameController,
                //     style: const TextStyle(color: Colors.white, fontSize: 14.5),
                //     decoration: InputDecoration(
                //         prefixIconConstraints: const BoxConstraints(minWidth: 45),
                //         prefixIcon: const Icon(
                //           Icons.person,
                //           color: Colors.white70,
                //           size: 22,
                //         ),
                //         border: InputBorder.none,
                //         hintText: 'Enter Username',
                //         hintStyle:
                //             const TextStyle(color: Colors.white60, fontSize: 14.5),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(100)
                //                 .copyWith(bottomRight: const Radius.circular(0)),
                //             borderSide: const BorderSide(color: Colors.white38)),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(100)
                //                 .copyWith(bottomRight: const Radius.circular(0)),
                //             borderSide: const BorderSide(color: Colors.white70))),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white, fontSize: 14.5),
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 45),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white70,
                          size: 22,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Email',
                        hintStyle: const TextStyle(
                            color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.white70))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white, fontSize: 14.5),
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 45),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white70,
                          size: 22,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(minWidth: 45, maxWidth: 46),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                            size: 22,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                            color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.white70))),
                  ),
                ),

                // const SizedBox(
                //   height: 30,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           maleSelected = true;

                //           femaleSelected = false;
                //         });
                //       },
                //       child: Row(
                //         children: [
                //           Container(
                //               height: 20,
                //               width: 20,
                //               alignment: Alignment.center,
                //               margin: const EdgeInsets.only(right: 10),
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(color: Colors.white60)),
                //               child: maleSelected
                //                   ? Container(
                //                       margin: const EdgeInsets.all(4),
                //                       decoration: const BoxDecoration(
                //                           shape: BoxShape.circle,
                //                           color: Colors.white70),
                //                     )
                //                   : const SizedBox()),
                //           const Text('Male',
                //               style: const TextStyle(
                //                   color: Colors.white70, fontSize: 14.5))
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           femaleSelected = true;

                //           maleSelected = false;
                //         });
                //       },
                //       child: Row(
                //         children: [
                //           Container(
                //               height: 20,
                //               width: 20,
                //               alignment: Alignment.center,
                //               margin: const EdgeInsets.only(right: 10),
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(color: Colors.white60)),
                //               child: femaleSelected
                //                   ? Container(
                //                       margin: const EdgeInsets.all(4),
                //                       decoration: const BoxDecoration(
                //                           shape: BoxShape.circle,
                //                           color: Colors.white70),
                //                     )
                //                   : const SizedBox()),
                //           const Text('Female',
                //               style: TextStyle(
                //                   color: Colors.white70, fontSize: 14.5))
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12.withOpacity(.2),
                              offset: const Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(100)
                            .copyWith(bottomRight: const Radius.circular(0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFa687ad), Color(0xFFa191bc)])),
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Don\'t have an account?',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: widget.onClickedSignIn,
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                    ),
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(context: context, barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator(),));


    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
