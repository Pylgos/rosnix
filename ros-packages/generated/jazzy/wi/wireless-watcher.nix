{
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wireless-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wireless_watcher";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."wireless_watcher";
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ diagnostic-updater wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "wireless-tools" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_watcher" = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "df17b68f37deb6bf1b3c453505fdf06998ff1090";
        hash = "sha256-lj0B0i9lH8OuEiKwrHPAyJmeyzfdow0iBYtsJAd2z6c=";
      };
    };
  });
  meta = {
    description = "A node which publishes connection information about a linux wireless interface.";
  };
})
