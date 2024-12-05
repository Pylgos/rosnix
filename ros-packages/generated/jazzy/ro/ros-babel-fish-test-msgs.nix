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
  version = "0.10.3-1";
  src = finalAttrs.passthru.sources."ros_babel_fish_test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish_test_msgs" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_test_msgs-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "71ad760e4906f67fe35339fee2f213f0ab030a12";
        hash = "sha256-1j4Iw8LGkpgtfJAMbfivHbSHMv4tKvgmUkiemA3Znuc=";
      };
    };
  });
  meta = {
    description = "Test messages for the ros_babel_fish project tests.";
  };
})
