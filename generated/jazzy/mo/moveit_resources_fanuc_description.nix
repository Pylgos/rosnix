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
    moveit_resources_fanuc_description-d468edc461adbbc22d4f3fcf715695f491927ce9 = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-d468edc461adbbc22d4f3fcf715695f491927ce9-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "d468edc461adbbc22d4f3fcf715695f491927ce9";
        hash = "sha256-x/iys4VikU/BQxbNSLBFX67NjJOLF/0SG8WHjCrEovs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_description";
  version = "3.0.0-3";
  src = sources.moveit_resources_fanuc_description-d468edc461adbbc22d4f3fcf715695f491927ce9;
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
