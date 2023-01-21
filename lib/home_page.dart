import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  bool? isFocus1 = false;
  bool? isFocus2 = false;

  // @override
  // void initState() {
  //   super.initState();
  //   focusNode.addListener(() {
  //     log("Has focus: ${focusNode.hasFocus}");
  //     isFocus = focusNode.hasFocus;
  //     log("Has $isFocus");
  //   });
  // }

  @override
  void initState() {
    focusNode1.addListener(() {
      if (isFocus1 != focusNode1.hasFocus) {
        isFocus1 = focusNode1.hasFocus;
        if (mounted) {
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Suggestion Demo"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              controller: controller1,
              focusNode: focusNode1,
              maxLines: isFocus1! ? 10 : 1,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Auto Suggestion",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          FocusScope(
              child: Focus(
            onFocusChange: (focus) {
              if (isFocus2 != focus) {
                isFocus2 = focus;
                if (mounted) {
                  setState(() {});
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: controller2,
                focusNode: focusNode2,
                maxLines: isFocus2! ? 10 : 2,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: "Auto Suggestion 2",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNode1.removeListener(() {});
    focusNode2.removeListener(() {});
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}
