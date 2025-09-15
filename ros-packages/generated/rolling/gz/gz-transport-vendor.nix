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
  zenoh-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_transport_vendor";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."gz_transport_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-transport" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-transport" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_transport_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "cb112be5813027cb3e4e5045256a87e83c5c99f0";
        hash = "sha256-pOnqt2b0yx23A8Lz7sl8pHs+cKtDRRN40/SUGHslHfk=";
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
        rev = "b462b3f08f88cbdee47daad70472da74ddd6d28f";
        hash = "sha256-BEuz/3YYMpCxYWbmmoqurvFeM5aaIiTECfLgcEtY1e4=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-transport 15.0.0\n\n    Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.\n  ";
  };
})
