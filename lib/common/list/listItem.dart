import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:doit/theme/colors.dart';

class ListItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final int id;
  final Function onCheck;
  final Function onDelete;
  final Color titleColor;
  final Color iconColor;
  final Color completedIconColor;

  const ListItem({
    Key? key,
    required this.title,
    required this.isCompleted,
    required this.id,
    required this.onCheck,
    required this.onDelete,
    this.titleColor = CustomColors.headingColor,
    this.iconColor = CustomColors.greyIconColor,
    this.completedIconColor = CustomColors.greenIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () => onCheck(id, isCompleted),
                    child: Icon(
                      isCompleted
                          ? Icons.check_circle
                          : Icons.check_circle_outlined,
                      size: 30,
                      color: isCompleted
                          ? completedIconColor
                          : iconColor.withOpacity(0.4),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                            BoxConstraints listTextConstrains) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: listTextConstrains.maxWidth,
                            ),
                            child: AutoSizeText(
                              title,
                              style: TextStyle(
                                decoration: isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontSize: 20,
                                fontWeight: isCompleted
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                color: titleColor,
                              ),
                              minFontSize: 20,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onDelete(id),
                    child: Icon(
                      Icons.delete,
                      size: 30,
                      color: iconColor.withOpacity(0.3),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
