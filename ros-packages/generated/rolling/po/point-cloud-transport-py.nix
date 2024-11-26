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
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "point_cloud_transport_py" = substituteSource {
        src = fetchgit {
          name = "point_cloud_transport_py-source";
          url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
          rev = "a3565cdfb8ae58cebbc86b7e2c34b3411e6ad867";
          hash = "sha256-rUphEDKBfwOh3aH/btXn5El1+wexm7MSJgUd0vt0rn8=";
        };
      };
    });
  };
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
