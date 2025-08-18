{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_msgdefs";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_test_msgdefs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_msgdefs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ae6e8c433951e7d5624daf77ae33b4d2c6c9d505";
        hash = "sha256-g6D0N7F69ABVIeN+XUtnNRN9Jrqk/d++ET04hb9np7Y=";
      };
    };
  });
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
})
