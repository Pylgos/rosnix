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
  orocos-kdl-vendor,
  python-cmake-module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_geometry_msgs";
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_geometry_msgs";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ geometry-msgs orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "b860c239d4055c63495641f69a3a0b977552ff9d";
        hash = "sha256-tycqXK6JTMd/xyy1rUsJLJ3a1IXWjEDbJRic/FoKNWY=";
      };
    };
  });
  meta = {
    description = "tf2_geometry_msgs";
  };
})
