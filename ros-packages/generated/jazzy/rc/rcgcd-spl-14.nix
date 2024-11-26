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
  pname = "rcgcd_spl_14";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."rcgcd_spl_14";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcgcd_spl_14" = substituteSource {
        src = fetchgit {
          name = "rcgcd_spl_14-source";
          url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
          rev = "0d610deaef87d5251720143fcf6e39e29043c610";
          hash = "sha256-naRnWiBaNmsQqaucIPL28thbmjie8mBvwk3zLJibvQA=";
        };
      };
    });
  };
  meta = {
    description = "RoboCup SPL GameController Data V14 ROS msg";
  };
})
