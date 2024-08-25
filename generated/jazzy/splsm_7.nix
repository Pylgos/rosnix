{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    splsm_7 = substituteSource {
      src = fetchgit {
        name = "splsm_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "ad902c08fe13db07fdacf98d2f6e641fda5fea40";
        hash = "sha256-mJ9R0CRbOAigpJZL+lmcW5OrC4wfPc83FiMx8+NKjwY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7";
  version = "3.0.1-4";
  src = sources.splsm_7;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RoboCup Standard Platform League Standard Message V7 ROS msg";
  };
}
