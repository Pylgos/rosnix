{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    aws-sdk-cpp-vendor_source-615458352b71fd29de142e01b8ecf293fcd08a88 = substituteSource {
      src = fetchgit {
        name = "aws-sdk-cpp-vendor_source-615458352b71fd29de142e01b8ecf293fcd08a88-source";
        url = "https://github.com/aws/aws-sdk-cpp.git";
        rev = "615458352b71fd29de142e01b8ecf293fcd08a88";
        hash = "sha256-P44Q84E6tVyV6sGcB7Z3+/lnAtR65X4JIws6T/+7a+Q=";
      };
      substitutions = [
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/bagder/curl.git";
          to = "URL ${curl-vendor_source-44b9b4d4f56d6f6de92c89636994c03984e9cd01}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/openssl/openssl.git";
          to = "URL ${openssl-vendor_source-e2e09d9fba1187f8d6aafaa34d4172f56f1ffb72}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "URL https://sdk.amazonaws.com/cpp/builds/zlib-1.2.11.tar.gz";
          to = "URL ${zlib-1-vendor_source-098k1dq86ix9r5z63s1snxkmqz0mhdd1jy7inf5djwd3vv5jh0h1}";
        }
      ];
    };
    aws_sdk_cpp_vendor-a14ef6b13a8f54a7837b87fdfe694547ebfc079c = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-a14ef6b13a8f54a7837b87fdfe694547ebfc079c-source";
        url = "https://github.com/ros2-gbp/aws_sdk_cpp_vendor-release.git";
        rev = "a14ef6b13a8f54a7837b87fdfe694547ebfc079c";
        hash = "sha256-y9V12GcuRTRxl5BbMVNzmPIoC3qIhoGQhgK3kjmd1xs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/aws/aws-sdk-cpp.git";
          to = "VCS_TYPE path VCS_URL ${aws-sdk-cpp-vendor_source-615458352b71fd29de142e01b8ecf293fcd08a88}";
        }
      ];
    };
    curl-vendor_source-44b9b4d4f56d6f6de92c89636994c03984e9cd01 = substituteSource {
      src = fetchgit {
        name = "curl-vendor_source-44b9b4d4f56d6f6de92c89636994c03984e9cd01-source";
        url = "https://github.com/bagder/curl.git";
        rev = "44b9b4d4f56d6f6de92c89636994c03984e9cd01";
        hash = "sha256-hoUw0d2nRKdQpAtZzn4Q0a2i++VLHfkJ7weAy8VQu0c=";
      };
      substitutions = [
      ];
    };
    openssl-vendor_source-e2e09d9fba1187f8d6aafaa34d4172f56f1ffb72 = substituteSource {
      src = fetchgit {
        name = "openssl-vendor_source-e2e09d9fba1187f8d6aafaa34d4172f56f1ffb72-source";
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
    zlib-1-vendor_source-098k1dq86ix9r5z63s1snxkmqz0mhdd1jy7inf5djwd3vv5jh0h1 = substituteSource {
      src = fetchzip {
        name = "zlib-1-vendor_source-098k1dq86ix9r5z63s1snxkmqz0mhdd1jy7inf5djwd3vv5jh0h1-source";
        url = "https://sdk.amazonaws.com/cpp/builds/zlib-1.2.11.tar.gz";
        hash = "sha256-AQIoy96jcdmKs/F4GVqDFXxcZ7c66GF+yalHg3ALEyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aws_sdk_cpp_vendor";
  version = "0.2.1-2";
  src = sources.aws_sdk_cpp_vendor-a14ef6b13a8f54a7837b87fdfe694547ebfc079c;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A vendor package for aws-sdk-cpp";
  };
}
