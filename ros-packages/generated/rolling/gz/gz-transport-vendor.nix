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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."gz_transport_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-transport14" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-transport14" "libsqlite3-dev" "libzmq3-dev" "pkg-config" "protobuf-dev" "pybind11-dev" "python3-dev" "python3-psutil" "python3-pytest" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_transport_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "ced832da9739bc3009e900222efeab2b3556aa5e";
        hash = "sha256-2D5/RELt6PxZyi/TQTro+xmVqrWNfSeev/OeKcGrcPo=";
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
        rev = "57eb756917a7e155606b57338bcce64b0c8d4cb8";
        hash = "sha256-45jD5lwNDJRJw8TKxCVBifKJYZ+NZcygSJozrynbs9g=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-transport14 14.1.0\n\n    Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.\n  ";
  };
})
