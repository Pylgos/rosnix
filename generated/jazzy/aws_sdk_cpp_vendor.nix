{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  openssl,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    aws_sdk_cpp_vendor = substituteSource {
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
          to = "VCS_TYPE path VCS_URL ${aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0}";
        }
      ];
    };
    aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0 = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-source";
        url = "https://github.com/aws/aws-sdk-cpp.git";
        rev = "615458352b71fd29de142e01b8ecf293fcd08a88";
        hash = "sha256-P44Q84E6tVyV6sGcB7Z3+/lnAtR65X4JIws6T/+7a+Q=";
      };
      substitutions = [
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/bagder/curl.git";
          to = "URL ${aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-curl-2}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/openssl/openssl.git";
          to = "URL ${aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-openssl-1}";
        }
        {
          path = "tools/android-build/CMakeLists.txt";
          from = "URL https://sdk.amazonaws.com/cpp/builds/zlib-1.2.11.tar.gz";
          to = "URL ${aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-zlib-1-0}";
        }
      ];
    };
    aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-curl-2 = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-curl-2-source";
        url = "https://github.com/bagder/curl.git";
        rev = "44b9b4d4f56d6f6de92c89636994c03984e9cd01";
        hash = "sha256-hoUw0d2nRKdQpAtZzn4Q0a2i++VLHfkJ7weAy8VQu0c=";
      };
      substitutions = [
      ];
    };
    aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-openssl-1 = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-openssl-1-source";
        url = "https://github.com/openssl/openssl.git";
        rev = "e2e09d9fba1187f8d6aafaa34d4172f56f1ffb72";
        hash = "sha256-NYLD6ShRq0sIQ9amr0CVKWqTL4qbONf07c4n0eXcmIY=";
      };
      substitutions = [
      ];
    };
    aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-zlib-1-0 = substituteSource {
      src = fetchzip {
        name = "aws_sdk_cpp_vendor-vendor_source-aws-sdk-cpp-0-vendor_source-zlib-1-0-source";
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
  version = "0.2.1-3";
  src = sources.aws_sdk_cpp_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package curl ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A vendor package for aws-sdk-cpp";
  };
}
