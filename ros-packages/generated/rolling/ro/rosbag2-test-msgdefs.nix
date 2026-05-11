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
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_test_msgdefs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_msgdefs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "fd93e547863cbf657c2de3178a3b7e21ac8e849b";
        hash = "sha256-kJb6LfQ7ogYvXAoDibP2LQHFT4TrSuddi3g0kMDb85M=";
      };
    };
  });
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
})
