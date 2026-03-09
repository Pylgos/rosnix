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
  version = "0.18.6-1";
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
        rev = "15800ecf100d66c69fa16acf15f6004f6ba9b3ae";
        hash = "sha256-F3VmLGXgFkIr32k0mTxHjZj4X1FzrlAC6zqVT8DV/hQ=";
      };
    };
  });
  meta = {
    description = "The rosbot_localization package";
  };
})
