{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_test_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rosbridge_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_test_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_test_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "5af4fb6da0a4d3ce5e64fb02c63fd885aeb7263b";
        hash = "sha256-/hVNSW8BSy1Y1jsdQMJT83vOoLMOprsBIkdTlu988KU=";
      };
    };
  });
  meta = {
    description = "\n    Message and service definitions used in internal tests for rosbridge packages.\n  ";
  };
})
