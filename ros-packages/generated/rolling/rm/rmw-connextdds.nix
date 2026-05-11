{
  ament-cmake,
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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-connextdds-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "5842d4ff74b22f72049b1b92ccbd994623219195";
        hash = "sha256-n+qgqSpuBXYuxCsW3WTmbkGI5fvkKWOF6+0fz2wuSSs=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
