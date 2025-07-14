import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';

class SettingsPages extends StatefulWidget {
  const SettingsPages({super.key, required});

  @override
  State<SettingsPages> createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  TextEditingController controller = TextEditingController();
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool isChecked3 = false;
  double isSlided = 0.0;
  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Column(
                    children: [
                      FilledButton(
                        key: Key('setting_page_snackbarbutton'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 5),
                              content: Text('snack bar'),
                            ),
                          );
                        },
                        child: Text('FilledButton'),
                      ),
                      Divider(
                        color: Colors.deepOrange,
                        thickness: 8.0,
                        //endIndent: 200.0,
                      ),
                      DropdownButton(
                        key: Key('settings_page_droupbutton'),
                        value: menuItem,
                        items: [
                          DropdownMenuItem(
                            value: 'e1',
                            child: Text('element1'),
                          ),
                          DropdownMenuItem(
                            value: 'e2',
                            child: Text('element2'),
                          ),
                          DropdownMenuItem(
                            value: 'e3',
                            child: Text('element3'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            menuItem = value;
                          });
                        },
                      ),

                      TextField(
                        key: Key('settings_page_textfield'),
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                      ),

                      Text(controller.text),
                      Checkbox.adaptive(
                        key: Key('settings_page_checkbox'),
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value;
                          });
                        },
                      ),

                      CheckboxListTile.adaptive(
                        key: Key('settings_page_checkboxlisttile'),
                        value: isChecked2,
                        tristate: true,
                        title: Text('click me'),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value;
                          });
                        },
                      ),

                      Switch.adaptive(
                        key: Key('settings_page_switch'),
                        value: isChecked3,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked3 = value;
                          });
                        },
                      ),

                      SwitchListTile.adaptive(
                        key: Key('settings_page_switchlisttile'),
                        value: isChecked3,
                        title: Text('click me'),
                        onChanged: (value) {
                          setState(() {
                            isChecked3 = value;
                          });
                        },
                      ),

                      Slider.adaptive(
                        key: Key('settings_page_slider'),
                        max: 10.0,
                        divisions: 10,
                        value: isSlided,
                        onChanged: (double value) {
                          setState(() {
                            isSlided = value;
                          });
                          //print(value);
                        },
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     print('image selected');
                      //   },
                      InkWell(
                        key: Key('settings_page_inkwell'),
                        splashColor: Colors.amberAccent[100],
                        onTap: () {
                          //print('image selected');
                        },
                        child: Container(
                          height: 200.0,
                          width: double.infinity,
                          color: Colors.white12,
                        ),

                        //Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        //   Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg'),
                        /* Image.network('https://4kwallpapers.com/images/walls/thumbs_3t/10974.jpg')*/
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          key: Key('settings_page_ElevatedButton'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('ElevatedButton'),
                        ),
                      ),
                      FilledButton(
                        key: Key('settings_page_FilledButton'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Alert Title'),
                                content: Text('hello'),
                                actions: [
                                  FilledButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Dialog_Button'),
                      ),
                      TextButton(
                        key: Key('settings_page_TextButton'),
                        onPressed: () {},
                        child: Text('TextButton'),
                      ),
                      OutlinedButton(
                        key: Key('settings_page_OutlinedButton'),
                        onPressed: () {},
                        child: Text('OutlinedButton'),
                      ),
                      HeroWidget(),
                      CloseButton(),
                      BackButton(key: Key('setting_page_backbutton')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
