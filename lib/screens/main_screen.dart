import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movied/model/category.dart';
import 'package:movied/model/movie.dart';
import 'package:movied/widgets/movie_tile.dart';

class MainScreen extends ConsumerWidget {
  double _deviceHeigt;
  double _deviceWidth;
  TextEditingController _searchTextFieldController;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeigt = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _searchTextFieldController = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Container(
          height: _deviceHeigt,
          width: _deviceWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _backgroundWidget(),
              _foregroundWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeigt,
      width: _deviceHeigt,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images-na.ssl-images-amazon.com/images/I/91B32iU7ayL._AC_SL1500_.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(
              0.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidgets() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        0,
        _deviceHeigt * 0.02,
        0,
        0,
      ),
      width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceHeigt * 0.83,
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeigt * 0.01,
            ),
            child: _moviesListViewWidget(),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeigt * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _category(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      height: _deviceHeigt * 0.05,
      width: _deviceWidth * 0.50,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) {},
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white24,
          ),
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
          filled: false,
          fillColor: Colors.white24,
          hintText: 'Procurar...',
        ),
      ),
    );
  }

  Widget _category() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: Category.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_) {},
      items: [
        DropdownMenuItem(
          child: Text(
            Category.popular,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          value: Category.popular,
        ),
        DropdownMenuItem(
          child: Text(
            Category.upcoming,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          child: Text(
            Category.none,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> _movies = [];
    for (int i = 0; i < 20; i++) {
      _movies.add(
        Movie(),
      );
    }
    if (_movies.length != 0) {
      return ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext _ctx, int _count) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: _deviceHeigt * 0.01,
                horizontal: 0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: MovieTile(
                  movie: _movies[_count],
                  height: _deviceHeigt * 0.20,
                  width: _deviceWidth * 0.85,
                ),
              ),
            );
          });
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
