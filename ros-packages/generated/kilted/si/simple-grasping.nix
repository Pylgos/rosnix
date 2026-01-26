{
  ament-cmake,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grasping-msgs,
  mkSourceSet,
  moveit-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  shape-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simple_grasping";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."simple_grasping";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs grasping-msgs moveit-msgs pcl-conversions pcl-ros rclcpp rclcpp-action rclcpp-components sensor-msgs shape-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grasping-msgs moveit-msgs pcl-conversions pcl-ros rclcpp rclcpp-action rclcpp-components sensor-msgs shape-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "simple_grasping" = substituteSource {
      src = fetchgit {
        name = "simple_grasping-source";
        url = "https://github.com/ros2-gbp/simple_grasping-release.git";
        rev = "ef39d770f99a719e2327489691c510a038ca914a";
        hash = "sha256-J9J5I34hYm8WFX3KFffCQLcJwDmI3IUlC8pXEgcaS04=";
      };
    };
  });
  meta = {
    description = "\n    Basic grasping applications and demos.\n  ";
  };
})
