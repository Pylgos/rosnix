{
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rmf-fleet-adapter,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_fleet_adapter_python";
  version = "2.11.1-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "pybind11-json-dev" ]; };
  propagatedBuildInputs = [ rclpy rmf-fleet-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "pybind11-json-dev" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "64135a7620a45c4874f20f29c2b729bc7b813ec0";
        hash = "sha256-UwjsWpHvbj/DtT2oJrH4HvdvtBldaFw6M8FK5n6Rk3Y=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
