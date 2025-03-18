{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-connextdds-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_connextdds";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "ab1f98d7aa5400b8b8b44cda70102f9dd5b0bff2";
        hash = "sha256-Al0dNG9uL6Tl+0U50C+sevLIsO42DgALgQjazaFLSwc=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
