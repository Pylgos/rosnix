{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-index-cpp,
  angles,
  buildRosPackage,
  common-interfaces,
  eigen-stl-containers,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometric-shapes,
  geometry-msgs,
  google-benchmark-vendor,
  kdl-parser,
  launch-testing-ament-cmake,
  mkSourceSet,
  moveit-common,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-resources-pr2-description,
  octomap-msgs,
  orocos-kdl-vendor,
  osqp-vendor,
  pluginlib,
  random-numbers,
  rcl-interfaces,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rsl,
  ruckig,
  sensor-msgs,
  shape-msgs,
  srdfdom,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-kdl,
  trajectory-msgs,
  urdf,
  urdfdom,
  urdfdom-headers,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_core" = substituteSource {
      src = fetchgit {
        name = "moveit_core-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "4ddbf0913eeb711c68b916e71d92c144500892da";
        hash = "sha256-WwWn+S+POgbqVVFiTNS9YCPW4HwH0UtkvCrAYRmEuIE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit-core";
  version = "2.10.0-1";
  src = sources."moveit_core";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module google-benchmark-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles common-interfaces eigen-stl-containers generate-parameter-library geometric-shapes geometry-msgs kdl-parser moveit-common moveit-msgs octomap-msgs osqp-vendor pluginlib random-numbers rclcpp rsl ruckig sensor-msgs shape-msgs srdfdom std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-kdl trajectory-msgs urdf urdfdom urdfdom-headers visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "bullet" "eigen" "libfcl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-index-cpp angles launch-testing-ament-cmake moveit-resources-panda-moveit-config moveit-resources-pr2-description orocos-kdl-vendor rcl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Core libraries used by MoveIt";
  };
}
