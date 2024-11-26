{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dolly-follow,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dolly_ignition";
  version = "0.4.0-5";
  src = finalAttrs.passthru.sources."dolly_ignition";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ dolly-follow ros2launch rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ros_ign_bridge" "ros_ign_gazebo" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dolly_ignition" = substituteSource {
        src = fetchgit {
          name = "dolly_ignition-source";
          url = "https://github.com/ros2-gbp/dolly-release.git";
          rev = "36b5774da731136a6fc4bf5dc57c9f29a437a371";
          hash = "sha256-BGdsjbemIWS94BjSHjDClK1ui6sM17J0lJlrhfhj/Vg=";
        };
      };
    });
  };
  meta = {
    description = "Launch Ignition simulation with Dolly robot.";
  };
})
