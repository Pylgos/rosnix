{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "fuse_msgs";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_msgs" = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "b7d72c140064c81e4cc97d21d8428ad7bbad91d4";
        hash = "sha256-xHlsFbvzKv3XfETftnAM2fq+08F6DsHY3eKxcDyT4bQ=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_msgs package contains messages capable of holding serialized fuse objects.\n  ";
  };
})
