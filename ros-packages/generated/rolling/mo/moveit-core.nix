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
  version = "2.14.1-1";
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
        rev = "80e664ea88620fb9c586cb6a4fb68b5aa2e9a535";
        hash = "sha256-LepGXrVR63R1KWNtFPZl+CmJGPZbopJ2g+5l8o1unjo=";
      };
    };
  });
  meta = {
    description = "Core libraries used by MoveIt";
  };
})
