import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

import '../../modules/web_view_screen/web_view_screen.dart';

Widget data(list, context, index) {
  return Container(
    color: AppCubit.get(context).selectedItem == index && AppCubit.get(context).isDesktop ? Colors.grey[400] : null,
    child: InkWell(
      onTap: () {
        //navigateTo(context, WebViewScreen(url: '${list['url']}',),);
        AppCubit.get(context).getSelectedItem(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage('${list['urlToImage']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: SizedBox(
                    height: 80.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${list['title']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Text(
                          '${list['publishedAt']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget separator() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 2.0,
      color: HexColor('DEE2E6'),
    ),
  );
}

Widget circularProgressIndicator() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: HexColor('6C757D'),
    color: HexColor('E9ECEF'),
  ));
}

Widget textFormField({
  required TextEditingController controller,
  required Function validate,
  required String labelText,
  required IconData prefix,
  double borderRadius = 10.0,
  bool autoFocus = false,
  bool isPassword = false,
  IconData? suffix,
  Function? onTap,
  Function? onChange,
  TextDirection? textDirection,
}) {
  return TextFormField(
    controller: controller,
    autofocus: autoFocus,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefix),
      border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
    ),
    textDirection: textDirection,
    validator: (value) {
      return validate(value);
    },
    onTap: () {
      // ignore: void_checks
      onTap!();
    },
    onChanged: (String value) {
      onChange!(value);
    },
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));

Widget newsScreenBuilder(
  list,
  context, {
  required String urlToImage,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image(
            image: NetworkImage(urlToImage),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 10.0),
        Text(
          description,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1,
          textDirection: TextDirection.rtl,
        ),
        Center(
          child: TextButton(
              onPressed: () {
                navigateTo(
                  context,
                  WebViewScreen(url: '${list['url']}'),
                );
              },
              child: const Text('أقرأ المقال كاملا')),
        ),
      ],
    ),
  );
}
