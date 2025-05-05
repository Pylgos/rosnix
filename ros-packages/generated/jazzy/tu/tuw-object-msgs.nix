{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  tuw-geo-msgs,
  tuw-geometry-msgs,
  tuw-std-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_object_msgs";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_object_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime tuw-geo-msgs tuw-geometry-msgs tuw-std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime tuw-geo-msgs tuw-geometry-msgs tuw-std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "61b6a811bb1d18f1bf683f929ee639e45c3e1771";
        hash = "sha256-eAeNTveVsQvwH59kAGSGu2jXQk/LTD0343hxI0KAJbY=";
      };
    };
  });
  meta = {
    description = "The tuw_object_msgs package. This pkg provides a set of messages used to detect, map and track objects of different types.\n  ";
  };
})
