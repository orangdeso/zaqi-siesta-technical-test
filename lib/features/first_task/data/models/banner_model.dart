class BannerModel {
  final String title;
  final String buttonText;
  final String backgroundImage;

  const BannerModel({
    required this.title,
    required this.buttonText,
    required this.backgroundImage,
  });

  static List<BannerModel> getDummyBanners() {
    return [
      const BannerModel(
        title: 'Claim your\ndiscount 30%\ndaily now!',
        buttonText: 'Order now',
        backgroundImage: 'assets/images/banner.png',
      ),
      const BannerModel(
        title: 'Special Offer\nfor New\nCustomers!',
        buttonText: 'Get Started',
        backgroundImage: 'assets/images/banner.png',
      ),
      const BannerModel(
        title: 'Fresh Deals\nEvery Day\nJust for You!',
        buttonText: 'Shop Now',
        backgroundImage: 'assets/images/banner.png',
      ),
    ];
  }
}