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
  version = "2.26.40-1";
  src = finalAttrs.passthru.sources."ros_babel_fish_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish_test_msgs" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_test_msgs-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "5998ba2beca2660fccf8b08435f3b57615ec4bd8";
        hash = "sha256-Ja+NUdivmkpMSI033qLYEYZDLJ+5/DHxMVD5VOwO/+g=";
      };
    };
  });
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
})
