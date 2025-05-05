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
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_test_msgdefs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_msgdefs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "cbd2bab8f65fbf6d7c4f685a83ff355878ec67f9";
        hash = "sha256-sTDHbtWARJbHRhjadSh0DFXPaR7lHRsolpK6GlAAG/o=";
      };
    };
  });
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
})
