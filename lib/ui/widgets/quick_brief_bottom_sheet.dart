// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/resources/article_model.dart';
import 'package:news/ui/resources/color_manager.dart';

import '../screens/article_details_screen.dart';

class QuickBriefBottomSheet extends StatelessWidget {
  final Article article;

  const QuickBriefBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? ColorManager.DarkColor : ColorManager.LightContrast,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Preview',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? ColorManager.LightContrast
                          : ColorManager.DarkContrast,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: isDark
                          ? ColorManager.LightContrast
                          : ColorManager.DarkContrast,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Article Image
              if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
                Hero(
                  tag: 'article-preview-${article.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      article.imageUrl!,
                      width: double.infinity,
                      height: 180.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        height: 180.h,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.broken_image,
                          size: 50.sp,
                          color: Colors.grey[400],
                        ),
                        alignment: Alignment.center,
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 180.h,
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
                SizedBox(height: 16.h),

              // Article title
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? ColorManager.LightContrast
                      : ColorManager.DarkContrast,
                  height: 1.3,
                ),
              ),

              SizedBox(height: 12.h),

              // Author and date
              Wrap(
                spacing: 16.w,
                runSpacing: 8.h,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Author section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 14.sp,
                        color: isDark
                            ? ColorManager.GreyLight
                            : ColorManager.GreyDark,
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          article.author ?? 'Unknown author',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: isDark
                                ? ColorManager.GreyLight
                                : ColorManager.GreyDark,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Date section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color: isDark
                            ? ColorManager.GreyLight
                            : ColorManager.GreyDark,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        _formatTimeAgo(article.publishedAt),
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: isDark
                              ? ColorManager.GreyLight
                              : ColorManager.GreyDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Source (if available)
              if (article.source != null && article.source!.isNotEmpty)
                Row(
                  children: [
                    Icon(
                      Icons.source,
                      size: 14.sp,
                      color: isDark
                          ? ColorManager.GreyLight
                          : ColorManager.GreyDark,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      article.source!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: isDark
                            ? ColorManager.GreyLight
                            : ColorManager.GreyDark,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),

              if (article.source != null && article.source!.isNotEmpty)
                SizedBox(height: 12.h),

              // Brief description
              if (article.description != null &&
                  article.description!.isNotEmpty)
                Text(
                  article.description!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: isDark
                        ? ColorManager.LightContrast
                        : ColorManager.DarkContrast,
                    height: 1.5,
                  ),
                ),

              SizedBox(height: 24.h),

              // Action Buttons
              Row(
                children: [
                  SizedBox(width: 4.w),

                  // Show Details Button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailsScreen(article: article),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? ColorManager.AccentBlue
                            : ColorManager.DarkContrast,
                        foregroundColor: ColorManager.LightContrast,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.article, size: 18.sp),
                          SizedBox(width: 8.w),
                          Text(
                            'Read Article',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
      if (difference.inDays < 7) return '${difference.inDays}d ago';

      // For older articles, show the date
      return '${publishedDate.day}/${publishedDate.month}/${publishedDate.year}';
    } catch (_) {
      return 'Some time ago';
    }
  }
}
