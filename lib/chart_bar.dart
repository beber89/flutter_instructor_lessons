import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  final double height;

  ChartBar(this.height, this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return  Wrap(
      direction: isLandscape? Axis.horizontal:Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Container(
              height: isLandscape? 10:height * 0.15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            isLandscape? SizedBox(
              width: height * 0.05,
            ):SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: isLandscape? 10:height * 0.6,
              width: isLandscape? height * 0.6:10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                      height: isLandscape? 10:spendingPctOfTotal*height * 0.6,
                      width: isLandscape? spendingPctOfTotal*height * 0.6:10,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  
                ],
              ),
            ),
            isLandscape? SizedBox(
              width: height * 0.05,
            ):SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: isLandscape? 10:height * 0.15,
              width: isLandscape? height * 0.15:10,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
  }
}
