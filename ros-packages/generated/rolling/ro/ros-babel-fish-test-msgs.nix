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
  version = "4.26.43-1";
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
        rev = "230d5de1cb7a788e26a24d5e8c9d422b3f1eb87e";
        hash = "sha256-ljXGe9MSyM9sAUuZtvyTFEsK7plnBxfzaQvFrsiu6b4=";
      };
    };
  });
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
})
