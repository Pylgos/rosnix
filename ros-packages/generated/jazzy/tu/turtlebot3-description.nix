{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_description";
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "d599059aeff7fea19e9b625ed7da94565c50cfa6";
        hash = "sha256-PpDv1WFUQ1o5d4fP9AH2jJWYeEv7lGIkCvT9Tz2i4X0=";
      };
    };
  });
  meta = {
    description = "3D models of the TurtleBot3 for simulation and visualization";
  };
})
