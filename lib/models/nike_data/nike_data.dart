import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/models/nike_data/nike_shoes.dart';

final listCategory = ['Basketball', 'Running', 'Training'];

final listShoes = [
  Shoes(
    'AIR JORDAN 1 MID SE GC',
    'NIKE AIR',
    '\$120.00',
    4,
    [
      ImageShoes(
        'assets/nike_assets/J_001.png',
        const Color(0xffEAA906),
      ),
      ImageShoes(
        'assets/nike_assets/J_002.png',
        const Color(0xff08B894),
      ),
      ImageShoes(
        'assets/nike_assets/J_003.png',
        const Color(0xffB50D0D),
      ),
      ImageShoes(
        'assets/nike_assets/J_004.png',
        const Color(0xff229954),
      ),
    ],
  ),
  Shoes(
    'NIKE BLAZZER MID',
    'NIKE AIR',
    '\$150.00',
    3,
    [
      ImageShoes(
        'assets/nike_assets/Z_001.png',
        const Color(0xff08B894),
      ),
      ImageShoes(
        'assets/nike_assets/Z_002.png',
        const Color(0xffE90311),
      ),
      ImageShoes(
        'assets/nike_assets/Z_003.png',
        const Color(0xff189E03),
      ),
      ImageShoes(
        'assets/nike_assets/Z_004.png',
        const Color(0xffF76A02),
      ),
    ],
  ),
  Shoes(
    'ZoomX Vaporfly',
    'NIKE ZOOM',
    '\$180.00',
    4,
    [
      ImageShoes(
        'assets/nike_assets/N_001.png',
        const Color(0xff7B7A41),
      ),
      ImageShoes(
        'assets/nike_assets/N_002.png',
        const Color(0xff2C2C46),
      ),
      ImageShoes(
        'assets/nike_assets/N_003.png',
        const Color(0xff262626),
      ),
      ImageShoes(
        'assets/nike_assets/N_004.png',
        const Color(0xff5C9462),
      ),
    ],
  )
];
