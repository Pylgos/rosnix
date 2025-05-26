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
  version = "0.0.3-1";
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
        rev = "4eaa6dd1537dc4312264d695292fb90088f82642";
        hash = "sha256-7VuP/iNcLIjoSRXYs+mm+ferkWhPAfBAskFOqjEQl7k=";
      };
    };
  });
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
})
