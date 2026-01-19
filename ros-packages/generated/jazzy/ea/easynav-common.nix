{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  vision-msgs,
  yaets,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_common";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."easynav_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs nav-msgs pcl-conversions pcl-ros rclcpp rclcpp-lifecycle sensor-msgs tf2-geometry-msgs tf2-ros vision-msgs yaets ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs pcl-conversions pcl-ros rclcpp rclcpp-lifecycle sensor-msgs tf2-geometry-msgs tf2-ros vision-msgs yaets ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_common" = substituteSource {
      src = fetchgit {
        name = "easynav_common-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "90a342068ed9bd8c1936228872d02a88f68d7841";
        hash = "sha256-zqmvjQuowGTO5AJWJJECtr/9+XrnfhOEUVI1H06WXtQ=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Utils and types package.";
  };
})
