import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class LoadingDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Container(
//           width: 240,
//           height: 130,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(10)),
//           child: SizedBox(
//             width: 40,
//             height: 40,
//             child: CircularProgressIndicator(
//               strokeWidth: 3,
//               valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget loadingDialog(BuildContext context) {
  return Align(
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(20),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.light,
          ),
        ),
        child: CupertinoActivityIndicator(radius: 20),
      ),
    ),
  );
}
