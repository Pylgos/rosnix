{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  launch-yaml,
  mkSourceSet,
  ros2action,
  ros2cli,
  ros2component,
  ros2doctor,
  ros2interface,
  ros2launch,
  ros2lifecycle,
  ros2multicast,
  ros2node,
  ros2param,
  ros2pkg,
  ros2run,
  ros2service,
  ros2topic,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2cli_common_extensions";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2cli_common_extensions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml launch-yaml ros2action ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2topic sros2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2cli_common_extensions" = substituteSource {
      src = fetchgit {
        name = "ros2cli_common_extensions-source";
        url = "https://github.com/ros2-gbp/ros2cli_common_extensions-release.git";
        rev = "21502210766d834d779da1b5d11e361d3262a735";
        hash = "sha256-JJqh2FemdwUAY4ztCaMD2FtYyJwGX84hvXiboLpZ00Q=";
      };
    };
  });
  meta = {
    description = "Meta package for ros2cli common extensions";
  };
})
