{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
  turtlebot4-node,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_base" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_base-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "9b13f938a554b9202c8e5392ed00678cf1ac4aa4";
        hash = "sha256-mJ3ZwgqXeuHEmY96OFBDVphAKpuYKXdy4HQrdf7YNYA=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_base";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot4_base";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs turtlebot4-msgs turtlebot4-node ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgpiod-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Base Node";
  };
})
