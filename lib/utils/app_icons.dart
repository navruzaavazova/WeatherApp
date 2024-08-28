enum AppIcons {
  splashScreenIcon('assets/icons/ic_splashIcon.svg'),
  loadingIcon('assets/icons/ic_loading.svg'),
  pressureIcon('assets/icons/icon.svg'),
  humidityIcon('assets/icons/ic_humidity.svg'),
  windIcon('assets/icons/ic_wind.svg'),
  searchIcon('assets/icons/ic_search.svg');

  const AppIcons(this.path);

  final String path;
}
