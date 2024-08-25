{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_libraries = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "72f229348f16dbece6e2541f6076e74d538810be";
        hash = "sha256-hyHKyrC0qCPmU61i5XbCz/A9iZ2EcUz6pBZSxa76gio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_libraries";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_libraries;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
}
