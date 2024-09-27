{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_server,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    octomap_mapping-918cf6c3585bab48f747e6301424388cc394363b = substituteSource {
      src = fetchgit {
        name = "octomap_mapping-918cf6c3585bab48f747e6301424388cc394363b-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "918cf6c3585bab48f747e6301424388cc394363b";
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
  src = sources.octomap_mapping-918cf6c3585bab48f747e6301424388cc394363b;
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
