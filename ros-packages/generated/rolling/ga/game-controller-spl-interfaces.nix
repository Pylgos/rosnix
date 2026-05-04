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
  version = "5.0.0-3";
  src = finalAttrs.passthru.sources."game_controller_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl_interfaces" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "024870370ad363943ac1094c389519c3e9d2be06";
        hash = "sha256-jkhFuN0rY1PlTTsQEnhQqcTb3M+1LYFQF28JUZlaKJE=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
})
