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
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_interface = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
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
  src = sources.rcl_logging_interface;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common rcpputils ];
  missingDependencies = [  ];
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
}
