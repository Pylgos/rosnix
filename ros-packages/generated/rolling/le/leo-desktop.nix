{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-viz,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_desktop";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."leo_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ leo leo-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-viz ];
  passthru.sources = mkSourceSet (sources: {
    "leo_desktop" = substituteSource {
      src = fetchgit {
        name = "leo_desktop-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "66b0c66db9bc1aabf02c8cb22c96a19008a0e114";
        hash = "sha256-6KTjQDWAPViQZPNJ0TvIOpgM0ZK6q5bDKX6joQDuOnw=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for operating Leo Rover from ROS desktop\n  ";
  };
})
