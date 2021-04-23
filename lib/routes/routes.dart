import 'package:customer/routes/customer_info_binding.dart';
import 'package:customer/routes/data_table_binding.dart';
import 'package:customer/routes/home_binding.dart';
import 'package:customer/routes/login_binding.dart';
import 'package:customer/routes/manage_account_binding.dart';
import 'package:customer/routes/mspp_admin_binding.dart';
import 'package:customer/routes/mspp_binding.dart';
import 'package:customer/routes/other_program_admin_binding.dart';
import 'package:customer/routes/other_program_binding.dart';
import 'package:customer/routes/part_program_binding.dart';
import 'package:customer/routes/pica_analysis_binding.dart';
import 'package:customer/routes/pica_card_table_binding.dart';
import 'package:customer/routes/pica_chart_binding.dart';
import 'package:customer/views/login_page.dart';
import 'package:customer/views/home_page.dart';
import 'package:customer/views/customer_info.dart';
import 'package:customer/views/mspp.dart';
import 'package:customer/views/manage_account_page.dart';
import 'package:customer/views/mspp_admin.dart';
import 'package:customer/views/other_program_admin_page.dart';
import 'package:customer/views/other_program_page.dart';
import 'package:customer/views/part_program_page.dart';
import 'package:customer/views/pica_analysis_page.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/login_page',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/home_page',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/customer_info',
      page: () => CustomerInfo(),
      binding: CustomerInfoBinding(),
    ),
    GetPage(
      name: '/mspp',
      page: () => Mspp(),
      bindings: [
        PicaCardTableBinding(),
        MsppBinding(),
        DataTableBinding(),
      ],
    ),
    GetPage(
      name: '/mspp_admin',
      page: () => MsppAdmin(),
      bindings: [
        PicaCardTableBinding(),
        MsppBinding(),
        MsppAdminBinding(),
        DataTableBinding(),
      ],
    ),
    GetPage(
      name: '/other_program',
      page: () => OtherProgramPage(),
      binding: OtherProgramBinding(),
    ),
    GetPage(
      name: '/other_program_admin',
      page: () => OtherProgramAdminPage(),
      bindings: [
        OtherProgramBinding(),
        OtherProgramAdminBinding(),
      ],
    ),
    GetPage(
      name: '/manage_account',
      page: () => ManageAccountPage(),
      binding: ManageAccountBinding(),
    ),
    GetPage(
      name: '/part_program',
      page: () => PartProgramPage(),
      bindings: [
        PartProgramBinding(),
        DataTableBinding(),
      ],
    ),
    GetPage(
      name: '/pica_page',
      page: () => PicaAnalysisPage(),
      bindings: [
        PicaCardTableBinding(),
        MsppBinding(),
        OtherProgramBinding(),
        PartProgramBinding(),
        PicaAnalysisBinding(),
        PicaGraphicBinding(),
        DataTableBinding(),
      ],
    ),
  ];
}
