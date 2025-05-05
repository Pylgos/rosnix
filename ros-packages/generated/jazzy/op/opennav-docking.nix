{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-graceful-controller,
  nav2-msgs,
  nav2-util,
  opennav-docking-core,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."opennav_docking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core pluginlib rclcpp-action sensor-msgs tf2-ros yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking" = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d2f17a5beb9677494b171ec4b1c5b5fcc06fbf41";
        hash = "sha256-NlLtSImJSmRVGFazLy3Ehk2FsjEO7QNYu/AMEadl0Ys=";
      };
    };
  });
  meta = {
    description = "A Task Server for robot charger docking";
  };
})
