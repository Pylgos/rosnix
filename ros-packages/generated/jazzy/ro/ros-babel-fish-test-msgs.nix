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
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."ros_babel_fish_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_babel_fish_test_msgs" = substituteSource {
        src = fetchgit {
          name = "ros_babel_fish_test_msgs-source";
          url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
          rev = "335e432fdb54d1005fb750a946c219d0b3dee015";
          hash = "sha256-RCfjr+klt765VLYJgtQRAbI/+cTkJBuINSJXFgk/E08=";
        };
      };
    });
  };
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
})
