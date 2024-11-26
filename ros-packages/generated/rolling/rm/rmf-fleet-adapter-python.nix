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
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ];
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "a304c5813ef79237ee0996be9c5aee5fa9e1c1dc";
        hash = "sha256-IrWspRQCLirNJ7Y1cLy3uzuvENbHmiLgfUNF4nwsRxw=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
