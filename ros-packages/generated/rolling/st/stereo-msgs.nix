{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "stereo_msgs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."stereo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "stereo_msgs" = substituteSource {
        src = fetchgit {
          name = "stereo_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "9d0639978fbc81beaf4233020e0220a0d594a81c";
          hash = "sha256-AN3DO6Bwguk+y07ZXglPOn7+zkWoNYXr771yParWYWU=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
})
