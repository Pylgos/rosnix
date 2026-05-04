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
  version = "2.12.0-2";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter_python";
  propagatedNativeBuildInputs = [ rclpy rmf-fleet-adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "pybind11-json-dev" ]; };
  propagatedBuildInputs = [ rclpy rmf-fleet-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "pybind11-json-dev" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "b390fcedcc028b65528419d6a54d34b6c44fafca";
        hash = "sha256-bf5Uo3f/Cx1noF35FLjmZ3XIP7bdFDYG5aRyFv0hNBo=";
      };
    };
  });
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
})
