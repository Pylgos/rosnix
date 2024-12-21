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
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."tf2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "5c1c937c3fc2db723a0a94271220f2859dc7c1be";
        hash = "sha256-TFAj8OxDTO0nzAZHYAgn4Khsgu/5zm2FmJunFsFnIQs=";
      };
    };
  });
  meta = {
    description = "tf2_msgs";
  };
})
