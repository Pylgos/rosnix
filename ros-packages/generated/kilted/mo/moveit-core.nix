{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-index-cpp,
  angles,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_core";
  version = "2.14.3-1";
  src = finalAttrs.passthru.sources."moveit_core";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ angles common-interfaces eigen3-cmake-module eigen-stl-containers generate-parameter-library geometric-shapes geometry-msgs google-benchmark-vendor kdl-parser moveit-common moveit-msgs octomap-msgs osqp-vendor pluginlib random-numbers rclcpp rsl ruckig sensor-msgs shape-msgs srdfdom std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-kdl trajectory-msgs urdf urdfdom urdfdom-headers visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "boost" "bullet" "eigen" "libfcl-dev" "liboctomap-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ angles common-interfaces eigen3-cmake-module eigen-stl-containers generate-parameter-library geometric-shapes geometry-msgs google-benchmark-vendor kdl-parser moveit-common moveit-msgs octomap-msgs osqp-vendor pluginlib random-numbers rclcpp rsl ruckig sensor-msgs shape-msgs srdfdom std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-kdl trajectory-msgs urdf urdfdom urdfdom-headers visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "bullet" "eigen" "libfcl-dev" "liboctomap-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-index-cpp angles launch-testing-ament-cmake moveit-resources-panda-moveit-config moveit-resources-pr2-description orocos-kdl-vendor rcl-interfaces rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_core" = substituteSource {
      src = fetchgit {
        name = "moveit_core-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b9fed56739d1d2b6255fe2401da3a76171766c22";
        hash = "sha256-tlqH+08w1HXrQSBVA1GoLiszQ2PDmGsNQzZTuU72UNg=";
      };
    };
  });
  meta = {
    description = "Core libraries used by MoveIt";
  };
})
