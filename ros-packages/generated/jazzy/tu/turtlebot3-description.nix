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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "efe4f895bae2b3be2cbe39ecb34a635da2988cd8";
        hash = "sha256-C115ugxtuHHlf4ku6W/YGdVm9Lc8ZAixU+aQJfUHO8M=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the TurtleBot3 for simulation and visualization\n  ";
  };
})
