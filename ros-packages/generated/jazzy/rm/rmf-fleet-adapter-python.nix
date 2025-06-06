{
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-json-vendor,
  pybind11-vendor,
  rclpy,
  rmf-fleet-adapter,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_fleet_adapter_python";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedNativeBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  propagatedBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8610a99d68bcb570375b501d06425abab9df31c5";
        hash = "sha256-XfTRe/cSJkIfMDeYg8+8REz8J6kBWUPi3zslGOtnAtk=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
