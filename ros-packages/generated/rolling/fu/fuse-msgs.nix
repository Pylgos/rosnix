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
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_msgs" = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "4e0cd67752ea36f7ad8c36ff5af5fe714ad1b4a2";
        hash = "sha256-0jQYZYxDUR6mtMCJI8g5PlSJ0ENrMsQq9KEUS+89u9U=";
      };
    };
  });
  meta = {
    description = "The fuse_msgs package contains messages capable of holding serialized fuse objects.";
  };
})
