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
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_math_vendor";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."gz_math_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gz-math7" "pybind11-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_math_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_math_vendor-source";
          url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
          rev = "56e7988959298262402f973214e44b2bd12aa012";
          hash = "sha256-x0a5fJyaqkyaTXp8f3n6qY83Qf/iccVxgKXYQJn71dY=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
            to = "VCS_TYPE path VCS_URL ${sources."gz_math_vendor/gz-math"}";
          }
        ];
      };
      "gz_math_vendor/gz-math" = substituteSource {
        src = fetchgit {
          name = "gz-math-source";
          url = "https://github.com/gazebosim/gz-math.git";
          rev = "5072602c5ea8b8434a11d42f296aeedf1b695498";
          hash = "sha256-RxCZiU0h0skVPBSn+PMtkdwEabmTKl+0PYDpl9SQoq8=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: gz-math7 7.5.1 Gazebo Math : Math classes and functions for robot applications";
  };
})
