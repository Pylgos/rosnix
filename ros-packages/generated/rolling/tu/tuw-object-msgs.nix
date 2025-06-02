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
  version = "0.2.6-1";
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
        rev = "9c872571115f6f76375c182e63da94449e164fb0";
        hash = "sha256-veTlZzO8asBKjNy0+SgbYefkEZJnZ8hpP0jZYhn/ylw=";
      };
    };
  });
  meta = {
    description = "The tuw_object_msgs package. This pkg provides a set of messages used to detect, map and track objects of different types.\n  ";
  };
})
