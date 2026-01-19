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
  version = "0.3.2-1";
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
        rev = "6d161a7754448d208a24ad76cc9e40f37b0ebd3f";
        hash = "sha256-Fkach8iHAm8vdoIIG6u5X2hKksSjuA0dOVe0PiDczTI=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Utils and types package.";
  };
})
