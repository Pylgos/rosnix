{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_server,
  substituteSource,
}:
let
  sources = rec {
    octomap_mapping = substituteSource {
      src = fetchgit {
        name = "octomap_mapping-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap_server ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Mapping tools to be used with the";
  };
}
