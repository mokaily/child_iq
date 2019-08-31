import 'dart:io';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';

Future savePdf(var x) async {
  final Document pdf = Document(title: 'نتيجة الأختبار');
  final font = await rootBundle.load("fonts/Hacen_Tunisia.ttf");
  final ttf = Font.ttf(font);
  PdfImage image0 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/title.png'));
  PdfImage image1 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/01.png'));
  PdfImage image2 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/space.png'));
  PdfImage image3 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/0.png'));
  PdfImage image4 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/1.png'));
  PdfImage image5 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/2.png'));
  PdfImage image6 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/3.png'));
  PdfImage image7 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/4.png'));
  PdfImage image8 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/5.png'));
  PdfImage image9 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/6.png'));
  PdfImage image10 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/7.png'));
  PdfImage image11 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/02.png'));
  PdfImage image12 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/03.png'));
  PdfImage image13 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/04.png'));
  PdfImage image14 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/05.png'));
  PdfImage image15 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/06.png'));
  PdfImage image16 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/07.png'));
  PdfImage image17 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/08.png'));
  PdfImage image18 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/09.png'));
  PdfImage image19 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/10.png'));
  PdfImage image20 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/11.png'));
  PdfImage image21 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/12.png'));
  PdfImage image22 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/13.png'));
  PdfImage image23 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/14.png'));
  PdfImage image24 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/15.png'));
  PdfImage image25 = await pdfImageFromImageProvider(
      pdf: pdf.document, image: prefix0.AssetImage('assets/99.png'));
  //final Uint8List fontData = File('Hacen_Tunisia.ttf').readAsBytesSync();
  //final ttf = Font.ttf(fontData.buffer.asByteData());
  //print(fontData.toString());
  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Image(image0),
            Column(children: <Widget>[
              Row(children: <Widget>[
                Image(image2),
                Text("${x[0] / 10} %"),
                Image(image3),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[1] / 10} %"),
                Image(image4),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[2] / 10} %"),
                Image(image5),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[3] / 10} %"),
                Image(image6),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[4] / 10} %"),
                Image(image7),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[5] / 10} %"),
                Image(image8),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[6] / 10} %"),
                Image(image9),
              ]),
              Row(children: <Widget>[
                Image(image2),
                Text("${x[7] / 10} %"),
                Image(image10),
              ]),
            ]),
            Text("\n\n"),
            Image(image1),
            Image(image11),
            Image(image12),
            Image(image13),
            Image(image14),
            Image(image15),
            Image(image16),
            Image(image17),
            Image(image18),
            Image(image19),
            Image(image20),
            Image(image21),
            Text("\n\n\n\n\n"),
            Image(image22),
            Image(image23),
            Image(image24),
            Text("\n\n\n\n\n\n\n\n\n"),
            Image(image25),
          ]));

  final output = await getExternalStorageDirectory();
  final file = File("${output.path}/results.pdf");
  await file.writeAsBytes(pdf.save());
  print(output.path.toString());
  OpenFile.open("${output.path}/results.pdf", type: "application/pdf");
}
