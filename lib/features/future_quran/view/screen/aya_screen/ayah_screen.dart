import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/Colors/Textstyle/text_style.dart';
import 'package:quran/features/future_quran/model/mode_quran/model_quran.dart';
import 'package:quran/features/future_quran/cubit/quran_cubit.dart';
import 'package:quran/features/future_quran/view/screen/home_quran/home_quran.dart';

class AyahScreen extends StatelessWidget {
  final List<AyatSour> homeList;

  const AyahScreen({super.key, required this.homeList});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text(
            'القرآن الكريم',
            style: textStyleapp().copyWith(
              color: const Color(0xFF1E4D2B),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xFF1E4D2B),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: homeList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 4,
                shadowColor: const Color(0xFF1E4D2B).withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: BlocProvider.of<QuranCubit>(context),
                          child: HomeQuran(
                            quranData: homeList,
                            initialIndex: index,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFE0F2F1),
                          Color(0xFFB2DFDB),
                        ],
                      ),
                      border: Border.all(
                        color: const Color(0xFF1E4D2B).withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF1E4D2B),
                                  Color(0xFF2A593C),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF1E4D2B).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black12,
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      homeList[index].name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E4D2B),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF1E4D2B),
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
