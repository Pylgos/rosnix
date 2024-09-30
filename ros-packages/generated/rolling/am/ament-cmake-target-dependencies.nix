{
  ament-cmake-core,
  ament-cmake-include-directories,
  ament-cmake-libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "cde5365acc1c9e9d0e1dd7a62982b6e23cb47baf";
        hash = "sha256-pd+SRhXw2GI/r2HTnNf1u/ay+ydgaRFq7DGsnzG4pBU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_target_dependencies";
  version = "2.7.0-1";
  src = sources."ament_cmake_target_dependencies";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
}
