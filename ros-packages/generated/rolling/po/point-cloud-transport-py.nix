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
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_py";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ pluginlib point-cloud-transport rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib point-cloud-transport rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_py" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "be375f8936155546678caee8633279de78c26c6c";
        hash = "sha256-Mw/A3T2vjXMJis4H5H1nWlE/BXMdPr7bfXj2z67QevA=";
      };
    };
  });
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
