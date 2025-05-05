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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."ros2cli_common_extensions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-xml launch-yaml ros2action ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2topic sros2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml launch-yaml ros2action ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2topic sros2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2cli_common_extensions" = substituteSource {
      src = fetchgit {
        name = "ros2cli_common_extensions-source";
        url = "https://github.com/ros2-gbp/ros2cli_common_extensions-release.git";
        rev = "43d2e47dbd25d5396b23539c32f81a08f1762ed2";
        hash = "sha256-aUcdjtiOR5JZHCrRxi0s4OD4A9AMZp5E0qs5OLkxwBI=";
      };
    };
  });
  meta = {
    description = "Meta package for ros2cli common extensions";
  };
})
