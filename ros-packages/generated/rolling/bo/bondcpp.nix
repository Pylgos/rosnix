{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  bond,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "bondcpp" = substituteSource {
      src = fetchgit {
        name = "bondcpp-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "d205351d049e87b939b61b2b68efc622d544b5b8";
        hash = "sha256-fbNSgNmnnRCTFEsui9H+C9BJOcZyqF8Cv6sZjP+89qo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "bondcpp";
  version = "4.1.0-1";
  src = sources."bondcpp";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond rclcpp rclcpp_lifecycle smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ implementation of bond, a mechanism for checking when another process has terminated.";
  };
}
