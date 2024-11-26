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
  pname = "libcurl_vendor";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."libcurl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "file" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "libcurl_vendor" = substituteSource {
        src = fetchgit {
          name = "libcurl_vendor-source";
          url = "https://github.com/ros2-gbp/resource_retriever-release.git";
          rev = "166d51c2d9ca0945f10cefd11cd297070df35441";
          hash = "sha256-4AAFxIDglM7VEU+89FD+HxbyOvhdxVOgFORV6aQuEPw=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "VCS_URL https://github.com/curl/curl.git";
            to = "VCS_TYPE path VCS_URL ${sources."libcurl_vendor/curl"}";
          }
        ];
      };
      "libcurl_vendor/curl" = substituteSource {
        src = fetchgit {
          name = "curl-source";
          url = "https://github.com/curl/curl.git";
          rev = "801bd5138ce31aa0d906fa4e2eabfc599d74e793";
          hash = "sha256-4w15NHw3D+YBuK02ZIZqvGaWgyQVc61MZ34pkLu0Oug=";
        };
      };
    });
  };
  meta = {
    description = "Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.";
  };
})
