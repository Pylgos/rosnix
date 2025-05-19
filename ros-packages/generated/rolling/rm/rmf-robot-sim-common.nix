{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_common";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_common";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_common" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "0b995ed747de14f844679cd73fae9a2950f4ef3a";
        hash = "sha256-1EIbqzBGpQEqnzz6ENI0aK6RUnXZH2GdLw6Dts9YyF0=";
      };
    };
  });
  meta = {
    description = "\n    Common utility functions for Gazebo-classic and Gazebo RMF plugins\n  ";
  };
})
