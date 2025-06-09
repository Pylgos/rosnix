{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  realsense2-description,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_description";
  version = "1.0.8-1";
  src = finalAttrs.passthru.sources."ffw_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ realsense2-description urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ realsense2-description urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_description" = substituteSource {
      src = fetchgit {
        name = "ffw_description-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "2eb909e36e9730c94ab7c21a6eaee0f287b5a295";
        hash = "sha256-fTubtyz3BstCry9i8k/MZnqewcm7/kquHVE/3NP4eG0=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
