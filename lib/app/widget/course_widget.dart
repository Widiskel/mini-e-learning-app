import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/utils/color_pallete.dart';

class CourseWidget extends StatelessWidget {
  final String leading;
  final String title;
  final int? materi;
  final int done;
  final String? route;

  const CourseWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.materi,
    this.done = 0,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: Get.width,
        height: 100,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            onTap: () => route != null ? Get.toNamed(route!) : '',
            splashColor: ColorPallete.bgColor,
            hoverColor: Colors.white,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    color: ColorPallete.iconBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      leading,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          "assets/img/atom.png",
                          fit: BoxFit.contain,
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "$done/$materi Paket latihan soal",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorPallete.subTitle),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      LinearProgressIndicator(
                        value: materi != null ? 0 : done / materi!,
                        minHeight: 10,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
