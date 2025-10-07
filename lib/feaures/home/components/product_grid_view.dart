import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/checkout/view/check_out.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/shared/models/product_model.dart';

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
