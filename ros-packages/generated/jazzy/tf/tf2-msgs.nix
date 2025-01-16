{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_msgs";
  version = "0.36.8-1";
  src = finalAttrs.passthru.sources."tf2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "ab0e03e853c22201c9c9905986df77b774d73e38";
        hash = "sha256-q0l5DlVf1SSxHLU9lGxdBOVLjhH0KvfQCixcqJs9P7o=";
      };
    };
  });
  meta = {
    description = "tf2_msgs";
  };
})
