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
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_description";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."turtlebot3_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "fe2c6a08094a2444bff993bd0f671200cd5c1c03";
        hash = "sha256-52nYdCkNr8ZIf5cUNxZ/owSr9irMDMasE7LnwL/HJG4=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the TurtleBot3 for simulation and visualization\n  ";
  };
})
