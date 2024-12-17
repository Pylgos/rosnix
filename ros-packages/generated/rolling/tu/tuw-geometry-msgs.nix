{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
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
  pname = "tuw_geometry_msgs";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."tuw_geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "6fe35deab750503373ff1e972e324cbcda20371e";
        hash = "sha256-CgRts2V4dHjlzuU4GN8ZlB8SZXLVKnL0/cUAAlSoPfk=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry_msgs package";
  };
})
