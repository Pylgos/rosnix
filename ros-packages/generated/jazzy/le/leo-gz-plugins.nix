{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-plugin-vendor,
  gz-sim-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."leo_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-plugin-vendor gz-sim-vendor ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "f437ec35b853fa859f6e0fd42d866d4edaacbfd3";
        hash = "sha256-NdQniqhl+BYRqgzeh3wC5kTFGrOyWUZl6qDY/07QrNs=";
      };
    };
  });
  meta = {
    description = "Plugins for Leo Rover Gazebo simulation in ROS 2";
  };
})
