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
  version = "1.8.0-1";
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
        rev = "afb1b43363734ccbe13033451093664c79277387";
        hash = "sha256-d9cP23ynkUDTqmtnZFEQaiVvEYiBoi6G14jBbCvFDS8=";
      };
    };
  });
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
})
