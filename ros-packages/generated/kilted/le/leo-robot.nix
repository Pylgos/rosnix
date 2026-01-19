{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-filters,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  passthru.sources = mkSourceSet (sources: {
    "leo_robot" = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "4e9cf35c45342598012657d32b5adc17335660c4";
        hash = "sha256-syP9ZZ82+t7llxG5ZG/bKR3GdDLD2pGff1QMipWw17s=";
      };
    };
  });
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
