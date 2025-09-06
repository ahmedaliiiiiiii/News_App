import 'package:flutter/material.dart';
import 'package:news/ui/resources/assets_manager.dart';
import 'package:news/ui/resources/color_manager.dart';

class SourceContent extends StatelessWidget {
  final String source;
  final String category;

  const SourceContent({
    super.key,
    required this.source,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.fromBorderSide(
              BorderSide(color: ColorManager.DarkColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(AssetManager.ContentExample),
                SizedBox(height: 10),
                Text(
                  "40-year-old man falls 200 feet to his death while canyoneering at national park",
                  style: TextStyle(
                    color: ColorManager.DarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By : Jon Haworth",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "15 minutes ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
