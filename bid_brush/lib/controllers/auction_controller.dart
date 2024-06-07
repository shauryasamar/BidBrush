import 'package:get/get.dart';
import '../models/product_model.dart';

class AuctionController extends GetxController {
  var currentNavIndex = 0.obs;

  // Define the pagelist without creating instances of AuctionPage
  var pagelist = ['/auctionPage', '/anotherPage'];

  List<ProductModel> productList = [
    ProductModel(
        name: "Face Art",
        image: "https://images.pexels.com/photos/1707640/pexels-photo-1707640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 50),
    ProductModel(
        name: "Cat Art Sketch",
        image: "https://images.pexels.com/photos/16254138/pexels-photo-16254138/free-photo-of-a-sketch-of-a-cat.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 30),
    ProductModel(
        name: "Abstract Art",
        image: "https://images.pexels.com/photos/159862/art-school-of-athens-raphael-italian-painter-fresco-159862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 560),
    ProductModel(
        name: "Random Art",
        image:
        "https://images.pexels.com/photos/1704119/pexels-photo-1704119.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 200),
    ProductModel(
        name: "Animal Art",
        image: "https://images.pexels.com/photos/3246665/pexels-photo-3246665.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 100),
    ProductModel(
        name: "Abstract tree Art",
        image: "https://images.pexels.com/photos/962312/pexels-photo-962312.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 700),
    ProductModel(
        name: "Flower Art",
        image: "https://images.pexels.com/photos/2086361/pexels-photo-2086361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        price: 160),

  ];
}
