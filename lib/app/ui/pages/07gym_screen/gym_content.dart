import 'package:flutter/material.dart';

class GymContent extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color titleColor;
  final Function() onTap;
  final Color bgColor;
  final Color subTitleColor;
  final String bSubTitile;
  final String image;

  const GymContent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.titleColor,
    required this.bgColor,
    required this.subTitleColor,
    required this.bSubTitile,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: titleColor,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: subTitleColor,
                  ),
                ),
                Text(
                  bSubTitile,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: subTitleColor,
                  ),
                ),
              ],
            ),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}
