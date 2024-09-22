{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_server,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    octomap_mapping = substituteSource {
      src = fetchFromGitHub {
        name = "octomap_mapping-source";
        owner = "ros2-gbp";
        repo = "octomap_mapping-release";
        rev = "6cd31f823198e3f9f2d6170ee0daf5979eabccc2";
        hash = "sha256-b/eXXTaTKgI3DlT33nue0Yz0x52yTantz+VlRbfMyzI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_mapping";
  version = "2.3.0-1";
  src = sources.octomap_mapping;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ octomap_server ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mapping tools to be used with the";
  };
}
