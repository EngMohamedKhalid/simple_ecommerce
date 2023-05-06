import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/models/product_model.dart';
import 'package:simple_ecommerce/modules/product_detail_module/details_screen.dart';
import 'package:simple_ecommerce/shared/components/custom_home_item.dart';
import 'package:simple_ecommerce/shared/components/custom_text_field.dart';
import 'package:simple_ecommerce/shared/network/remote/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
             GoRouter.of(context).push("/added");
            },
            icon: Icon(
              Icons.done_all,
              size:25.sp
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomTextFormField(
                  controller: searchController,
                  hintText: "Search Product",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(.1),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            "Products",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.sp,
            ),
          ),
          FutureBuilder<List<ProductModel>>(
            future:ApiServices().getAllProducts() ,
            builder: (context, snapshot){
              if(snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return
                  GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => DetailsScreen(
                             productModel: products[index],
                           ),
                         )
                       );
                      },
                        child: CustomHomeItem(
                          productModel: products[index],
                        ));
                  },
                );
              }
              else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push("/add");
        },
        child: Icon(
          Icons.add,
          size: 30.sp,
        ),
      ),
    );
  }
}
