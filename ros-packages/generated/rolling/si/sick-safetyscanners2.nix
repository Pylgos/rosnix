{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  sick-safetyscanners-base,
  sick-safetyscanners2-interfaces,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_safetyscanners2";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."sick_safetyscanners2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ diagnostic-updater robot-state-publisher rviz2 sensor-msgs sick-safetyscanners2-interfaces sick-safetyscanners-base xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake launch-testing-ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sick_safetyscanners2" = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners2-release.git";
        rev = "96914d8dd6643a74aabae6292156b3aacaf790ca";
        hash = "sha256-DW09MAyJl2QfVunwcVkkufbRSONasFc8m8M5qpi9Dw8=";
      };
    };
  });
  meta = {
    description = "ROS2 Driver for the SICK safetyscanners";
  };
})
