{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-description,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-description,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  orocos-kdl-vendor,
  pluginlib,
  ros-testing,
  rosSystemPackages,
  rsl,
  substituteSource,
  tf2,
  tf2-kdl,
  urdfdom,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_kinematics" = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e6bac77b77b63caf01dda902c3d3c38b8de6cc18";
        hash = "sha256-hseesEOBXSfOj36mGIbEmGSddLotrO+orC8BkjQnkzw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.10.0-1";
  src = sources."moveit_kinematics";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class-loader generate-parameter-library moveit-common moveit-core moveit-msgs moveit-ros-planning orocos-kdl-vendor pluginlib rsl tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest launch-param-builder moveit-configs-utils moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for all inverse kinematics solvers in MoveIt";
  };
}
