{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-ros,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_core";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common pcl-ros rclcpp-lifecycle tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common pcl-ros rclcpp-lifecycle tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_core" = substituteSource {
      src = fetchgit {
        name = "easynav_core-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "b4d6999bdbf54c2cbc50a09886e469a477e03f51";
        hash = "sha256-nwp4ydXcDJMmhRbuB1ATGqJXZIdoOUYor5piEztiCbw=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Abstract interfaces for easynav plugins.";
  };
})
