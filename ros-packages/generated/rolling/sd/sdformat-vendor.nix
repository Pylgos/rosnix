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
  version = "0.2.3-2";
  src = finalAttrs.passthru.sources."sdformat_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor gz-utils-vendor urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "sdformat15" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_vendor" = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "ec1930a54ba4353d717e50b4d8f0060331837ac4";
        hash = "sha256-FGLS7UN/RIgpunqpUkVdtlH3KitcT8JBLNHEKvNP0VI=";
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
        rev = "cc524e7ebea952652aea3b03a95f13dc6416c563";
        hash = "sha256-4/0pVaev++v0+wHQiGeTl8XtTDzh2li32dND0EjfjwA=";
      };
    };
  });
  meta = {
    description = "Vendor package for: sdformat15 15.1.1 SDFormat is an XML file format that describes environments, objects, and robots in a manner suitable for robotic applications";
  };
})
