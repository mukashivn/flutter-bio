import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      // appBar: EmptyAppBar(),
      body: _buildBody(),
      // resizeToAvoidBottomInset: false, //TODO: If set false will cannot scroll view
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return GestureDetector(
      onTap: () {
        DeviceUtils.hideKeyboard(context);
      }, //For dissmiss keyboard when click outside
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Observer(
              builder: (context) {
                return Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [AppColors.GradientEnd, AppColors.GradientBegin],
                    )),
                    child: _buildLoginForm());
              },
            ),
            Observer(
              builder: (context) {
                return _store.success
                    ? navigate(context)
                    : _showErrorMessage(_store.errorStore.errorMessage);
              },
            ),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _store.loading,
                  child: CustomProgressIndicatorWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 72.0),
            AppIconWidget(
                image: Assets.appLogo, tinColor: Colors.white, aspectSize: 0.4),
            SizedBox(height: 48.0),
            _buildUserIdField(),
            SizedBox(height: 24.0),
            _buildPasswordField(),
            _buildForgotPasswordButton(),
            _buildSignInButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return TextFieldWidget(
      hint: AppLocalizations.of(context).translate(Strings.hintEmail),
      inputType: TextInputType.emailAddress,
      icon: Icons.person,
      hintColor: AppColors.LoginInputHint,
      textController: _userEmailController,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onChanged: (value) {
        _store.setUserId(_userEmailController.text);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      errorText: _store.formErrorStore.userEmail,
    );
  }

  Widget _buildPasswordField() {
    return TextFieldWidget(
      hint: AppLocalizations.of(context).translate(Strings.hintPassword),
      isObscure: true,
      icon: Icons.lock,
      hintColor: AppColors.LoginInputHint,
      iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
      textController: _passwordController,
      focusNode: _passwordFocusNode,
      errorText: _store.formErrorStore.password,
      onChanged: (value) {
        _store.setPassword(_passwordController.text);
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
        child: Text(
          AppLocalizations.of(context).translate(Strings.btnForgotPass),
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    var canLogin = _store.canLogin;
    var buttonColor = canLogin ? Colors.white : Color(0xFFd2d2d2);
    var textColor = canLogin ? AppColors.BaseAppColor : Colors.white;
    return ButtonTheme(
        height: 48,
        child: ElevatedButton(
          onPressed: () async {
            if (_store.canLogin) {
              DeviceUtils.hideKeyboard(context);
              _store.login();
            } else {
              _showErrorMessage('Please fill in all fields');
            }
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.all(16),
              primary: buttonColor),
          child: Text(
            AppLocalizations.of(context).translate(Strings.btnSignIn),
            style: TextStyle(fontSize: 14, color: textColor),
          ),
        ));
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
