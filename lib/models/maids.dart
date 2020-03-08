class Maid {
  final String name;
  final double charges;
  final String imageUrl;
  final bool availability;
  final double rating;

  Maid(
      {this.name, this.charges, this.imageUrl, this.availability, this.rating});
}

class DummyMaidData {
  List<Maid> _data = List<Maid>();
  List<Maid> get maids => _data;

  DummyMaidData() {
    _data.add(Maid(
        charges: 2000.0,
        name: 'Nepali Surma',
        imageUrl: 'https://photo-cdn.icons8.com/assets/previews/917/1372e834-e191-4661-98b5-dc5c21f049702x.jpg',
        availability: true,
        rating: 4.5));
    _data.add(Maid(
        charges: 1500.0,
        name: 'Kathmandu Prasad',
        imageUrl: 'https://photo-cdn.icons8.com/assets/previews/917/1372e834-e191-4661-98b5-dc5c21f049702x.jpg',
        availability: false,
        rating: 5));
    _data.add(Maid(
        charges: 2000.0,
        name: 'Bihar ke lala',
        imageUrl: 'https://photo-cdn.icons8.com/assets/previews/917/1372e834-e191-4661-98b5-dc5c21f049702x.jpg',
        availability: true,
        rating: 4.0));
    _data.add(Maid(
        charges: 2000.0,
        name: 'Lalu Prasad',
        imageUrl: 'https://photo-cdn.icons8.com/assets/previews/917/1372e834-e191-4661-98b5-dc5c21f049702x.jpg',
        availability: false,
        rating: 4.2));
    _data.add(Maid(
        charges: 2000.0,
        name: 'Rabri Devi',
        imageUrl: 'https://photo-cdn.icons8.com/assets/previews/917/1372e834-e191-4661-98b5-dc5c21f049702x.jpg',
        availability: true,
        rating: 4.7));
  }
}
