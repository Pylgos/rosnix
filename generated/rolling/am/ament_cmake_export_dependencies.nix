{
  ament_cmake_core,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_dependencies-a77372c7de34733df7a9c92e803423921cf3e008 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-a77372c7de34733df7a9c92e803423921cf3e008-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a77372c7de34733df7a9c92e803423921cf3e008";
        hash = "sha256-MI94jWcjIodSOhU7s/tr237q1pel8LsM1OxL5a/fjIA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_dependencies";
  version = "2.7.0-1";
  src = sources.ament_cmake_export_dependencies-a77372c7de34733df7a9c92e803423921cf3e008;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_libraries ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_libraries ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
}
