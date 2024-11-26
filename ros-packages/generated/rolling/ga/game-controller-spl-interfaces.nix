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
  pname = "game_controller_spl_interfaces";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."game_controller_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl_interfaces" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "e312374eff005baa120a64812879b7bd36a8f0e0";
        hash = "sha256-uB8HT6Qzj0QLcmO0XYv5Lw6PpjmowbR2sz0FywtT/6U=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
})
