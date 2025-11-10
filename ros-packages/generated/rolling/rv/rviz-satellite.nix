{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_satellite";
  version = "4.3.0-1";
  src = finalAttrs.passthru.sources."rviz_satellite";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "proj" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "proj" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_satellite" = substituteSource {
      src = fetchgit {
        name = "rviz_satellite-source";
        url = "https://github.com/nobleo/rviz_satellite-release.git";
        rev = "1481176ea298680facf6d0acca7bb38d69a31278";
        hash = "sha256-mZLvpoyLqQy13Jk3MFSqFdcATU1Sl2QPenOboZvDS9I=";
      };
    };
  });
  meta = {
    description = "Display satellite map tiles in RViz";
  };
})
