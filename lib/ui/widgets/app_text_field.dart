import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final Widget? prefixIcon;
  final String? svgIconPath;
  final String hintText;
  final bool isPassword;

  const AppTextField({
    required this.textController,
    required this.hintText,
    this.prefixIcon,
    this.svgIconPath,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _hideInput;

  @override
  void initState() {
    _hideInput = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      obscureText: _hideInput,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon ??
              (widget.svgIconPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        widget.svgIconPath!,
                      ),
                    )
                  : null),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.c9CA3AF),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _hideInput = !_hideInput;
                    });
                  },
                  icon: SvgPicture.asset(getFullSvgPath(iconName: "eye.svg")))
              : null),
    );
  }
}
