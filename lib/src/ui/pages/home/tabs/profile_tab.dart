import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.systemGroupedBackground,
      child: ListView(
        children: [
          const SizedBox(height: 20,),
          Align(
            child: ClipOval(
              child: Image.network(
                "https://i.pinimg.com/236x/e9/57/2a/e9572a70726980ed5445c02e1058760b.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("User information"),
            margin: const EdgeInsets.all(15).copyWith(
              top: 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Colors.white,
            ),
            children: [
              const CupertinoFormRow(
                prefix: Text(
                  "ID: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  "123",
                ),
              ),
              const CupertinoFormRow(
                prefix: Text(
                  "Name: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  "Darwin Morocho",
                ),
              ),
              CupertinoTextFormFieldRow(
                prefix: const Text(
                  "Email: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                initialValue: "test@test.com",
                textAlign: TextAlign.right,
                style: FontStyles.normal.copyWith(
                  color: Colors.black,
                ),
              ),
              const CupertinoFormRow(
                prefix: Text(
                  "Birthday: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  "18 / 12 / 1995",
                ),
              )
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("Payment methods"),
            children: [
              CupertinoFormRow(
                prefix: const Text(
                  "Credit cards",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoButton(
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Show >"),
                ),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Paypal",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoButton(
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  onPressed: () {},
                  child: const Text("test@paypal.com >"),
                ),
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("My Account"),
            children: [
              CupertinoFormRow(
                prefix: const Text(
                  "Remove or hide",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoButton(
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Set configuration"),
                ),
              ),
              CupertinoFormRow(
                prefix: const Text(
                  "Session",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoButton(
                  minSize: 20,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  onPressed: () {},
                  child: const Text("Sign out", style: TextStyle(color: Colors.redAccent),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
