{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_object_map_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_object_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_map_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_map_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "39f1e4b111f1405af95f007327e4db46cef9f241";
        hash = "sha256-5S/NucWiROAQNGbjYyrnER1YyQ5yK4cbk9qX+hyjdkg=";
      };
    };
  });
  meta = {
    description = "The tuw_object_map_msgs package";
  };
})
