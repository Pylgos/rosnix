{
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_json_vendor,
  pybind11_vendor,
  rclpy,
  rmf_fleet_adapter,
  substituteSource,
}:
let
  sources = rec {
    rmf_fleet_adapter_python = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8610a99d68bcb570375b501d06425abab9df31c5";
        hash = "sha256-XfTRe/cSJkIfMDeYg8+8REz8J6kBWUPi3zslGOtnAtk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter_python";
  version = "2.7.2-1";
  src = sources.rmf_fleet_adapter_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_json_vendor pybind11_vendor rclpy rmf_fleet_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python bindings for the rmf_fleet_adapter";
  };
}
