{
  ament-cmake,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hatchbed_common";
  version = "0.1.7-1";
  src = finalAttrs.passthru.sources."hatchbed_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "hatchbed_common" = substituteSource {
      src = fetchgit {
        name = "hatchbed_common-source";
        url = "https://github.com/ros2-gbp/hatchbed_common-release.git";
        rev = "350416708b475226cdf8d0add69af75e3235d498";
        hash = "sha256-F2ZIMhBBNgSFZEebcivWVDUkadR14P7ABp+byVqw7tc=";
      };
    };
  });
  meta = {
    description = "Common Hatchbed C++ utility code for ROS, such registering and handling updates to ros parameters.";
  };
})
