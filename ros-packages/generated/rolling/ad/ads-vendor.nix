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
  pname = "ads_vendor";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."ads_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ads_vendor" = substituteSource {
      src = fetchgit {
        name = "ads_vendor-source";
        url = "https://github.com/b-robotized/ads_vendor-release.git";
        rev = "b041bdc7261cbf3065a79769c6782999cc47b452";
        hash = "sha256-Tuj/wG82Gr8+AZET4UEevMtmVe0UDOLyuLr2anUxWew=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY    \${ADS_GIT_REPOSITORY}";
          to = "URL ${sources."ads_vendor/ADS"}";
        }
      ];
    };
    "ads_vendor/ADS" = substituteSource {
      src = fetchgit {
        name = "ADS-source";
        url = "https://github.com/Beckhoff/ADS.git";
        rev = "e85ef696447a77039a4c3710d7573c8df32c0d58";
        hash = "sha256-9cZCkKP72luHuEwbu/6ZoVqgo60911WVZmNK4p8RbXU=";
      };
    };
  });
  meta = {
    description = "Package vendoring Beckhoff/ADS library";
  };
})
