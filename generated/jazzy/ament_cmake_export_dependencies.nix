{
  ament_cmake_core,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_dependencies = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "41aa3c8243d4e647aa120fc636b29dcf528a5ead";
        hash = "sha256-S1tYBjIjvtfJCrfis6oUq5wEgO6kpa3y9j3GMIeLk/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_dependencies";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_dependencies;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
}
