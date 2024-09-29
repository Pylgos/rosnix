{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "splsm_7" = substituteSource {
      src = fetchgit {
        name = "splsm_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "ad902c08fe13db07fdacf98d2f6e641fda5fea40";
        hash = "sha256-mJ9R0CRbOAigpJZL+lmcW5OrC4wfPc83FiMx8+NKjwY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "splsm-7";
  version = "3.0.1-4";
  src = sources."splsm_7";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup Standard Platform League Standard Message V7 ROS msg";
  };
}
