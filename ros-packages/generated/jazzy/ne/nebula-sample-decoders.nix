{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  nebula-sample-common,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_sample_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_sample_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-decoders nebula-sample-common ];
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-decoders nebula-sample-common ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_sample_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_sample_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "bc31143f4701b34aa5578e2903ed37fe106cda55";
        hash = "sha256-liVrHEGNDgyxlfLDtXE5qewnOIDk3AiZBJ4mg1TyKS4=";
      };
    };
  });
  meta = {
    description = "Nebula Sample Decoders Library";
  };
})
