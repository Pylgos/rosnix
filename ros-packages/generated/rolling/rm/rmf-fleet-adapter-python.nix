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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedNativeBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  propagatedBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "0a22e7f5802a0671ab0250fbaee73a7b25fd2fed";
        hash = "sha256-Z03NYoVLfqpaFvvsReR2kZkJkLVq6A1xvRWxIFE0dKI=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
