{
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  point-cloud-transport,
  point-cloud-transport-plugins,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_tutorial";
  version = "0.0.6-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_tutorial";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ point-cloud-transport point-cloud-transport-plugins rclcpp rosbag2-cpp sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ point-cloud-transport point-cloud-transport-plugins rclcpp rosbag2-cpp sensor-msgs ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_tutorial" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_tutorial-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_tutorial-release.git";
        rev = "07f5c8a0fff86a838e5b4983c61760adb90fe6d3";
        hash = "sha256-xxQ04NSg3ZSI1C1/4NpZNEq2FSGdQ9D5iKNkcuPIJO4=";
      };
    };
  });
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
})
