{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot" = substituteSource {
      src = fetchgit {
        name = "rosbot-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "939bdfbb1e794be354442bd8ae90ff401018d723";
        hash = "sha256-4eAmp7oOFeVCyxcoiIPjufa74krpPsAN5ZuwAANefyU=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all packages of ROSbot Series";
  };
})
