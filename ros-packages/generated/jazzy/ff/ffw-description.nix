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
  version = "1.0.5-1";
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
        rev = "1c158391219ea069cfd796b94ede87e6dc0841e4";
        hash = "sha256-9YqVL8F17ejCNAuQzNchz9lIt4YneD0AJ2csgiXdaPw=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
