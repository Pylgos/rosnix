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
  version = "4.2.1-1";
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
        rev = "9abb9d0059ccaf4d8fe5fe8b66e42760c6a62f5b";
        hash = "sha256-xptX208zmyRwiIFFWEiE2VfqDJPi/9NNVFAFqealtrA=";
      };
    };
  });
  meta = {
    description = "Display satellite map tiles in RViz";
  };
})
