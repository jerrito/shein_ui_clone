enum ProductCategoriesEnum {
  women(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtNChQTakmM69ZrSBNk2ebHodTSOmsD21UUw&s',
    name: 'Women',
    amount: 22.44,
  ),
  curve(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3LWJxuG2nTtUAOkRm21BLd_Br2Qjmi9ohnQ&s',
      name: 'Curve',
      amount: 33.32),
  kids(
      url:
          'https://images-cdn.ubuy.co.in/6679254c43a032738e5723ef-girls-dress-pageant-princess-tulle-dress.jpg',
      name: 'Kids',
      amount: 99.63),
  men(
    url:
        'https://images-cdn.ubuy.co.in/65dd65c6862c8d1233658cdd-formal-suits-for-men-wedding-slim-fit-3.jpg',
    name: 'Men',
    amount: 44.10,
  ),
  sports(
      url: 'https://m.media-amazon.com/images/I/51-YNLnErVL._AC_SL1000_.jpg',
      name: 'Sports'),
  jewelry(
      url:
          'https://media.istockphoto.com/id/1277517088/photo/fancy-designer-antique-golden-bracelets-for-woman-fashion.jpg?s=612x612&w=0&k=20&c=n49O0S5rIgzxJX5bU1YjwRHfou0DYPcmsv-N5JAAM14=',
      name: 'Jewelry & Accessories'),
  tops(
      url:
          'https://gh.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/23/5540932/1.jpg?5708',
      name: 'Tops'),
  home(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWDWS4iHYxM3I0pOT93YWI0G0VDlOMWJJYTw&s',
      name: 'Home & Living'),
  baby(
      url:
          'https://gh.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/03/2185511/1.jpg?9265',
      name: 'Baby & Maternity'),
  bottoms(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3YviJl0ao1I1NO9mcsfrf8LhpPH3WDZvrig&s',
      name: 'Bottoms'),
  underwear(
      url:
          'https://m.media-amazon.com/images/I/71v6b8miCZL._AC_UF1000,1000_QL80_.jpg',
      name: 'Underwear & Sleepwear'),
  shoes(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzpAnbM-vLe9TlUFyJBJrtPltEUPPXyQ0zlg&s',
      name: 'Shoes'),
  bags(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREhyfkS07Z2k6ciQBYdtiBD30uqIX3pCuZYQ&s',
      name: 'Bags'),
  beachwear(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDzNclAneeNwbwGg3Tj56UZm2iXaM_d1XTlA&s',
      name: 'Beachwear'),
  activewear(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZoJa8vGciNa2E8qoQk2jV0wOLDDup-XA8KA&s',
      name: 'Activewear');

  final String name, url;
  final double? amount;
  const ProductCategoriesEnum({
    required this.name,
    required this.url,
    this.amount,
  });
}
