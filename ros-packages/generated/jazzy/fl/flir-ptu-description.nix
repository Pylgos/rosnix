{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "flir_ptu_description";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."flir_ptu_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_ptu_description" = substituteSource {
      src = fetchgit {
        name = "flir_ptu_description-source";
        url = "https://github.com/ros-drivers-gbp/flir_ptu-release.git";
        rev = "188355f5e0706a0f8f4fde1f3c9a0fdd45cbe877";
        hash = "sha256-a/jgQ3WF6Rmo6g6n9QcW/T+Avk7n8CQvR/ud+KK2Twk=";
      };
    };
  });
  meta = {
    description = "URDF description of the FLIR PTUs.";
  };
})
