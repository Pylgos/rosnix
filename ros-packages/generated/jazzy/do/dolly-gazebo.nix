{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  dolly-follow,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "dolly_gazebo" = substituteSource {
      src = fetchgit {
        name = "dolly_gazebo-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "0bde960b5ce53fba85a03fa3f289a6f4a2ca1286";
        hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dolly_gazebo";
  version = "0.4.0-6";
  src = sources."dolly_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dolly-follow ros2launch rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launch Gazebo simulation with Dolly robot.";
  };
}
