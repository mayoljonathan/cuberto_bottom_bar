import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;

class TabItemNew extends StatefulWidget {
  TabItemNew(
      {@required this.uniqueKey,
      @required this.animationDuration,
      @required this.selected,
      @required this.iconData,
      @required this.title,
      @required this.callbackFunction,
      @required this.textColor,
      @required this.textCurve,
      @required this.iconColor,
      @required this.tabColor});

  final UniqueKey uniqueKey;
  final int animationDuration;
  final String title;
  final IconData iconData;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Curve textCurve;
  final Color iconColor;
  final Color tabColor;


  final double iconYAlign = ICON_ON;
  final double textYAlign = TEXT_OFF;
  final double iconAlpha = ALPHA_ON;
  GlobalKey stickyKey = GlobalKey();

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItemNew> with SingleTickerProviderStateMixin {

  @override
   Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.animationDuration),
      decoration: BoxDecoration(
        color: widget.selected ? widget.tabColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: InkWell(
        onTap: () => widget.callbackFunction(widget.uniqueKey),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          duration: Duration(milliseconds: widget.animationDuration),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                widget.iconData,
                color: widget.selected ? widget.tabColor : widget.iconColor,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: widget.animationDuration),
                padding: widget.selected
                  ? EdgeInsets.symmetric(horizontal: 6.0)
                  : EdgeInsets.all(0.0),
                child: AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: widget.animationDuration),
                  curve: widget.textCurve,
                  child: Text(
                    widget.selected ? widget.title : "",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: widget.selected ? widget.tabColor : widget.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              )
            ],
          ),
        ),
        
      ),
    );
  }
}
