

import 'package:flutter/widgets.dart';
import '../../../../model/artists/artist.dart';
import '../../../../ui/utils/async_value.dart';
import '../../../../data/repositories/artists/artist_repository.dart';

class ArtistViewModel extends ChangeNotifier{
  final ArtistRepository artistRepository;

  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistViewModel({
    required this.artistRepository,
  }); 

}