{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking_core";
  version = "1.3.12-1";
  src = finalAttrs.passthru.sources."opennav_docking_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav2-msgs nav2-util rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-msgs nav2-util rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_core" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "2c2c088cf30c7f26d56136fb100d3b8c6bf7ae16";
        hash = "sha256-Rm6N5ZOiucd9E8jJRCuxCyyoaHNNemSmJDH2hkliW3Y=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the opennav docking framework";
  };
})
