{
  action-msgs,
  ament-cmake,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_msgs";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "flexbe_msgs" = substituteSource {
        src = fetchgit {
          name = "flexbe_msgs-source";
          url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
          rev = "9876f77f96950bbdcfd268cd6d421faa12a43fbe";
          hash = "sha256-uBMqKj7xP+bWHd1rLyL8C2Tx+/vWfPi7wrtzjqmywGM=";
        };
      };
    });
  };
  meta = {
    description = "flexbe_msgs provides the messages used by FlexBE.";
  };
})
