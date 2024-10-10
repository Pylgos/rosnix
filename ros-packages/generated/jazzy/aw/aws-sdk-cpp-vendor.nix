{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  buildPackages,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "aws_sdk_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/aws_sdk_cpp_vendor-release.git";
        rev = "41c63dd8468ba63aab2d7669694a8f32637fa771";
        hash = "sha256-y9V12GcuRTRxl5BbMVNzmPIoC3qIhoGQhgK3kjmd1xs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/aws/aws-sdk-cpp.git";
          to = "VCS_TYPE path VCS_URL ${sources."aws_sdk_cpp_vendor/aws-sdk-cpp"}";
        }
      ];
    };
    "aws_sdk_cpp_vendor/aws-sdk-cpp" = substituteSource {
      src = fetchgit {
        name = "aws-sdk-cpp-source";
        url = "https://github.com/aws/aws-sdk-cpp.git";
        rev = "615458352b71fd29de142e01b8ecf293fcd08a88";
        hash = "sha256-P44Q84E6tVyV6sGcB7Z3+/lnAtR65X4JIws6T/+7a+Q=";
      };
      substitutions = [
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/bagder/curl.git";
          to = "URL ${sources."aws_sdk_cpp_vendor/aws-sdk-cpp/curl"}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/openssl/openssl.git";
          to = "URL ${sources."aws_sdk_cpp_vendor/aws-sdk-cpp/openssl"}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "URL https://sdk.amazonaws.com/cpp/builds/zlib-1.2.11.tar.gz";
          to = "URL ${sources."aws_sdk_cpp_vendor/aws-sdk-cpp/zlib-1"}";
        }
      ];
    };
    "aws_sdk_cpp_vendor/aws-sdk-cpp/curl" = substituteSource {
      src = fetchgit {
        name = "curl-source";
        url = "https://github.com/bagder/curl.git";
        rev = "44b9b4d4f56d6f6de92c89636994c03984e9cd01";
        hash = "sha256-hoUw0d2nRKdQpAtZzn4Q0a2i++VLHfkJ7weAy8VQu0c=";
      };
      substitutions = [
      ];
    };
    "aws_sdk_cpp_vendor/aws-sdk-cpp/openssl" = substituteSource {
      src = fetchgit {
        name = "openssl-source";
        url = "https://github.com/openssl/openssl.git";
        rev = "e2e09d9fba1187f8d6aafaa34d4172f56f1ffb72";
        hash = "sha256-NYLD6ShRq0sIQ9amr0CVKWqTL4qbONf07c4n0eXcmIY=";
      };
      substitutions = [
        {
          path = "Configure";
          from = "#! /usr/bin/env perl";
          to = "#!${buildPackages.perl}/bin/perl";
        }
      ];
    };
    "aws_sdk_cpp_vendor/aws-sdk-cpp/zlib-1" = substituteSource {
      src = fetchzip {
        name = "zlib-1-source";
        url = "https://sdk.amazonaws.com/cpp/builds/zlib-1.2.11.tar.gz";
        hash = "sha256-AQIoy96jcdmKs/F4GVqDFXxcZ7c66GF+yalHg3ALEyU=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "aws_sdk_cpp_vendor";
  version = "0.2.1-3";
  src = finalAttrs.passthru.sources."aws_sdk_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A vendor package for aws-sdk-cpp";
  };
})
