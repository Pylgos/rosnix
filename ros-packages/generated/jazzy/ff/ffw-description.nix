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
  version = "1.0.9-1";
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
        rev = "8921220b8b06002f0ced56165d3a1b3555168428";
        hash = "sha256-Ki8WSrp8HWH2EL1+WMiD6rB/r8+BHoO/rN9JAJEGzCQ=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
