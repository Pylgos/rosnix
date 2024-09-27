{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_interface-3f1144cd0743133ab5c363aef570a252e953d934 = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-3f1144cd0743133ab5c363aef570a252e953d934-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "3f1144cd0743133ab5c363aef570a252e953d934";
        hash = "sha256-+mSYN+P4pTbivkfSCIW8bhHmcPsgnEtLeTNaE6FpMDQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_interface";
  version = "3.2.1-1";
  src = sources.rcl_logging_interface-3f1144cd0743133ab5c363aef570a252e953d934;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
}
