{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raph,
  raph-bringup,
  raph-fw,
  raph-oak,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_robot";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."raph_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ raph raph-bringup raph-fw raph-oak ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raph raph-bringup raph-fw raph-oak ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_robot" = substituteSource {
      src = fetchgit {
        name = "raph_robot-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "99e32019de6d479d0851162cd1842de37a8693a7";
        hash = "sha256-8eIam+QQdpHnFh//mI3pvw2kxa7B/SPaK8UN8vaAiZA=";
      };
    };
  });
  meta = {
    description = "Packages for Raph Rover running on the robot.";
  };
})
