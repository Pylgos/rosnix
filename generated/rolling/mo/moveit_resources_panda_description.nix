{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    moveit_resources_panda_description-cde405292139d948f36301b4fe5faa414a4d7526 = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-cde405292139d948f36301b4fe5faa414a4d7526-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "cde405292139d948f36301b4fe5faa414a4d7526";
        hash = "sha256-50HSyW1h2ttqppwymHM5VIpHYEHUYQ03FbKAAnIfdGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_panda_description";
  version = "3.0.0-2";
  src = sources.moveit_resources_panda_description-cde405292139d948f36301b4fe5faa414a4d7526;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "panda Resources used for MoveIt testing";
  };
}
