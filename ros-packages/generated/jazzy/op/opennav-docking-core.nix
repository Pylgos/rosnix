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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."opennav_docking_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-msgs nav2-util rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_core" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "82df545438056a5b4071313f9fbc41dcc9784017";
        hash = "sha256-meDsEmOX++rQ/MKRfEYq+SW4uHBcizOXCd26Jx0LZSo=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the opennav docking framework";
  };
})
