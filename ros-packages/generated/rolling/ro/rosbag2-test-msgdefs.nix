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
  version = "0.33.1-1";
  src = finalAttrs.passthru.sources."rosbag2_test_msgdefs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_msgdefs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "57e8c429c19080c12c967f4b85d0684c68ee3bd7";
        hash = "sha256-04kuOY0LT84niphT34FkqIGluVwzEmqFnIofcvUV9lQ=";
      };
    };
  });
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
})
