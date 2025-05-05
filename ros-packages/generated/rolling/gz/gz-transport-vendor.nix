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
  version = "0.2.1-1";
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
        rev = "a24341156ca0b62bd7a1c8d0122065c036fcb2f2";
        hash = "sha256-qBSB7wiOp6NAipwN3uvbQsscwQ+kcFGVY+snPCGc258=";
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
        rev = "c79276843edf4264e9b78d57b557f46e2e527b14";
        hash = "sha256-pSoadkpVaAEswmZuK13Y7PhxgvzTK1G2wI5+Fomlm/o=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-transport14 14.0.1\n\n    Gazebo Transport: Provides fast and efficient asynchronous message passing, services, and data logging.\n  ";
  };
})
