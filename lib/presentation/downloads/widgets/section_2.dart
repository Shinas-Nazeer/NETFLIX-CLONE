import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/downloads/downloads_bloc.dart';
import '../../../core/constant_strings.dart';
import '../../../core/constants.dart';
import 'download_image_widget.dart';

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(DownloadsEvent.getDownloadImages());
    });
    final Size size = MediaQuery.of(context).size;
   
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'We\'ll download a personalzed selections of\nmovies and shows for you, so there\'s\nalways something to watch on your\ndevice.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: kGrey),
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
           
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.4,
                          backgroundColor: kGrey.withOpacity(0.4),
                        ),
                        DownloadsImageWidget(
                          angle: 20,
                          margin: EdgeInsets.only(left: 170, bottom: 40),
                          image:
                              '$imageAppendurl${state.downloads[0].posterpath}',
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          angle: -20,
                          margin: EdgeInsets.only(right: 170, bottom: 40),
                          image:
                              '$imageAppendurl${state.downloads[1].posterpath}',
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          angle: 0,
                          margin: EdgeInsets.only(bottom: 0),
                          image:
                              '$imageAppendurl${state.downloads[2].posterpath}',
                          size: Size(size.width * 0.41, size.width * 0.63),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}