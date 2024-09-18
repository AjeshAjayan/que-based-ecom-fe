import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';
import 'package:que_based_ecom_fe/src/utils/get_days_ago.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo>
    with SingleTickerProviderStateMixin {
  List<String> videos = [];
  List<String> images = [];

  @override
  void initState() {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    if (homeProductDetailStore.selectedProduct != null) {
      final media =
          findAllMediasFromProduct(homeProductDetailStore.selectedProduct!);
      setState(() {
        videos = media.videos;
        images = media.images;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: DefaultTabController(
            length: (state.selectedProduct?.variants ?? []).length,
            child: Column(
              children: [
                TabBar(
                  tabs: (state.selectedProduct?.variants ?? []).map(
                    (s) {
                      return Text(
                          '${s.size?.name ?? ''} - ${s.colorTextToDisplay ?? ''}');
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: (state.selectedProduct?.variants ?? []).map(
                      (s) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹${s.variantPrice != null ? s.variantPrice.toString() : state.selectedProduct?.price.toString()}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.straighten_outlined,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      s.size?.name.toLowerCase() ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.color_lens,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      s.colorTextToDisplay?.toLowerCase() ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              getDaysAgo(
                                state.selectedProduct?.productAddedDate ?? '',
                              ),
                            ),
                            Text(
                              state.selectedProduct?.description?[0].children
                                      .map((PayloadDescriptionChild dc) =>
                                          dc.text)
                                      .join() ??
                                  '',
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
                Text(
                  'MOQ Milestone is every ${state.selectedProduct?.moq} orders',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
