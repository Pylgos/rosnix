{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_msgs";
  version = "1.2.6-1";
  src = finalAttrs.passthru.sources."fuse_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ament-cmake-ros geometry-msgs gtest-vendor rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ ament-cmake-ros geometry-msgs gtest-vendor rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_msgs" = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "4248635e867dbb02484dc6d374576a1c1e9a3a9e";
        hash = "sha256-0cTqjjAHRIZ3gK9HvVciK//gtB2oMbdiz+M1coSLOnY=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_msgs package contains messages capable of holding serialized fuse objects.\n  ";
  };
})
