import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../config/app_manager/app_manager_cubit.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final dynamic product;
  final double? width, height;
  final double? iconWidth, iconHeight;
  final Color? backgroundColor;

  FavoriteButtonWidget({
    super.key,
    required this.product,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.backgroundColor,
  });

  bool isFavorite = false;

  _toggleFavorite(BuildContext context) {
    if (isFavorite) {
      context.read<FavoritesCubit>().removeFromFavorites(product.id);
      context.successSnackBar("${product.name} removed from your favorites");
    } else {
      context.read<FavoritesCubit>().addToFavorites(product.id);
      context.successSnackBar("${product.name} added to your favorites");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppManagerCubit>().isUserLoggedIn
            ? _toggleFavorite(context)
            : context.errorSnackBar("Please login to add to favorites");
      },
      child: Container(
        width: width ?? 28.r,
        height: height ?? 28.r,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.whiteGrey,
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.center,
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          buildWhen: (previous, current) {
            if (current is FavoritesLoaded) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is FavoritesLoaded) {
              isFavorite =
                  state.products.any((element) => element.id == product.id);
              return SvgPicture.asset(
                isFavorite
                    ? "assets/icons/bottom_nav_selected_favorite_icon.svg"
                    : "assets/icons/favorite_icon.svg",
                width: iconWidth ?? 16.r,
                height: iconHeight ?? 16.r,
              );
            }
            return SvgPicture.asset(
              isFavorite
                  ? "assets/icons/bottom_nav_selected_favorite_icon.svg"
                  : "assets/icons/favorite_icon.svg",
              width: iconWidth ?? 16.r,
              height: iconHeight ?? 16.r,
            );
          },
        ),
      ),
    );
  }
}