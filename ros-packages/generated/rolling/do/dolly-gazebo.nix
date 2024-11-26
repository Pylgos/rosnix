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
  pname = "dolly_gazebo";
  version = "0.4.0-5";
  src = finalAttrs.passthru.sources."dolly_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ dolly-follow ros2launch rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dolly_gazebo" = substituteSource {
        src = fetchgit {
          name = "dolly_gazebo-source";
          url = "https://github.com/ros2-gbp/dolly-release.git";
          rev = "30060ffd0d83f819734f575a8fb4939eeb2b2087";
          hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
        };
      };
    });
  };
  meta = {
    description = "Launch Gazebo simulation with Dolly robot.";
  };
})
