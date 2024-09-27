{
  ament_cmake_core,
  ament_cmake_export_definitions,
  ament_cmake_export_dependencies,
  ament_cmake_export_include_directories,
  ament_cmake_export_interfaces,
  ament_cmake_export_libraries,
  ament_cmake_export_link_flags,
  ament_cmake_export_targets,
  ament_cmake_gen_version_h,
  ament_cmake_libraries,
  ament_cmake_python,
  ament_cmake_target_dependencies,
  ament_cmake_test,
  ament_cmake_version,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake-4b7f3ca2b9f7d14c4393c82a62b0c55768e3ac01 = substituteSource {
      src = fetchgit {
        name = "ament_cmake-4b7f3ca2b9f7d14c4393c82a62b0c55768e3ac01-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4b7f3ca2b9f7d14c4393c82a62b0c55768e3ac01";
        hash = "sha256-gzQNWAvMJZnaye/yRxtOMu6m3v+iBzdymPJUA6gL8sc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake";
  version = "2.5.2-1";
  src = sources.ament_cmake-4b7f3ca2b9f7d14c4393c82a62b0c55768e3ac01;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_definitions ament_cmake_export_dependencies ament_cmake_export_include_directories ament_cmake_export_interfaces ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_export_targets ament_cmake_gen_version_h ament_cmake_libraries ament_cmake_python ament_cmake_target_dependencies ament_cmake_test ament_cmake_version ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The entry point package for the ament buildsystem in CMake.";
  };
}
