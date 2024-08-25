{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  bond,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  rclcpp,
  rclcpp_lifecycle,
  smclib,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    bondcpp = substituteSource {
      src = fetchgit {
        name = "bondcpp-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "5d1cd97ca5849587ac2763330b3841445d886e87";
        hash = "sha256-fbNSgNmnnRCTFEsui9H+C9BJOcZyqF8Cv6sZjP+89qo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bondcpp";
  version = "4.1.0-1";
  src = sources.bondcpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond rclcpp rclcpp_lifecycle smclib util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "C++ implementation of bond, a mechanism for checking when another process has terminated.";
  };
}
