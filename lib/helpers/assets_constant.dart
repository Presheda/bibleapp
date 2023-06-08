import 'dart:math';

class RandomImages {
  static String imageOne =
      "https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&w=1600";
  static String imageTwo =
      "https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&w=1600";

  static String imageThree =
      "https://images.pexels.com/photos/2406785/pexels-photo-2406785.jpeg?auto=compress&cs=tinysrgb&w=1600";

  static String imageFour =
      "https://images.pexels.com/photos/2524874/pexels-photo-2524874.jpeg?auto=compress&cs=tinysrgb&w=1600";
 static String imageFive =
      "https://images.pexels.com/photos/2770933/pexels-photo-2770933.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageSix =
      "https://images.pexels.com/photos/2832034/pexels-photo-2832034.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageSeven =
      "https://images.pexels.com/photos/3493777/pexels-photo-3493777.jpeg?auto=compress&cs=tinysrgb&w=1600";
 static String imageEight =
      "https://images.pexels.com/photos/3554423/pexels-photo-3554423.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageNine =
      "https://images.pexels.com/photos/3560044/pexels-photo-3560044.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageTen =
      "https://images.pexels.com/photos/3733925/pexels-photo-3733925.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageEleven =
      "https://images.pexels.com/photos/2909077/pexels-photo-2909077.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageTwelve =
      "https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageThirteen =
      "https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageFourteen =
      "https://images.pexels.com/photos/1525589/pexels-photo-1525589.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageFifteen =
      "https://images.pexels.com/photos/1834407/pexels-photo-1834407.jpeg?auto=compress&cs=tinysrgb&w=1600";

 static String imageSixteen =
      "https://images.pexels.com/photos/1834407/pexels-photo-1834407.jpeg?auto=compress&cs=tinysrgb&w=1600";

  static List<String> images() {
    return [imageOne, imageTwo, imageThree,
    imageFour,
      imageFive,
      imageSix,
      imageSeven,
      imageEight,
      imageNine,
      imageTen,
      imageEleven,
      imageTwelve,
      imageThirteen, imageFourteen,
      imageFifteen,
      imageSixteen
    ];
  }

  static String getRandomImageAsset() {
    return images()[Random().nextInt(15)];
  }
}

///
