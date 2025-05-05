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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."simple_grasping";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ geometry-msgs grasping-msgs moveit-msgs pcl-conversions pcl-ros rclcpp-action rclcpp-components sensor-msgs shape-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "simple_grasping" = substituteSource {
      src = fetchgit {
        name = "simple_grasping-source";
        url = "https://github.com/ros2-gbp/simple_grasping-release.git";
        rev = "188727f1f711a1349666ee9d394844789d2339c9";
        hash = "sha256-9mz6liueWT2sBhaNwYvXNwJpFf8NTEzTam3jr+13GHU=";
      };
    };
  });
  meta = {
    description = "Basic grasping applications and demos.";
  };
})
