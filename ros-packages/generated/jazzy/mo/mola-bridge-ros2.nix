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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."mola_bridge_ros2";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ geometry-msgs mola-common mola-kernel mola-msgs mrpt-libmaps mrpt-libros-bridge mrpt-nav-interfaces nav-msgs rclcpp ros-environment sensor-msgs tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ geometry-msgs mola-common mola-kernel mola-msgs mrpt-libmaps mrpt-libros-bridge mrpt-nav-interfaces nav-msgs rclcpp ros-environment sensor-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_bridge_ros2" = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "d1445b2f6fd2d2fb38c62fad48a0728a3b98f578";
        hash = "sha256-W4YsRtoFiUJ5FblcklHrFhZ1ieLA5ZCWy0vFB+m082I=";
      };
    };
  });
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
})
