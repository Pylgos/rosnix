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
  version = "1.0.2-1";
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
        rev = "8240508a1c9b569336a83163dd5d06c04eed77b5";
        hash = "sha256-Vqb9qNfKCoxo2yw6NMdjjzHlKj0Mb3Yclmzd9atz7m0=";
      };
    };
  });
  meta = {
    description = "URDF description of the FLIR PTUs.";
  };
})
