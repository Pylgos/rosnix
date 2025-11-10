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
  version = "2.4.0-1";
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
        rev = "7962451efa8fbf1716c5cdfc96e2e9b1c4c4328a";
        hash = "sha256-Krs0Jab5oo7NLpZmgNP7zpaJy0PbPxt2D5mobXlmfPY=";
      };
    };
  });
  meta = {
    description = "\nRosbridge provides a JSON API to ROS functionality for non-ROS programs.\nThere are a variety of front ends that interface with rosbridge, including\na WebSocket server for web browsers to interact with.\n\nRosbridge_suite is a meta-package containing rosbridge, various front end\npackages for rosbridge like a WebSocket package, and helper packages.\n  ";
  };
})
