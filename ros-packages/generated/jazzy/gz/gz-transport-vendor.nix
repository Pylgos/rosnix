{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_transport_vendor";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."gz_transport_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-transport13" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-transport13" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_transport_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "78468ba11ff878eb3f3bb1ff43dbbe0879955aa2";
        hash = "sha256-RloPJ0p4O0P/d54nKDbfFgC/wYLG87zOZ/FL2iHH5CQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_transport_vendor/gz-transport"}";
        }
      ];
    };
    "gz_transport_vendor/gz-transport" = substituteSource {
      src = fetchgit {
        name = "gz-transport-source";
        url = "https://github.com/gazebosim/gz-transport.git";
        rev = "18734a4cadd9c0930bd40ed1377da96c9b9a72b2";
        hash = "sha256-Iw8k/LNy4Uju+YFFvEV6hYzisPpv9h7/jhtf24i4jnY=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-transport13 13.5.0\n\n    Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.\n  ";
  };
})
