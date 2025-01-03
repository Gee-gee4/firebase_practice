import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_practice/model/song.dart';
import 'package:flutter/material.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: 'Budapest',
      artistName: 'George Ezra',
      albumArtImagePath: 'assets2/album_cover/budapest.jpg',
      audioPath: 'my_music/george_ezra_budapest_lyrics_aac_69304.m4a',
    ),
    Song(
      songName: 'Be the one',
      artistName: 'Dua Lipa',
      albumArtImagePath: 'assets2/album_cover/dua_lipa.jpg',
      audioPath: 'my_music/dua_lipa_be_the_one_lyrics_aac_69167.m4a',
    ),
    Song(
      songName: 'Fat funny friend',
      artistName: 'Maddie Zahm',
      albumArtImagePath: 'assets2/album_cover/fat_funny_f.jpeg',
      audioPath:
          'my_music/maddie_zahm_fat_funny_friend_lyrics_i_ve_drawn_out_in_sharpie_where_i_d_take_the_scissors_aac_68857.m4a',
    ),
    Song(
      songName: 'Jeje',
      artistName: 'Tems',
      albumArtImagePath: 'assets2/album_cover/jeje.jpg',
      audioPath: 'my_music/tems_love_me_jeje_lyrics_aac_69211.m4a',
    ),
    Song(
      songName: 'Kante',
      artistName: 'Davido ft Fave',
      albumArtImagePath: 'assets2/album_cover/kante.jpg',
      audioPath: 'my_music/davido_kante_official_audio_ft._fave_aac_15723.m4a',
    ),
    Song(
      songName: 'Faking it',
      artistName: 'Calvin Harris ft Kehlani',
      albumArtImagePath: 'assets2/album_cover/calvin.jpeg',
      audioPath: 'my_music/calvin_harris_faking_it_official_video_ft._kehlani_lil_yachty_aac_68751.m4a',
    ),
    Song(
      songName: 'Faking it lyrics',
      artistName: 'Sasha Sloan',
      albumArtImagePath: 'assets2/album_cover/sasha.jpg',
      audioPath: 'my_music/sasha_sloan_faking_it_lyrics_aac_68788.m4a',
    ),
    Song(
      songName: 'Twikle',
      artistName: 'Dexta Daps',
      albumArtImagePath: 'assets2/album_cover/twinkle.jpg',
      audioPath: 'my_music/dexta_daps_twinkle_lyrics_video_aac_68697.m4a',
    ),
    Song(
      songName: 'Sina noma',
      artistName: 'Charisma',
      albumArtImagePath: 'assets2/album_cover/sina_noma.jpg',
      audioPath: 'my_music/charisma_sina_noma_official_video_aac_15759.m4a',
    ),
  ];
  //current song playlist index
  int? _currentSongIndex;

  /*
  AUDIO PLAYER
  */
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;

    print("Playing song from: assets/$path");

    await _audioPlayer.stop(); //stop current song

    await _audioPlayer.play(AssetSource(path)); // Play the new song

    // Play the new song
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's last song, loop to the first song
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    //if more that 2 seconds have passed,restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if its within 1st 2 seconds of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if its the last song, loop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose audio player

  //getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); //play the song at new index
    }

    //update UI
    notifyListeners();
  }
}
