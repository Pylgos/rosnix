{
  ament-cmake,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_bot";
  version = "2.0.0-2";
  src = finalAttrs.passthru.sources."bcr_bot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_bot" = substituteSource {
      src = fetchgit {
        name = "bcr_bot-source";
        url = "https://github.com/blackcoffeerobotics/bcr_bot_ros2-release.git";
        rev = "19b7f1354b9c22a210449012da31d18eea4204ab";
        hash = "sha256-L1gjsMmGnJQcyff6kWLnJcnLcCVz18eerp84if02C7g=";
      };
    };
  });
  meta = {
    description = "bcr_bot";
  };
})
