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
let
  sources = mkSourceSet (sources: {
    "point_cloud_transport_py" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "43f0942b64edd1420b95601cd89dd856b269d68a";
        hash = "sha256-yIYuWWeP+9nnJyi7oZQdVGn6GQaIRGr7NveRBjrFNw4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_py";
  version = "5.1.0-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib point-cloud-transport pybind11-vendor rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Python API for point_cloud_transport";
  };
})
