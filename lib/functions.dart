import 'package:bmi_calculator/screens/Input.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// smallcontainetr() {
//   return Expanded(
//     child: Container(
//       margin: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//           color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10.0)),
//     ),
//   );
// }

// bigcontainer() {
//   return Expanded(
//     child: Container(
//       margin: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//           color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10.0)),
//     ),
//   );
// }

class container extends StatelessWidget {
  container({required this.colour, required this.ContainerChild});
  Color colour;
  final Widget ContainerChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContainerChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

class ContainerInput extends StatelessWidget {
  ContainerInput({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: klabelTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
