import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/future_quran/cubit/quran_cubit.dart';
import 'package:quran/features/future_quran/model/mode_quran/model_quran.dart';

class HomeQuran extends StatefulWidget {
  final List<AyatSour> quranData;
  final int initialIndex;

  const HomeQuran({
    super.key,
    required this.quranData,
    required this.initialIndex,
  });

  @override
  State<HomeQuran> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends State<HomeQuran> {
  double fontSize = 26.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        final currentPage = (state is QuranPageLoaded)
            ? state.currentPage
            : widget.initialIndex;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.grey[50],
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(0.9),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black54),
                onPressed: () => Navigator.pop(context),
              ),
              title: Column(
                children: [
                  Text(
                    widget.quranData[currentPage].name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.format_list_numbered_rounded,
                        size: 14,
                        color: Colors.teal.withOpacity(0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.quranData[currentPage].ayat} آية',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.teal.withOpacity(0.7),
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: PageView.builder(
              controller: PageController(initialPage: currentPage),
              itemCount: widget.quranData.length,
              onPageChanged: (page) => context.read<QuranCubit>().setPage(page),
              itemBuilder: (context, index) {
                final surah = widget.quranData[index];
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 120, 20, 80),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shadowColor: Colors.teal.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.teal[800]!,
                                Colors.teal[400]!,
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: -20,
                                top: -20,
                                child: Icon(
                                  Icons.star_rounded,
                                  size: 60,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              Positioned(
                                right: -15,
                                bottom: -15,
                                child: Icon(
                                  Icons.star_rounded,
                                  size: 50,
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                    fontSize: fontSize + 4,
                                    height: 1.6,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: const Offset(2, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        elevation: 4,
                        shadowColor: Colors.teal.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            surah.displayqoran,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: fontSize,
                                  height: 2.2,
                                  color: Colors.black87,
                                ),
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  fontSize += 2;
                });
              },
              child: const Icon(Icons.text_increase, color: Colors.white),
              backgroundColor: Colors.teal,
            ),
          ),
        );
      },
    );
  }
}
