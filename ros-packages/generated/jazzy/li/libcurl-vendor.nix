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
  version = "3.4.4-1";
  src = finalAttrs.passthru.sources."libcurl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "file" "pkg-config" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "curl" "file" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcurl_vendor" = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "d80224e4c60400350b1ab8eb61c5f21f89bc1004";
        hash = "sha256-M+K21ePHbgoPmczHCsZKn6dr2G8WvONNTFoAX5O4OGQ=";
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
  meta = {
    description = "\n    Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
