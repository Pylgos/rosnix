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
  version = "0.13.0-2";
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
        rev = "4b6ffb83dd4a931a9fc46eb2d112ae9c91a38d0a";
        hash = "sha256-I2hzeif8ase9eGdqnYXBAZsOBbq2ByzJqmdOW83Ht4U=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
})
