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
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."leo_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-plugin-vendor gz-sim-vendor ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "529abe22f7e45f49b1340683f1892b7c77c2ff90";
        hash = "sha256-zNM4mjrSqMgKQjUxcQOrl2FnexmvX9e4aggFHBzi3w4=";
      };
    };
  });
  meta = {
    description = "Plugins for Leo Rover Gazebo simulation in ROS 2";
  };
})
