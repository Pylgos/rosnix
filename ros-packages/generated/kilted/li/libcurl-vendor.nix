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
  version = "3.7.1-1";
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
        rev = "6c818d02a44830b1eb0539994203822eccddec99";
        hash = "sha256-QAzhQ43+5AwyQILLuD5OO+F2itw+iNzD1zJQ24+2+IQ=";
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
        rev = "7161cb17c01dcff1dc5bf89a18437d9d729f1ecd";
        hash = "sha256-LyUtbu4EqdcXpDmIVZdtxXzSJF5QCY5TsttAD9z0Xu4=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
