{
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  point-cloud-transport,
  pybind11-vendor,
  python-cmake-module,
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_py";
  version = "4.0.4-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ];
  buildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_py" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "948381205e118ae8192ada4443410f65ba6b5bb7";
        hash = "sha256-VzTBMT+YUEMDQIVZqSMamp5rBhOObdJNZa+vg/4B3OI=";
      };
    };
  });
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
