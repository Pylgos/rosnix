{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  libccd,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic = substituteSource {
      src = fetchgit {
        name = "rmf_traffic-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "788dbf8355d4db7f572c009ef58e019c668216b5";
        hash = "sha256-4ohkEyM2wji8NvyX9v0qDK8vKb5T5uCahaQc83GmKuo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic";
  version = "3.3.3-1";
  src = sources.rmf_traffic;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libccd rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Package for managing traffic in the Robotics Middleware Framework";
  };
}
