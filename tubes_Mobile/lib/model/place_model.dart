class PlaceInfo {
  final String location, image, name, maps, desc, review;
  final int price;

  PlaceInfo(
      {required this.desc,
      required this.name,
      required this.image,
      required this.location,
      required this.price,
      required this.maps,
      required this.review});
}

List places = [
  PlaceInfo(
      image: 'assets/images/Candi Tikus.jpg',
      location: 'Trowulan',
      name: 'Candi Tikus',
      price: 3000,
      maps: 'https://goo.gl/maps/1Fqr7CsQX8DujxjV7',
      desc:
          'Candi Tikus yang berada di Jalan Raya Trowulan, Trowulan, Mojokerto, Jawa Timur ini memiliki bentuk yang unik dan masih ramai didatangi wisatawan dari berbagai daerah. Bentuk bangunan Candi Tikus menyerupai petirtaan yang masih diperkirakan apa fungsinya. Beberapa pakar mengatakan bahwa kawasan candi ini digunakan sebagai pemandian para raja, tetapi pakar lain mengatakan bahwa bangunan yang ada di tengah candi merupakan tempat pemujaan.',
      review: 'Bagus'),
  PlaceInfo(
      image: 'assets/images/Gapura Wringi Lawang.jpg',
      location: 'Trowulan',
      name: 'Gapura Wringin Lawang',
      price: 3000,
      maps: 'https://goo.gl/maps/Eh19y6ABy8bGVWWy9',
      desc:
          'Gapura Wringin Lawang memiliki bentuknya yang unik dan menarik. Sesuai dengan namanya, lawang memiliki arti pintu, dimana bangunan ini dipercaya sebagai pintu masuk menuju pusat pemerintahan Kerajaan Majapahit. Gapura Wringin Lawang yang berada di Jatipasar, Kecamatan Trowulan, Kabupaten Mojokerto ini masih kokoh hingga saat ini. Selain indah untuk dinikmati langsung , candi ini sering digunakan sebagai salah satu spot foto dan tempat diadakannya sesi foto prewedding. Adanya taman serta pohon beringin di kawasan gapura juga menjadikan tempat ini semakin rindang dan sejuk.',
      review: 'Bagus'),
  PlaceInfo(
      image: 'assets/images/Gapura Bajang Ratu.jpg',
      location: 'Trowulan',
      name: 'Candi Gapura Bajang Ratu',
      price: 3000,
      maps: 'https://goo.gl/maps/1bErAemG7e1j5FmG8',
      desc:
          'Candi Bajang Ratu atau Gapura Bajang Ratu menjadi jujugan wisatawan lokal maupun mancanegara. Letaknya yang tidak jauh dari museum Trowulan dan Candi Tikus yaitu di Desa Temon , Kecamatan Trowulan , Kabupaten Mojokerto, Jawa Timur, menjadikan tempat wisata di Mojokerto ini ramai dikunjungi di hari libur . Candi Bajang Ratu masih sangat terawat dan memiliki bangunan megah dan kokoh hingga saat ini. Konon katanya, Jayanegara dinobatkan sebagai raja pada usia yang masih cukup kecil dan masih sangat muda atau bujang. Dari situlah diduga nama Bajang Ratu atau Ratu Bajang berasal.',
      review: 'Bagus'),
  PlaceInfo(
      image: 'assets/images/Candi Jolotundo.jpg',
      location: 'Trowulan',
      name: 'Candi Jolotundo',
      price: 10000,
      maps: 'https://goo.gl/maps/6zJVnvn6amvMqYJP7',
      desc:
          'Candi Jolotundo menjadi salah satu candi yang cukup populer dan ramai didatangi wisatawan dari berbagai daerah. Candi ini berlokasi di Desa Seloliman, Kecamatan Trawas, Kabupaten Mojokerto. Candi yang satu ini juga dikenal memiliki sumber air yang dapat dimanfaatkan oleh pengunjung. Konon katanya, air yang berasal dari sumber tersebut memiliki manfaat diantaranya dapat mengencangkan kulit serta membuat tampak awet muda.',
      review: 'sangat sangat bagus'),
  PlaceInfo(
      image: 'assets/images/Candi Brahu.jpg',
      location: 'Trowulan',
      name: 'Candi Brahu',
      price: 3000,
      maps: 'https://goo.gl/maps/WhVJ2Yv2ManC2m9t6',
      desc:
          'Candi yang satu ini dikenal dengan bangunannya yang masih sangat megah dan menarik untuk didatangi. Di kawasan Candi Brahu terdapat hamparan rumput serta pepohonan yang membuat suasana semakin sejuk. Candi yang berada di Dukuh Jambu Mente, Desa Bejijong, Kecamatan Trowulan, Kabupaten Mojokerto, Jawa Timur ini dapat menikmati wisata bersejarah sekaligus bersantai di kawasan Candi Brahu. Terdapat banyak spot foto menarik yang sayang untuk dilewatkan. Karena pemandangannya yang indah, tidak jarang kawasan candi ini digunakan sebagai lokasi diadakannya prewedding atau photoshoot lainnya.',
      review: 'sangat sangat bagus'),
];
