{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosapi,
  rosbridge-library,
  rosbridge-server,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_suite";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosbridge_suite";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosapi rosbridge-library rosbridge-server ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbridge_suite" = substituteSource {
        src = fetchgit {
          name = "rosbridge_suite-source";
          url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
          rev = "2ffc2f639485bc8bc45d3d262b1330507faf2df5";
          hash = "sha256-bXWK/Y2PN+OB52A6bgOiWh6mKi+JtNpCG9rLNYzGYg8=";
        };
      };
    });
  };
  meta = {
    description = "Rosbridge provides a JSON API to ROS functionality for non-ROS programs. There are a variety of front ends that interface with rosbridge, including a WebSocket server for web browsers to interact with. Rosbridge_suite is a meta-package containing rosbridge, various front end packages for rosbridge like a WebSocket package, and helper packages.";
  };
})
