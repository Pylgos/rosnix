{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-export-dependencies,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros_testing" = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "56f6ba90ce5a80ef42bb8a398d1f9b427626c864";
        hash = "sha256-CCY++zeA6CY3WCkxRl5FTCFac8DPBSMpQd7N2ciH0oA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_testing";
  version = "0.7.0-1";
  src = sources."ros_testing";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing-ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch-testing launch-testing-ros ros2test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
}
