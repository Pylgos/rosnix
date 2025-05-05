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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosbridge_suite";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosapi rosbridge-library rosbridge-server ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosapi rosbridge-library rosbridge-server ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_suite" = substituteSource {
      src = fetchgit {
        name = "rosbridge_suite-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "ed1c5604fbe5317815daa2782069ffb0bc3a5dc6";
        hash = "sha256-IQuYvDYgncXQCjxBKUGj8MEKQQoZrS7q6l1OwJGQ0Eo=";
      };
    };
  });
  meta = {
    description = "\n    Rosbridge provides a JSON API to ROS functionality for non-ROS programs.\n    There are a variety of front ends that interface with rosbridge, including\n    a WebSocket server for web browsers to interact with.\n\n    Rosbridge_suite is a meta-package containing rosbridge, various front end\n    packages for rosbridge like a WebSocket package, and helper packages.\n  ";
  };
})
