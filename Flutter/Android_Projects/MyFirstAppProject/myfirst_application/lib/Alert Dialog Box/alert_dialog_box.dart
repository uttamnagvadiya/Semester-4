import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AlertDialogBoxes extends StatefulWidget {
  const AlertDialogBoxes({Key? key}) : super(key: key);

  @override
  State<AlertDialogBoxes> createState() => _AlertDialogBoxesState();
}

class _AlertDialogBoxesState extends State<AlertDialogBoxes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Boxes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getButton('Info', DialogType.info,),
            getButton('Error', DialogType.error,),
            getButton('No Header', DialogType.noHeader,),
            getButton('Info Reverse', DialogType.infoReverse,),
            getButton('Question', DialogType.question,),
            getButton('Warning', DialogType.warning,),
            getButton('Success', DialogType.success,),
          ],
        ),
      ),
    );
  }

  Widget getButton (btnName, type) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: (){
              getAlertBox(type, btnName);
            },
            child: Text(btnName),
          ),
        ),
      ],
    );
  }

  void getAlertBox (boxType, label) {
    AwesomeDialog(
      context: context,
      dialogType: boxType,
      width: double.infinity,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dismissed by $type'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: label,
      desc: "This Dialog can't be dismissed touching outside",
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
