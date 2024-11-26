{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fmilibrary_vendor";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."fmilibrary_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fmilibrary_vendor" = substituteSource {
      src = fetchgit {
        name = "fmilibrary_vendor-source";
        url = "https://github.com/ros2-gbp/fmilibrary_vendor-release.git";
        rev = "a2c5aea2e1092520a763dfba27fd2621d761a9ab";
        hash = "sha256-RwFS1j6Bue1ac96cXWL4i1A+KcMFWctqGRc0ZGeTR70=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/modelon-community/fmi-library.git";
          to = "URL ${sources."fmilibrary_vendor/fmi-library"}";
        }
      ];
    };
    "fmilibrary_vendor/fmi-library" = substituteSource {
      src = fetchgit {
        name = "fmi-library-source";
        url = "https://github.com/modelon-community/fmi-library.git";
        rev = "998768cddacce99727d633d045fa6d25314e1d9a";
        hash = "sha256-i8EtjPMg39S/3RyoUaXm5A8Nu/NbgAwjxRCdyh2elyU=";
      };
    };
  });
  meta = {
    description = "Wrapper (aka vendor package) around the FMILibrary by Modelon AB (JModelica.org)";
  };
})
