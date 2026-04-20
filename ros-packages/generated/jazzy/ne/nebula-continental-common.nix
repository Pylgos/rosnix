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
  pname = "nebula_continental_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_continental_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_continental_common" = substituteSource {
      src = fetchgit {
        name = "nebula_continental_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "3818273d2248d25dc6a64d940fca63fcbfe508f1";
        hash = "sha256-UJ1WtlBfR6swTWA/lvPnE57vXAL9B6q1r5/dsIqpV1E=";
      };
    };
  });
  meta = {
    description = "Nebula Common Continental Libraries and headers";
  };
})
