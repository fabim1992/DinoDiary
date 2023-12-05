class MockUser {
  final String imagePath;
  final String name;
  final String email;
  final int numberRegisters;
  final bool isDarkMode;

  const MockUser(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.numberRegisters,
      required this.isDarkMode});
}

class UserPreferences {
  static const myUser = MockUser(
    imagePath:
        'https://uploads.metropoles.com/wp-content/uploads/2021/07/21170852/Joao-Gomes4.jpg',
    name: 'Joao Gomes',
    email: 'joaogomes@gmail.com',
    numberRegisters: 50,
    isDarkMode: false,
  );
}
