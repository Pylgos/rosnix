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
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_geometry_msgs";
  version = "0.46.0-1";
  src = finalAttrs.passthru.sources."tf2_geometry_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "7605406515c49d115e67d770d00ef42666cba394";
        hash = "sha256-DJKHvLuB2CZYaAMU7k5/XMAtWMPb57615gCX1U8+5kE=";
      };
    };
  });
  meta = {
    description = "\n    tf2_geometry_msgs\n  ";
  };
})
