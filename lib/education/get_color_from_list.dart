int getColorFromList(List selectColorList, int n) {
  if (selectColorList.length > n) {
    return selectColorList[n];
  } else {
    return 0x00FFFFFF;
  }
}
