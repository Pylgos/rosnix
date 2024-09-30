{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  flexbe-states,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "flexbe_onboard" = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "62eef8ad46fa86a61d4e4dce3c42aa1feb201993";
        hash = "sha256-EbO7yBYjwzsyok21wnRFK+vFSQE/2Pf3K63lSfzHNSk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "flexbe_onboard";
  version = "3.0.3-1";
  src = sources."flexbe_onboard";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.";
  };
}
