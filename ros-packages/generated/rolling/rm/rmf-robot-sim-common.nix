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
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_common";
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_common";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-fleet-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_common" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "d40c8f3e36fbaa91023fd69f3dc5bf64352e23fc";
        hash = "sha256-12SUBz7nbx7Ncfqu2zcGyZUspgBWQ6zZ4I7gwjW363A=";
      };
    };
  });
  meta = {
    description = "\n    Common utility functions for Gazebo-classic and Gazebo RMF plugins\n  ";
  };
})
