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
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  propagatedBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_py" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "866093b8df9dd575ced356edd091f0b2e8f2df51";
        hash = "sha256-PfnHWd9RP3pnxe3ZTDPrDrNyLUzftfo1k8falKmeS2E=";
      };
    };
  });
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
