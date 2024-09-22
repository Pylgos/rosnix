{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    moveit_resources_fanuc_description = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_resources_fanuc_description-source";
        owner = "ros2-gbp";
        repo = "moveit_resources-release";
        rev = "f26f506f77258b10fedb717550e1b4eeacde9b3a";
        hash = "sha256-x/iys4VikU/BQxbNSLBFX67NjJOLF/0SG8WHjCrEovs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_description";
  version = "3.0.0-2";
  src = sources.moveit_resources_fanuc_description;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Fanuc Resources used for MoveIt testing";
  };
}
