
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9/ui/screens/artists/widgets/artist_content.dart';
import '../../../../data/repositories/artists/artist_repository.dart';
import '../../../../ui/screens/artists/view_model/artist_view_model.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArtistViewModel(
        artistRepository: context.read<ArtistRepository>(),
      ),
      builder: (context, child) {
        return ArtistContent();
      },
    );
  }
}