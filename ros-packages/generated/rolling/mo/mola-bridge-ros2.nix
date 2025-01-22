{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mola-msgs,
  mrpt-libmaps,
  mrpt-libros-bridge,
  nav-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_bridge_ros2";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."mola_bridge_ros2";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ geometry-msgs mola-common mola-kernel mola-msgs mrpt-libmaps mrpt-libros-bridge nav-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_bridge_ros2" = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5e8e0e4ede1d5ff068f4493c2dcd1169ea5923dd";
        hash = "sha256-gTmYkC33YyOwiyCJ22OTrvDrCI6HeA5wkV9sB2Q3Dtk=";
      };
    };
  });
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
})
