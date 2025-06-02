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
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_object_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_map_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_map_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "23bd6146d9342a577aea8bb09942e6aa1df114a7";
        hash = "sha256-PcR3OKQhJEMbhq/vd5b1hiY8s8SyBnpAWzjt47cmGbw=";
      };
    };
  });
  meta = {
    description = "The tuw_object_map_msgs package";
  };
})
