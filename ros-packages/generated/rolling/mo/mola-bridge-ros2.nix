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
  mrpt-nav-interfaces,
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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_bridge_ros2";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ geometry-msgs mola-common mola-kernel mola-msgs mrpt-libmaps mrpt-libros-bridge mrpt-nav-interfaces nav-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_bridge_ros2" = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "85bea2329376ce4de8ce026b9354afee4a246eca";
        hash = "sha256-xRQcSMOJqji/w1u7gYuLmCa+azwrx2tR7curXUIg/vY=";
      };
    };
  });
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
})
