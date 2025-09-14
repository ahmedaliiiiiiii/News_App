// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/resources/article_model.dart';
import 'package:news/ui/resources/color_manager.dart';
import 'package:news/ui/widgets/quick_brief_bottom_sheet.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ArticleWidget({
    super.key,
    required this.article,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => QuickBriefBottomSheet(article: article),
        );
      },
      // onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark
                ? ColorManager.LightContrast
                : ColorManager.DarkContrast,
            width: 2.w,
          ),
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1.w,
              blurRadius: 6.w,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      height: 1.3,
                      color:
                          theme.textTheme.titleLarge?.color ??
                          ColorManager.DarkColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'By: ${article.author ?? 'Unknown'}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color:
                                theme.textTheme.bodySmall?.color ??
                                Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatTimeAgo(article.publishedAt),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color:
                              theme.textTheme.bodySmall?.color ??
                              Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final imageUrl = article.imageUrl;
    final imageHeight = 200.h;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        child: Image.network(
          imageUrl,
          width: double.infinity,
          height: imageHeight,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => Container(
            width: double.infinity,
            height: imageHeight,
            color: Colors.grey[200],
            child: Icon(Icons.broken_image, size: 60.sp, color: Colors.grey),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: imageHeight,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      child: Icon(Icons.image, size: 60.sp, color: Colors.grey),
    );
  }

  String _formatTimeAgo(String? iso) {
    if (iso == null) return 'Just now';
    try {
      final publishedDate = DateTime.parse(iso);
      final now = DateTime.now();
      final difference = now.difference(publishedDate);

      if (difference.inMinutes < 1) return 'Just now';
      if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
      if (difference.inHours < 24) return '${difference.inHours}h ago';
      return '${difference.inDays}d ago';
    } catch (_) {
      return 'Some time ago';
    }
  }
}
