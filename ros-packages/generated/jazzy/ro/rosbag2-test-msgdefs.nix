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
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_test_msgdefs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_test_msgdefs" = substituteSource {
        src = fetchgit {
          name = "rosbag2_test_msgdefs-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "bef282383314aa625d7bddd297c60ec3b32b26dd";
          hash = "sha256-PareRl1TJAfHsDncY42oznfFxSGe+dqtPVfeK8p/Svg=";
        };
      };
    });
  };
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
})
