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
  version = "0.0.8-1";
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
        rev = "40dbba50b0071e74829667ff579f9213732cc972";
        hash = "sha256-Q0q1DnI+SNJMUTTTJsMD9Lbl6UkIpVdF51n6/DS0eVM=";
      };
    };
  });
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
})
