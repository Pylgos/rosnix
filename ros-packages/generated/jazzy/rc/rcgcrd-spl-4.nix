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
  version = "4.0.1-1";
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
        rev = "1a4163d230639126421ebff6381f7887eba98caa";
        hash = "sha256-du68Eq0gNlBSz8RHUaKfCmnCe4dMuBRNBVY/Xr+/+cU=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Return Data V4 ROS msg";
  };
})
