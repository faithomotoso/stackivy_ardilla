import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/dashboard/dashboard_vm.dart';
import 'package:stackivy_ardilla/ui/widgets/dashboard_header.dart';
import 'package:stackivy_ardilla/ui/widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardVM(),
      builder: (ctx, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SliderDrawer(
            key: Provider.of<DashboardVM>(ctx, listen: false).drawerKey,
            appBar: null,
            slider: const AppDrawer(),
            child: SafeArea(
              child: Column(
                children: [
                  const DashboardHeader(),
                  Expanded(child: Placeholder())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
