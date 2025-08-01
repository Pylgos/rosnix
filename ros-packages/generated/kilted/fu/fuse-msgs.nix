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
  version = "1.2.2-1";
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
        rev = "6ceaa8742286eb6cffa8aca8e131e4ec1c521005";
        hash = "sha256-0jQYZYxDUR6mtMCJI8g5PlSJ0ENrMsQq9KEUS+89u9U=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_msgs package contains messages capable of holding serialized fuse objects.\n  ";
  };
})
