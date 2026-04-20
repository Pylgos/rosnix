{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_sample_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_sample_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-decoders ];
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-decoders ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_sample_common" = substituteSource {
      src = fetchgit {
        name = "nebula_sample_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "4ba29a326a90a5f94da186597bb5d0f2a8ce58aa";
        hash = "sha256-Ys+uWFe5OGargPbK+kpjmQkcbjqfsjHvKaNAOGmoiFY=";
      };
    };
  });
  meta = {
    description = "Nebula Sample Common Libraries and Headers";
  };
})
