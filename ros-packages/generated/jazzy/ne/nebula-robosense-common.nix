{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_robosense_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_robosense_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common ];
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_robosense_common" = substituteSource {
      src = fetchgit {
        name = "nebula_robosense_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "94efded90c9ad57536e2f3866ba7eaf6a38ac8d1";
        hash = "sha256-xlf00mlyvbftEEHorRsQR7pJ13jOrcIUhdZkIfy8LMg=";
      };
    };
  });
  meta = {
    description = "Nebula Common Robosense Libraries and headers";
  };
})
