import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_ecommerce/models/add_product_model.dart';
import 'package:simple_ecommerce/modules/added_products_module/added_products_screen.dart';
import 'package:simple_ecommerce/shared/components/custom_button.dart';
import 'package:simple_ecommerce/shared/components/custom_text_field.dart';
import 'package:simple_ecommerce/shared/constant.dart';
import 'package:simple_ecommerce/shared/network/remote/api_services.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key, this.addProductModel, }) : super(key: key);
  final AddProductModel ? addProductModel;
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
   File? file;
   String?chosenValue;
  List<String> categoriesList=[];

   @override
  void initState() {
     ApiServices().getAllCategories().then((value){
       for (var element in value) {
         categoriesList.add(element);
         print(categoriesList);
       }});
     setState(() {

     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Add Product",
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    context: context,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Upload Image",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                    onPressed: ()async{
                                     takePhoto(
                                       ImageSource.camera
                                     ).then((value){
                                       setState(() {
                                         Navigator.pop(context);
                                       });
                                     });
                                    },
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white
                                      ),
                                    ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                  ),
                                  onPressed: ()async{
                                    takePhoto(
                                        ImageSource.gallery
                                    ).then((value){
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                  child: Text(
                                    "Gallery",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                );
              },
              child: Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                  image: file==null?null:DecorationImage(
                      image: FileImage(file!),
                    fit: BoxFit.cover
                  )

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.photo,
                      size: 50.sp,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Add Product Image",
                      style: TextStyle(
                          fontSize: 20.sp,

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h,),
            Text(
              "Product Name",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19.sp,
              ),
            ),
            CustomTextFormField(obscureText:false,controller: nameController),
            SizedBox(height: 12.h,),
            Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19.sp,
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.2),
                borderRadius: BorderRadius.circular(8)
              ),
              child:  DropdownButton(
                isExpanded: true,
                hint: Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black
                    )
                ),
                value: chosenValue,
                underline: const SizedBox(),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 35.sp,
                ),
                onChanged: (newValue) {
                  setState(() {
                    chosenValue = newValue;
                    print(chosenValue);
                  });
                },
                items: categoriesList.map((itemValue){
                  return DropdownMenuItem(
                    value: itemValue,
                    child: Text(
                      itemValue,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black
                      ),
                    ),
                  );
                }).toList(),

              ),
            ),
            Text(
              "Price",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19.sp,
              ),
            ),
            CustomTextFormField(
                 keyType: TextInputType.number,
              obscureText:false,
                controller: priceController,
            ),
            SizedBox(height: 12.h,),
            Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19.sp,
              ),
            ),
            SizedBox(height: 12.h,),
            CustomTextFormField(
                controller: descriptionController,
              obscureText:false,
              maxLines: 7,
            ),
            SizedBox(height: 30.h,),
            CustomButton(
                text: "Submit",
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    ApiServices().addProduct(
                      title: nameController.text,
                      desc: descriptionController.text,
                      image: file!.path,
                      category: chosenValue!,
                      price:priceController.text,
                    ).then((value) {
                      imageFile = File(value.image);
                      addedList.add(value);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddedProductScreen(
                              // productModel: value,
                              file:File(value.image),
                            ),
                          )
                      );
                    }
                    );
                  }
                },
            )
          ],
        ),
      ),
    );
  }
  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    file = File(image!.path);
    return file;
  }
}
