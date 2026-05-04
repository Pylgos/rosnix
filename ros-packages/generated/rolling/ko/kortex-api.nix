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
  pname = "kortex_api";
  version = "0.2.5-2";
  src = finalAttrs.passthru.sources."kortex_api";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_api" = substituteSource {
      src = fetchgit {
        name = "kortex_api-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "e508ddeb34d0ae9e8e79c0adb7c47765ee407edd";
        hash = "sha256-7seoKmAFiRAdGVm95S/ekQerIn04z9iyudAK/lX9Kew=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${sources."kortex_api/linux_x86-64_x86_gcc"}";
        }
      ];
    };
    "kortex_api/linux_x86-64_x86_gcc" = substituteSource {
      src = fetchzip {
        name = "linux_x86-64_x86_gcc-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
    };
  });
  meta = {
    description = "KINOVA KORTEX™ API";
  };
})
