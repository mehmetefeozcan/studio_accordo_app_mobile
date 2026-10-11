import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading {
  /// Renkler temadan okunur (açık / koyu otomatik). İçerideki `Colors.white`
  /// dolgular yalnızca maskedir, görünen renk değildir.
  static Widget _shimmer(Widget child) => Builder(
    builder: (context) => Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: child,
    ),
  );

  static Widget box({double? width, double height = 16, double radius = 8}) {
    return _shimmer(Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  static Widget circle({double size = 40}) {
    return _shimmer(Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  static Widget text({int lines = 1, double? width}) {
    return _shimmer(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(lines, (i) {
          final isLast = i == lines - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: i < lines - 1 ? 8 : 0),
            child: Container(
              width: isLast && lines > 1
                  ? (width ?? double.infinity) * 0.6
                  : (width ?? double.infinity),
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        }),
      ),
    );
  }

  static Widget card({
    double height = 100,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return Padding(
      padding: margin,
      child: _shimmer(Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static Widget listTile({bool hasSubtitle = true}) {
    return _shimmer(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  if (hasSubtitle) ...[
                    const SizedBox(height: 8),
                    Container(
                      height: 12,
                      width: double.infinity * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget profileHeader() {
    return _shimmer(Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 16,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget contentCard({
    double imageHeight = 160,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return Padding(
      padding: margin,
      child: _shimmer(Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: imageHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 12,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget cardList({
    int count = 4,
    double cardHeight = 100,
    double spacing = 12,
  }) {
    return Column(
      children: List.generate(count, (i) {
        return card(
          height: cardHeight,
          margin: EdgeInsets.only(bottom: i < count - 1 ? spacing : 0),
        );
      }),
    );
  }

  static Widget contentCardGrid({
    int count = 4,
    double imageHeight = 140,
    double spacing = 12,
    int crossAxisCount = 2,
  }) {
    final rows = (count / crossAxisCount).ceil();
    return Column(
      children: List.generate(rows, (rowIndex) {
        final startIndex = rowIndex * crossAxisCount;
        final endIndex = (startIndex + crossAxisCount).clamp(0, count);
        return Padding(
          padding: EdgeInsets.only(bottom: rowIndex < rows - 1 ? spacing : 0),
          child: Row(
            children: List.generate(endIndex - startIndex, (colIndex) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: colIndex > 0 ? spacing / 2 : 0,
                    right: colIndex < crossAxisCount - 1 ? spacing / 2 : 0,
                  ),
                  child: contentCard(imageHeight: imageHeight),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
