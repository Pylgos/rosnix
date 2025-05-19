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
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedNativeBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  propagatedBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "d617755dcfb2de87e67ebf0faa9f11dd43b0074e";
        hash = "sha256-Qagfp0W/n7kpuliW+1S8hmfTrY+kYNOPhtElrERWdD8=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
