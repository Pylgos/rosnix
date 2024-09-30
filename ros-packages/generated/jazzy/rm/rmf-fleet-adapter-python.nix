{
  ament-cmake-pytest,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rmf_fleet_adapter_python" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8610a99d68bcb570375b501d06425abab9df31c5";
        hash = "sha256-XfTRe/cSJkIfMDeYg8+8REz8J6kBWUPi3zslGOtnAtk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf-fleet-adapter-python";
  version = "2.7.2-1";
  src = sources."rmf_fleet_adapter_python";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pybind11-json-vendor pybind11-vendor rclpy rmf-fleet-adapter ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
}