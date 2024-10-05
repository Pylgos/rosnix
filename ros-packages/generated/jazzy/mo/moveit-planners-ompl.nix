{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-resources-pr2-description,
  moveit-ros-planning,
  ompl,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_planners_ompl" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_ompl-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e1c5a7257b73f495419808e94652fae0b0782afc";
        hash = "sha256-W+rFXVi8+8p9Zw1yJ7jOSgc6aT0r1pT4bZ9kGXdDySc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "moveit_planners_ompl";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_planners_ompl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs moveit-ros-planning ompl pluginlib rclcpp tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libomp-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-resources-pr2-description tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "MoveIt interface to OMPL";
  };
})
