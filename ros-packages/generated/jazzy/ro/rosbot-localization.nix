{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  robot-localization,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_localization";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_localization";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch launch-ros robot-localization ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch launch-ros robot-localization ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_localization" = substituteSource {
      src = fetchgit {
        name = "rosbot_localization-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "13a3322bf33b798239ae7e8e5311485d5abceec0";
        hash = "sha256-3ZCuwZGNouh3rLfMIVxXdyEbNl6bEDrZU011rGP1xfE=";
      };
    };
  });
  meta = {
    description = "The rosbot_localization package";
  };
})
