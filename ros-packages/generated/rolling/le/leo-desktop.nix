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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_desktop";
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."leo_desktop";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-viz ];
  passthru.sources = mkSourceSet (sources: {
    "leo_desktop" = substituteSource {
      src = fetchgit {
        name = "leo_desktop-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "3efc96272bae874f1065acf41afedd501af6bade";
        hash = "sha256-6KTjQDWAPViQZPNJ0TvIOpgM0ZK6q5bDKX6joQDuOnw=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for operating Leo Rover from ROS desktop\n  ";
  };
})
