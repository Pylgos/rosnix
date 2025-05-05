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
  version = "0.13.0-1";
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
        rev = "b2c0e98f3840c0b65c7244b9ddeb8e85c10a3000";
        hash = "sha256-I2hzeif8ase9eGdqnYXBAZsOBbq2ByzJqmdOW83Ht4U=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
})
