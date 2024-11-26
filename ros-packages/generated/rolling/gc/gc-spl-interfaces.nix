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
  pname = "gc_spl_interfaces";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."gc_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gc_spl_interfaces" = substituteSource {
        src = fetchgit {
          name = "gc_spl_interfaces-source";
          url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
          rev = "40ceafe3b472fb84d11e1e50ab4458723e2638bf";
          hash = "sha256-zib/AEpu2CDmpEXFyiedKxZD52Ub6+OPzPJpw/a2jqE=";
        };
      };
    });
  };
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
})
