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
    ament_cmake_export_targets = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "521a7f65f30443a6a6fd9111d5d4b248c34064a6";
        hash = "sha256-V36nAdHMYOoJg7ayBiAI9qReleGkG2O0LiTFO95nUFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_targets";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_targets;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
}
