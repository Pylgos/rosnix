{
  ament_cmake_core,
  ament_cmake_export_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_interfaces = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4f2c1edee90bf6c5e6fdbac2a661ec1fa7598d04";
        hash = "sha256-e5jW6Z/xROPkG3IixaK1bA+HUGhTueYh3Yr2wukf08E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_interfaces";
  version = "2.7.0-1";
  src = sources.ament_cmake_export_interfaces;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
}
