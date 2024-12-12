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
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."tuw_object_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_map_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_map_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "b802df39242088ac3841f2fcb0f38f3e277872e1";
        hash = "sha256-MF7RvNYyZT0qVShu1XTgGEt7HEoSMwfJ4yXjwWDxFeA=";
      };
    };
  });
  meta = {
    description = "The tuw_object_map_msgs package";
  };
})
