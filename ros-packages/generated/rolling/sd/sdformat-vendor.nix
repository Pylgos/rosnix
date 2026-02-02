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
  version = "0.3.3-1";
  src = finalAttrs.passthru.sources."sdformat_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "sdformat" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "sdformat" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_vendor" = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "5205ccaee939bf888bc24ba7663ce993a0df5d5e";
        hash = "sha256-rCCS4hmg9eQOeSxfDnoT6G98j53LDsS80JE4cFyoRFw=";
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
    description = "\n    Vendor package for: sdformat 16.0.1\n\n    SDFormat is an XML file format that describes environments, objects, and robots\nin a manner suitable for robotic applications\n  ";
  };
})
