


class Product{
  final String? id;
  final String? Name;
  final String? description;
  final double? price;
  final String? imageUrl;
   bool? isFavorite;

 Product(
        {
          required this.description,
          required this.Name,
          required this.id,
          required this.price,
          required this.imageUrl,
          this.isFavorite = false,
      }
    );

}