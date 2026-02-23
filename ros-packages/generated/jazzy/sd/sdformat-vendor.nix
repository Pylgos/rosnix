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
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdfdom,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_vendor";
  version = "0.0.11-1";
  src = finalAttrs.passthru.sources."sdformat_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "sdformat14" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "sdformat14" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_vendor" = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "add6c9668e465ebd636c08716501329383c541ff";
        hash = "sha256-i8oVA8vGztyetwwzh1CaLsvMDGGVWe4cXUSU1BL6yCs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."sdformat_vendor/sdformat"}";
        }
      ];
    };
    "sdformat_vendor/sdformat" = substituteSource {
      src = fetchgit {
        name = "sdformat-source";
        url = "https://github.com/gazebosim/sdformat.git";
        rev = "4eb45276dcd4a6702144f0630454b7bb40dc5796";
        hash = "sha256-UPvUO82JmvLvboDgybT4eiXqk8OFoN9PjlhdNj9Jvig=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: sdformat14 14.9.0\n\n    SDFormat is an XML file format that describes environments, objects, and robots\nin a manner suitable for robotic applications\n  ";
  };
})
