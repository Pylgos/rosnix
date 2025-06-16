{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "small_gicp_vendor";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."small_gicp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  passthru.sources = mkSourceSet (sources: {
    "small_gicp_vendor" = substituteSource {
      src = fetchgit {
        name = "small_gicp_vendor-source";
        url = "https://github.com/ros2-gbp/multisensor_calibration-release.git";
        rev = "a0027651cc21f6f10625bde37938ad4e4d3de57b";
        hash = "sha256-TeNONnJtxiTaTWQ27DlkwgdB5S0Knh3HB0C3bQmLyoc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL \${GITREPO}";
          to = "VCS_TYPE path VCS_URL ${sources."small_gicp_vendor/small_gicp"}";
        }
      ];
    };
    "small_gicp_vendor/small_gicp" = substituteSource {
      src = fetchgit {
        name = "small_gicp-source";
        url = "https://github.com/koide3/small_gicp.git";
        rev = "1d8cce8add74d28f16a9efab677dbe93490b28e4";
        hash = "sha256-Gzp/iwnfuFq+wBVF5cMR8vUwy0DaxYNcH5oqJHv+biY=";
      };
    };
  });
  meta = {
    description = "Vendor package for small_gicp. This is just a wrapper to provide ExternalProject build";
  };
})
