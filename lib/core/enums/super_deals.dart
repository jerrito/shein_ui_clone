enum SuperDealsEnum {
  women(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtNChQTakmM69ZrSBNk2ebHodTSOmsD21UUw&s',
      name: 'Women',
      discount: '-45%',
      amount: '100'),
  curve(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3LWJxuG2nTtUAOkRm21BLd_Br2Qjmi9ohnQ&s',
      name: 'Curve',
      amount: '120'),
  kids(
      url:
          'https://images-cdn.ubuy.co.in/6679254c43a032738e5723ef-girls-dress-pageant-princess-tulle-dress.jpg',
      name: 'Kids',
      amount: '200'),
  men(
      url:
          'https://images-cdn.ubuy.co.in/65dd65c6862c8d1233658cdd-formal-suits-for-men-wedding-slim-fit-3.jpg',
      name: 'Men',
      amount: '100'),
  sports(
      url: 'https://m.media-amazon.com/images/I/51-YNLnErVL._AC_SL1000_.jpg',
      name: 'Sports',
      amount: '300'),
  jewelry(
      url:
          'https://media.istockphoto.com/id/1277517088/photo/fancy-designer-antique-golden-bracelets-for-woman-fashion.jpg?s=612x612&w=0&k=20&c=n49O0S5rIgzxJX5bU1YjwRHfou0DYPcmsv-N5JAAM14=',
      name: 'Jewelry & Accessories',
      amount: '470'),
  tops(
      url:
          'https://gh.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/23/5540932/1.jpg?5708',
      name: 'Tops',
      amount: '90'),
  home(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWDWS4iHYxM3I0pOT93YWI0G0VDlOMWJJYTw&s',
      name: 'Home & Living',
      amount: '1600'),
  baby(
      url:
          'https://gh.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/03/2185511/1.jpg?9265',
      name: 'Baby & Maternity',
      amount: '400'),
  bottoms(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3YviJl0ao1I1NO9mcsfrf8LhpPH3WDZvrig&s',
      name: 'Bottoms',
      amount: '108'),
  underwear(
      url:
          'https://m.media-amazon.com/images/I/71v6b8miCZL._AC_UF1000,1000_QL80_.jpg',
      name: 'Underwear & Sleepwear',
      amount: '80'),
  shoes(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzpAnbM-vLe9TlUFyJBJrtPltEUPPXyQ0zlg&s',
      name: 'Shoes',
      amount: '230'),
  bags(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREhyfkS07Z2k6ciQBYdtiBD30uqIX3pCuZYQ&s',
    name: 'Bags',
    amount: '100',
  ),
  beachwear(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDzNclAneeNwbwGg3Tj56UZm2iXaM_d1XTlA&s',
      name: 'Beachwear',
      amount: '200'),
  activewear(
      url:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZoJa8vGciNa2E8qoQk2jV0wOLDDup-XA8KA&s',
      name: 'Activewear',
      amount: '220');

  final String name, url, amount;
  final String? discount;
  const SuperDealsEnum({
    required this.name,
    required this.url,
    required this.amount,
    this.discount,
  });
}
