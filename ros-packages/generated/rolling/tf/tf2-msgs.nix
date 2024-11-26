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
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_msgs" = substituteSource {
        src = fetchgit {
          name = "tf2_msgs-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "28a99c1a15eb2f5b36a561c0ada7b678c8f7a8c5";
          hash = "sha256-5OzvZWpLft/0qtEUmePu34gs8s2LtvFQ/zplq0/RJ2s=";
        };
      };
    });
  };
  meta = {
    description = "tf2_msgs";
  };
})
