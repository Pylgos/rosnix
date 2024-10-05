{
  ament-cmake,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-dispenser-msgs,
  rmf-fleet-msgs,
  rmf-ingestor-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_robot_sim_common" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "11fbc3b5f59f867be3c8a00b4e354fa600198ea0";
        hash = "sha256-w0qFx4C5VaFH20/vYzf/UCmQRb9mrIetgO+qmcmffcw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "rmf_robot_sim_common";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_common";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Common utility functions for Gazebo-classic and Gazebo RMF plugins";
  };
})
