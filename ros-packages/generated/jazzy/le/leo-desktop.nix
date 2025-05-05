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
  version = "3.0.0-3";
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
        rev = "c1a54f9b40ddbf3bc97fee01d5c59273e6dde297";
        hash = "sha256-6KTjQDWAPViQZPNJ0TvIOpgM0ZK6q5bDKX6joQDuOnw=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for operating Leo Rover from ROS desktop\n  ";
  };
})
