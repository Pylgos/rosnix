{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "rcgcrd_spl_4";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."rcgcrd_spl_4";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcgcrd_spl_4" = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "f9bb88bf6d6540f6921455c5ffb09f1e725cafd8";
        hash = "sha256-oV5yoiAVndHTMpv1srPXeRMDmakiAJnkd0PKxb3WzEQ=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Return Data V4 ROS msg";
  };
})
