{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_control_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_control_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "autoware_control_msgs" = substituteSource {
        src = fetchgit {
          name = "autoware_control_msgs-source";
          url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
          rev = "a38679c1ee77e2513dd12907c2804efd2c3efeff";
          hash = "sha256-kScZfYLVFZc9TKmSnUM0P6tw7Nw35eNoAbnS7r1oVWI=";
        };
      };
    });
  };
  meta = {
    description = "Autoware control messages package.";
  };
})
