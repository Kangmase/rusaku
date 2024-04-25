part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  String _selectedItemKab = '---Pilih Kabupaten/Kota---';
  String _selectedItemKec = '---Pilih Kecamatan---';
  String _selectedItemKel = '---Pilih Kelurahan---';

  List<String> _optionsKab = [
    '---Pilih Kabupaten/Kota---',
    'Malang',
    'Surabaya',
    'Pamekasan'
  ];
  List<String> _optionsKec = [
    '---Pilih Kecamatan---',
    'Blimbing',
    'Tidar',
    'Pamekasan'
  ];
  List<String> _optionsKel = [
    '---Pilih Kelurahan---',
    'Gladak Anyar',
    'Bugih',
    'Lawangan Daya'
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Alamat',
      subtitle: 'Rukun Sesama',
      onBackButtonPressed: () {
        Get.to(SignUpPage());
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Alamat',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneNoController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Contoh: Jl. Panglima Sudirman'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Kabupaten/Kota',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              value: _selectedItemKab,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItemKab = newValue!;
                });
              },
              items: _optionsKab.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Kecamatan',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              value: _selectedItemKec,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItemKec = newValue!;
                });
              },
              items: _optionsKec.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Kelurahan',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              value: _selectedItemKel,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItemKel = newValue!;
                });
              },
              items: _optionsKel.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Kode Pos',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: postCodeController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan kode pos'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                'Daftar Sekarang',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {
                Get.to(SignInPage());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
