{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  ros-gz-interfaces,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_gz_toolbox" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_toolbox-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "e0981ccd502ceb8982347b9912b90c8fcce47d16";
        hash = "sha256-3OsOIy2pTEOlqlVW4tEYwBPR2ZVG71NAHsRirj7yDwg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_gz_toolbox";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_gz_toolbox";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-action rcutils ros-gz-interfaces sensor-msgs std-msgs turtlebot4-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Gazebo Toolbox";
  };
})
