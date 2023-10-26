import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/constants/colors.dart';
import 'package:pet_app/constants/images.dart';
import 'package:pet_app/model/doctor.dart';
import 'package:pet_app/model/service.dart';
import 'package:pet_app/model/treated.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int isCategorySelected = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      extendBody: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              buildTopSection(),
              const SizedBox(
                height: 10,
              ),
              buildBanner(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Recently Treated",
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3F3E3F),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildRecentTreated(),
              ),
              const SizedBox(
                height: 20,
              ),
              buildSearchField(),
              const SizedBox(
                height: 20,
              ),
              buildCategories(),
              const SizedBox(
                height: 20,
              ),
              buildDoctorCard(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Row buildRecentTreated() {
    return Row(
      children: [
        ...List.generate(
          treatedAnimals.length,
          (index) => Container(
            height: 56.0,
            width: 56.0,
            margin: EdgeInsets.only(
              left: 20.0,
              right: index == 4 ? 20.0 : 0.0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE5E5E5),
              border: Border.fromBorderSide(
                BorderSide(
                  color: index % 2 == 0
                      ? primaryColor.withOpacity(.4)
                      : secondaryColor.withOpacity(.9),
                  width: 1.5,
                ),
              ),
              image: DecorationImage(
                image: AssetImage(treatedAnimals.elementAt(index).image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ListView buildDoctorCard() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _doctor(doctors[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 11,
      ),
      itemCount: doctors.length,
    );
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            doctorModel.image,
            width: 88,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel.name,
                style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F)),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                text: TextSpan(
                  text: "Service: ${doctorModel.services.join(', ')}",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "Specialty",
                    style: GoogleFonts.manrope(
                      color: greenColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFE5E5E5),
                    radius: 15,
                    child: Image.asset(
                      cat1,
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFE5E5E5),
                    radius: 15,
                    child: Image.asset(
                      dog2,
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  SizedBox buildCategories() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isCategorySelected == index
                ? primaryColor.withOpacity(.8)
                : secondaryColor.withOpacity(.9),
            border: isCategorySelected == index
                ? Border.all(
                    color: const Color(0xFFF1E5E5).withOpacity(.22),
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              Service.categories()[index],
              style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isCategorySelected == index
                      ? Colors.white
                      : const Color(0xFF3F3E3F).withOpacity(.3)),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: Service.categories().length,
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 0.5),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xFFADACAD),
          ),
          hintText: "Search Veterinary Pet Doctor...",
          hintStyle: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCACACA),
            height: 150 / 100,
          ),
        ),
      ),
    );
  }

  AspectRatio buildBanner() {
    return AspectRatio(
      aspectRatio: 376 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: primaryColor,
        ),
        child: Stack(children: [
          Image.asset(
            alignment: Alignment.centerRight,
            petVeterinaryDoctor,
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: const Color(0xFFDEE1FE),
                      height: 150 / 100,
                    ),
                    children: const [
                      TextSpan(
                        text: "THE ",
                      ),
                      TextSpan(
                        text: "BEST TREATMENT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "\n FOR YOUR PET ",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    border: Border.all(
                      color: Colors.white.withOpacity(.12),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Book Appointment",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Row buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFF6F6F6),
          backgroundImage: AssetImage(
            profileImage,
          ),
        ),
        Text(
          "Pettie Care".toUpperCase(),
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.bell,
                color: primaryColor,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: notificationColor,
                  borderRadius: BorderRadius.circular(15 / 2),
                ),
                child: Center(
                  child: Text(
                    "8",
                    style: GoogleFonts.mPlus1p(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
