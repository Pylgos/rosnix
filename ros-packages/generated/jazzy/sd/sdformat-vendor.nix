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
  version = "0.0.8-1";
  src = finalAttrs.passthru.sources."sdformat_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "sdformat14" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_vendor" = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "c0f45fccf0e12f0b45aaffb566f05501d2e97b04";
        hash = "sha256-NN3lpUn4gwOTgnKMwCpveIyeSnCzFpjtCBCiXAfX1h8=";
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
        rev = "993d04fb95a6b9cee44121ac6294a2da2493847d";
        hash = "sha256-rRX8A6jZWR8iz4oMqWtG2ZP1XnpDsUnbktlF8q9z47M=";
      };
    };
  });
  meta = {
    description = "Vendor package for: sdformat14 14.6.0 SDFormat is an XML file format that describes environments, objects, and robots in a manner suitable for robotic applications";
  };
})
