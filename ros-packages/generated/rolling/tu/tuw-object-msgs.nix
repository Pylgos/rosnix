{
  ament-cmake,
  ament-cmake-cppcheck,
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
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."tuw_object_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime tuw-geo-msgs tuw-geometry-msgs tuw-std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "9e1eb99d740287b2dfd869cd93eab9ff6916e9c5";
        hash = "sha256-rSfMdPB9j519SFaYoaMUb0xW1gSBXfGwAinf6PksmIA=";
      };
    };
  });
  meta = {
    description = "The tuw_object_msgs package. This pkg provides a set of messages used to detect, map and track objects of different types.";
  };
})
