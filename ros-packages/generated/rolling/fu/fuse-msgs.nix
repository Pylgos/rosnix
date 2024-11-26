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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "fuse_msgs" = substituteSource {
        src = fetchgit {
          name = "fuse_msgs-source";
          url = "https://github.com/ros2-gbp/fuse-release.git";
          rev = "dfb1a85e9e5edf52c099aed99eef080dbb5d25d7";
          hash = "sha256-1MCYwjqTXGSqeLZnuIgbYUWZSiIHDpzEniamI5tCiYA=";
        };
      };
    });
  };
  meta = {
    description = "The fuse_msgs package contains messages capable of holding serialized fuse objects.";
  };
})
