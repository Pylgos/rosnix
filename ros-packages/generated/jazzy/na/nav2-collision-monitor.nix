{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_collision_monitor" = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4278e1c732080122ca1a2eaca5ea5bdf2db88bc7";
        hash = "sha256-2iBBTkfdK33yLZIbKcGCq5VrLUUsIdRoyTcoOVLYXfw=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_collision_monitor";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_collision_monitor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-msgs nav2-util rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Collision Monitor";
  };
})
