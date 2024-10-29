{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "control_toolbox" = substituteSource {
      src = fetchgit {
        name = "control_toolbox-source";
        url = "https://github.com/ros2-gbp/control_toolbox-release.git";
        rev = "ce34b783ff26c38e7683317304e8163590b86dc9";
        hash = "sha256-sKnxESPu6Ydu0gnQlf4qeC4c0JZ8LPLDEHByYu+WTYY=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "control_toolbox";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."control_toolbox";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
  };
})
