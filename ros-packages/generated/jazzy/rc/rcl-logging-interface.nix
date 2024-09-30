{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcl_logging_interface" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "0f02a66b68786b02e070f4e4a90d73f26f115413";
        hash = "sha256-r7WviMcNX31Wz2qwm6JYMErRwdpCCnHYKsXyqBxrTrc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcl_logging_interface";
  version = "3.1.0-2";
  src = sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
}
