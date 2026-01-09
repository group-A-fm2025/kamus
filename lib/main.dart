import 'package:flutter/material.dart';

void main() {
  runApp(const KamusApp());
}

class KamusApp extends StatelessWidget {
  const KamusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamus Lokal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins', // bisa diganti dengan Google Fonts jika ditambahkan
        brightness: Brightness.light,
      ),
      home: const KamusPage(),
    );
  }
}

class KamusPage extends StatefulWidget {
  const KamusPage({super.key});

  @override
  State<KamusPage> createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  final TextEditingController _inputController = TextEditingController();
  String _bahasaAsal = 'Jawa';
  String _bahasaTujuan = 'Indonesia';
  String _hasilTerjemahan = '';

  final List<String> languages = [
    'Jawa',
    'Indonesia',
    'Mee',
    'Sobey',
    'Tobati',
    // Tambah bahasa
  ];

  // ===== DATA KAMUS LOKAL =====
  final Map<String, Map<String, String>> dictionary = {

    // Bahasa Jawa - Indonesia
    'Jawa-Indonesia': {
      'mangan': 'makan',
      'turu': 'tidur',
      'banyu': 'air',
      'mlaku': 'jalan',
      'sekolah': 'sekolah',
      'sugeng': 'selamat',
      'matur': 'terima',
      'nuwun': 'kasih',
      // Tambahan kata
      'lumaku': 'berjalan',
      'lunga': 'pergi',
      'luwe': 'lapar',
      'ombe': 'minum',
      'deleng': 'lihat',
      'weruh': 'melihat',
      'lungguh': 'duduk',
      'ngadeg': 'berdiri',
      'teka': 'datang',
      'adoh': 'jauh',
      'cedhak': 'dekat',
      'rungokake': 'dengar',
      'adol': 'jual',
      'tuku': 'beli',
      'menjual': 'menjual',
      'nuku': 'membeli',
    },
    'Indonesia-Jawa': {
      'makan': 'mangan',
      'tidur': 'turu',
      'air': 'banyu',
      'jalan': 'mlaku',
      'sekolah': 'sekolah',
      'selamat': 'sugeng',
      'terima': 'matur',
      'kasih': 'nuwun',
      // Tambahan kata
      'berjalan': 'lumaku',
      'pergi': 'lunga',
      'lapar': 'luwe',
      'minum': 'ombe',
      'lihat': 'deleng',
      'melihat': 'weruh',
      'duduk': 'lungguh',
      'berdiri': 'ngadeg',
      'dengar': 'rungokake',
      'datang': 'teka',
      'jauh': 'adoh',
      'dekat': 'cedhak',
      'jual': 'adol',
      'beli': 'tuku',
      'menjual': 'menjual',
      'membeli': 'nuku',
    },

    // Bahasa Mee - Indonesia
    'Mee-Indonesia': {
      'nai':'makan',
      'uno umii':'tidur',
      'uwo':'air',
      'ita':'jalan',
      'topetaida':'sekolah',
      'uwii':'berjalan',
      'uwi':'pergi',
      'naidi':'lapar',
      'uwo nai':'minum',
      'dou':'lihat',
      'peka edou':'melihat',
      'animakai':'duduk',
      'jooni':'berdiri',
      'yuwii':'dengar',
      'meei':'datang',
      'poto':'jauh',
      'kappa':'dekat',
      'wete':'jual',
      'edai':'beli',
      'kastau':'menjual',
      'edauwii':'membeli',
      'nagayawege': 'terima kasih',
    },
    'Indonesia-Mee': {
      'makan': 'nai',
      'tidur': 'uno umii',
      'air': 'uwo',
      'jalan': 'ita',
      'sekolah': 'topetaida',
      'berjalan': 'uwii',
      'pergi': 'uwi',
      'lapar': 'naidi',
      'minum': 'uwo nai',
      'lihat': 'dou',
      'melihat': 'peka edou',
      'duduk': 'animakai',
      'berdiri': 'jooni',
      'dengar': 'yuwii',
      'datang': 'meei',
      'jauh': 'poto',
      'dekat': 'kappa',
      'jual': 'wete',
      'beli': 'edai',
      'menjual': 'kastau',
      'membeli': 'edauwii',
      'terima kasih': 'nagayawege',
    },

    // Bahasa Indonesia - Bahasa Sobey
    'Sobey-Indonesia': {
      "an": "makan",
      "moni": "tidur",
      "rani": "air",
      "raravumau": "jalan",
      "isadit": "berjalan",
      "ewo": "pergi",
      "m'odi emor": "lapar",
      "minum": "mus",
      "rirom": "melihat",
      "ematos": "duduk",
      "ama": "datang",
      "denewo": "jauh",
      "ra'ru'": "dekat",
      "afti": "membeli",
    },
    'Indonesia-Sobey': {
      "makan": "an",
      "tidur": "moni",
      "air": "rani",
      "jalan": "raravumau",
      "berjalan": "isadit",
      "pergi": "ewo",
      "lapar": "m'odi emor",
      "minum": "mus",
      "melihat": "rirom",
      "duduk": "ematos",
      "datang": "ama",
      "jauh": "denewo",
      "dekat": "ra'ru'",
      "membeli": "afti",
    },

    // Bahasa Indonesia - Tobati
    'Tobati-Indonesia': {
      'wan': 'makan',
      'undukat': 'tidur',
      'nan': 'air',
      'wahat': 'jalan',
      'wahat': 'berjalan',
      'wiyat': 'pergi',
      'khmo': 'lapar',
      'unt': 'minum',
      'romat': 'lihat',
      'sesin': 'duduk',
      'srukat': 'berdiri',
      'nonat': 'dengar',
      'mec': 'datang',
      'frami': 'jauh',
      'trinj': 'dekat',
      'nonat': 'dengar',
      'utiorit': 'beli',
    },
    'Indonesia-Tobati': {
      'makan': 'wan',
      'tidur': 'undukat',
      'air': 'nan',
      'jalan': 'wahat',
      'berjalan': 'wahat',
      'pergi': 'wiyat',
      'lapar': 'khmo',
      'minum': 'unt',
      'lihat': 'romat',
      'duduk': 'sesin',
      'berdiri': 'srukat',
      'dengar': 'nonat',
      'datang': 'mec',
      'jauh': 'frami',
      'dekat': 'trinj',
      'dengar': 'nonat',
      'beli': 'utiorit',
    },

    // Bahasa Jawa - Bahasa Mee
    'Jawa-Mee': {
      'mangan': 'nai',
      'turu': 'uno umii',
      'banyu': 'uwo',
      'mlaku': 'ita',
      'sekolah': 'topetaida',
      'lumaku': 'uwii',
      'lunga': 'uwi',
      'luwe': 'naidi',
      'ombe': 'uwo nai',
      'deleng': 'dou',
      'weruh': 'peka edou',
      'lungguh': 'animakai',
      'ngadeg': 'jooni',
      'rungokake': 'yuwii',
      'teka': 'meei',
      'adoh': 'poto',
      'cedhak': 'kappa',
      'adol': 'wete',
      'tuku': 'edai',
      'menjual': 'kastau',
      'nuku': 'edauwii',
    },
    'Mee-Jawa': {
      'nai': 'mangan',
      'uno umii': 'turu',
      'uwo': 'banyu',
      'ita': 'mlaku',
      'topetaida': 'sekolah',
      'uwii': 'lumaku',
      'uwi': 'lunga',
      'naidi': 'luwe',
      'uwo nai': 'ombe',
      'dou': 'deleng',
      'peka edou': 'weruh',
      'animakai': 'lungguh',
      'jooni': 'ngadeg',
      'yuwii': 'rungokake',
      'meei': 'teka',
      'poto': 'adoh',
      'kappa': 'cedhak',
      'wete': 'adol',
      'edai': 'tuku',
      'kastau': 'menjual',
      'edauwii': 'nuku',
    },
  };

  void _terjemahkan(String teks) {
    setState(() {
      if (teks.isEmpty) {
        _hasilTerjemahan = '';
        return;
      }
      final key = '$_bahasaAsal-$_bahasaTujuan';
      final kata = teks.toLowerCase().trim();
      _hasilTerjemahan = dictionary[key]?[kata] ?? 'Kata tidak ditemukan';
    });
  }

  void _swapBahasa() {
    setState(() {
      final temp = _bahasaAsal;
      _bahasaAsal = _bahasaTujuan;
      _bahasaTujuan = temp;
      _inputController.clear();
      _hasilTerjemahan = '';
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Kamus Lokal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDCEDC8), // hijau muda lembut
              Color(0xFFFFFFFF),
            ],
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ===== CARD BAHASA =====
                Card(
                  elevation: 8,
                  shadowColor: Colors.green.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF1F8E9), Color(0xFFE8F5E8)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                            value: _bahasaAsal,
                            exclude: _bahasaTujuan,
                            onChanged: (value) {
                              setState(() {
                                _bahasaAsal = value!;
                                _inputController.clear();
                                _hasilTerjemahan = '';
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: IconButton(
                            icon: const Icon(
                              Icons.swap_horiz_rounded,
                              size: 32,
                              color: Color(0xFF2E7D32),
                            ),
                            tooltip: 'Tukar bahasa',
                            onPressed: _swapBahasa,
                          ),
                        ),
                        Expanded(
                          child: _buildDropdown(
                            value: _bahasaTujuan,
                            exclude: _bahasaAsal,
                            onChanged: (value) {
                              setState(() {
                                _bahasaTujuan = value!;
                                _inputController.clear();
                                _hasilTerjemahan = '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ===== INPUT FIELD =====
                TextField(
                  controller: _inputController,
                  onChanged: _terjemahkan,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Masukkan kata di sini',
                    hintText: 'Ketik kata ${_bahasaAsal == 'Jawa' ? 'basa Jawa' : 'bahasa Indonesia'}...',
                    prefixIcon: const Icon(Icons.translate, color: Color(0xFF4CAF50)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFF81C784), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 3),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                ),

                const SizedBox(height: 40),

                // ===== HASIL TERJEMAHAN =====
                const Text(
                  'Hasil Terjemahan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 12),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _hasilTerjemahan.isEmpty
                          ? [Colors.grey.shade100, Colors.grey.shade50]
                          : [const Color(0xFFC8E6C9), const Color(0xFFA5D6A7)],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: _hasilTerjemahan.isEmpty
                          ? Colors.grey.shade300
                          : const Color(0xFF66BB6A),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _hasilTerjemahan.isEmpty
                          ? 'Hasil akan muncul di sini'
                          : _hasilTerjemahan,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: _hasilTerjemahan.contains('tidak ditemukan')
                            ? Colors.red.shade700
                            : const Color(0xFF1B5E20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required String exclude,
    required ValueChanged<String?> onChanged,
  }) {
    final filteredLanguages = languages.where((lang) => lang != exclude).toList();

    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Color(0xFF1B5E20), fontSize: 16, fontWeight: FontWeight.w600),
      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4CAF50)),
      items: filteredLanguages
          .map((lang) => DropdownMenuItem(
                value: lang,
                child: Text(
                  lang,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}