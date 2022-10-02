import 'package:flutter/material.dart';

final List<List<int>> keys = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

class KeyGen extends StatefulWidget {
  final ValueChanged<String?> onTap;
  const KeyGen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<KeyGen> createState() => _KeyGenState();
}

class _KeyGenState extends State<KeyGen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...keys.map((innerList) {
          return Expanded(
            child: Row(
              children: innerList.map((number) {
                return Expanded(
                  child: Center(
                    child: InkResponse(
                      onTap: () {
                        widget.onTap(number.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "$number",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }),
        Expanded(
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                  child: Center(
                      child: InkResponse(
                onTap: () {
                  widget.onTap("0");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "0",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ))),
              Expanded(
                child: InkResponse(
                  onTap: () {
                    widget.onTap(null);
                  },
                  child: Image.asset(
                    "assets/images/delete_key.png",
                    width: 36,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
