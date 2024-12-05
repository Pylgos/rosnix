{
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
  pname = "ros_babel_fish_test_msgs";
  version = "0.10.2-1";
  src = finalAttrs.passthru.sources."ros_babel_fish_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish_test_msgs" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_test_msgs-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "331ff73d3ccab4145420240392537e053a57dc33";
        hash = "sha256-1QP2oyTztyPcEmYHnc19dqdskemTM4BZoXZBmUH2A50=";
      };
    };
  });
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
})
