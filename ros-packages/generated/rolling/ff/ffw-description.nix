{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_description";
  version = "1.1.14-2";
  src = finalAttrs.passthru.sources."ffw_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_description" = substituteSource {
      src = fetchgit {
        name = "ffw_description-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "8e479e1fae9ae9d588efdea2b9f823a34ea87e3d";
        hash = "sha256-2GYSi2jaIR5m+MI8dejXjLU942Nj2yIvEOzIpksMMZU=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
