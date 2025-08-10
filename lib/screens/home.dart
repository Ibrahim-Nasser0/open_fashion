import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/models/cover_model.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/check_out.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(isBlack: true),
      body: Stack(
        children: [
          HeaderDecorations(),
          HomeBodyContent(),
        ],
      ),
    );
  }
}

class HeaderDecorations extends StatelessWidget {
  const HeaderDecorations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -0.43.h,
          left: 90.99.w,
          width: 173.6.w,
          height: 125.28.h,
    
          child: SvgPicture.asset('assets/texts/10.svg'),
        ),
        Positioned(
          top: 15.48.h,
          left: 112.93.w,
          width: 163.w,
          height: 63.h,
          child: SvgPicture.asset('assets/texts/October.svg'),
        ),
        Positioned(
          top: 62.86.h,
          left: 119.61.w,
          width: 145.58518981933594.w,
          height: 29.11703872680664.h,
    
          child: SvgPicture.asset('assets/texts/Collection.svg'),
        ),
      ],
    );
  }
}

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 130.h),
                Image.asset('assets/cover/slider caver3.png'),

                SizedBox(height: 20.h),
                ProductGridView(),

                SizedBox(height: 15.h),
                const CustomText(text: 'YOU MAY ALSO LIKE', fontSize: 18),
                SizedBox(height: 5.h),
                SvgPicture.asset('assets/logo/line.svg'),

                SizedBox(height: 15.h),
                CoverSlider(),
              ],
            ),
          ),
          About(),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 340.h,
      decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),

      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/icons/twitter icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 50.w),
              SvgPicture.asset(
                'assets/icons/Instagram icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 50.w),
              SvgPicture.asset(
                'assets/icons/YouTube icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              Spacer(),
            ],
          ),

          //line
          SizedBox(height: 30.h),
          SvgPicture.asset(
            'assets/logo/line.svg',
            // ignore: deprecated_member_use
            color: AppColors.primaryColor,
            width: 124.95.w,
            height: 9.h,
          ),

          SizedBox(height: 20.h),
          Text(
            "support@openui.design\n        +60 825 876\n08:00 - 22:00 - Everyday",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
              fontFamily: 'TenorSans',
            ),
          ),

          //line
          SizedBox(height: 20.h),
          SvgPicture.asset(
            'assets/logo/line.svg',
            // ignore: deprecated_member_use
            color: AppColors.primaryColor,
            width: 124.95.w,
            height: 9.h,
          ),

          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "About",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "Contact",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "Blog",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),

          SizedBox(height: 35.h),
          Container(
            alignment: Alignment.center,
            height: 45.24551010131836.h,
            width: 375.w,
            color: Color.fromRGBO(196, 196, 196, 1),
            child: Text(
              "Copyright© OpenUI All Rights Reserved.",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color.fromRGBO(85, 85, 85, 1),
                fontFamily: 'TenorSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoverSlider extends StatelessWidget {
  const CoverSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: covers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  covers[index].image,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                CustomText(text: covers[index].title, fontSize: 13),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemCount: products.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.54,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => CheckOut(product: products[index]),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Product Image
              Image.asset(products[index].image),
              SizedBox(height: 7.h),

              //Product Name
              CustomText(text: products[index].name, fontSize: 12),
              SizedBox(height: 2.h),

              //Product Description
              CustomText(
                text: products[index].description,
                fontSize: 12,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              SizedBox(height: 3.h),

              //Product Price
              CustomText(
                text: "\$ ${products[index].price.toString()}",
                fontSize: 15,
                color: Color.fromRGBO(221, 133, 96, 1),
              ),
            ],
          ),
        );
      },
    );
  }
}
