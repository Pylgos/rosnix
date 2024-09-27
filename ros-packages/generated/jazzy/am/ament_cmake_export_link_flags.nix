{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_link_flags-b46ce25edae48db6e13008a86eda21f2765316c2 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-b46ce25edae48db6e13008a86eda21f2765316c2-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b46ce25edae48db6e13008a86eda21f2765316c2";
        hash = "sha256-vpjLsmo6PirL73NMhMciK26tYWpc1YbIU/6+BnXFnVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_link_flags";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_link_flags-b46ce25edae48db6e13008a86eda21f2765316c2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
}
