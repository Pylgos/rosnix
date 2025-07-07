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
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_py";
  version = "5.2.2-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_py" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "19a3438d84549fa71459961e09e215e3bf829d7f";
        hash = "sha256-PjUfNNIPO4kSMfWnOv7RH+akr+ApSQg851pjm2pjWNI=";
      };
    };
  });
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
