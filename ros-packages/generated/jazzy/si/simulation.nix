{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-base,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simulation";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-base ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-base ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim ];
  passthru.sources = mkSourceSet (sources: {
    "simulation" = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "a3513af0b98ac4456aeeb919c038ab17b02c3fbb";
        hash = "sha256-F5Xdwf30yp+svq3b6jwcfeMbm+oLQKi9hw3ZkozBy68=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
})
